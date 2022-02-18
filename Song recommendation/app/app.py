from flask import Flask ,render_template , request , jsonify
import sqlalchemy as db
from sklearn.neighbors import NearestNeighbors
from sklearn.preprocessing import MultiLabelBinarizer
import pickle 
import pandas as pd
import pymysql
from sklearn.base import BaseEstimator, TransformerMixin 
import numpy as np

app = Flask(__name__)

host = "mydb"

user = "root"
passwd = "root"    
database = "srecommend"  

engine = db.create_engine(f'mysql+pymysql://{user}:{passwd}@{host}/{database}')
connection = engine.connect()
metadata = db.MetaData()
song_feature = db.Table('song_features', metadata, autoload=True, autoload_with=engine)



@app.route('/')
def index():
    return render_template('index.html')

@app.route('/recommendations', methods=['GET', 'POST'])
def recommendations():

    if request.method == 'POST' :
        id = request.form.get("search") 

        query = db.select([song_feature.columns.spotify_genre,song_feature.columns.danceability,song_feature.columns.skey,song_feature.columns.valence,song_feature.columns.tempo]).where(song_feature.columns.spotify_track_id == id)
        Result = connection.execute(query).fetchall()

      
        filename = 'transformer.pkl'
        transformer_reloaded = pickle.load(open(filename, 'rb'))
        columns = ['spotify_genre','danceability','skey','valence','tempo']

        df = pd.DataFrame(list(Result),columns=columns)
        df['spotify_genre'].iloc[0] = tuple(df['spotify_genre'].values[0].split(','))
   
        
        train_data = transformer_reloaded.transform(df)


        filename = 'finalmodel.pkl'
        knn_model_reloaded = pickle.load(open(filename, 'rb'))

        distance, indices  = knn_model_reloaded.kneighbors(train_data.reshape(1,train_data.shape[1]),n_neighbors = 7)
        query = db.select([song_feature.columns.spotify_track_id]).where(song_feature.columns.index1.in_(indices[0]))
        Result = connection.execute(query).fetchall()
        Result =  [i[0] for i in Result][1:]

        return render_template('recommendations.html', rec_list = Result ,selected = id)
    
   
class MultiHotEncoder(BaseEstimator, TransformerMixin):
    """Wraps `MultiLabelBinarizer` in a form that can work with `ColumnTransformer`.
    Note that input X has to be a `pandas.DataFrame`.
    """
    def __init__(self):
        self.mlbs = list()
        self.n_columns = 0
        self.categories_ = self.classes_ = list()

    def fit(self, X:pd.DataFrame, y=None):
        for i in range(X.shape[1]): # X can be of multiple columns
            mlb = MultiLabelBinarizer()
            mlb.fit(X.iloc[:,i])
            self.mlbs.append(mlb)
            self.classes_.append(mlb.classes_)
            self.n_columns += 1
        return self

    def transform(self, X:pd.DataFrame):
        if self.n_columns == 0:
            raise ValueError('Please fit the transformer first.')
        if self.n_columns != X.shape[1]:
            raise ValueError(f'The fit transformer deals with {self.n_columns} columns '
                             f'while the input has {X.shape[1]}.'
                            )
        result = list()
        for i in range(self.n_columns):
            result.append(self.mlbs[i].transform(X.iloc[:,i]))

        result = np.concatenate(result, axis=1)
        return result

    
   





@app.route('/searchbox', methods=['GET', 'POST'])
def search():

    if request.method == 'POST':

        value =  request.form.get('search')
        value = "%" + value + "%"
        query = db.select([song_feature.columns.artist,song_feature.columns.song,song_feature.columns.spotify_track_id]).where(song_feature.columns.song.like(value) ).limit(10)
        Result = connection.execute(query).fetchall()
        print(Result)
        print("###############")
        result = []
 
        for row in list(Result)[:10]:
            artist = row[0]
            song = row[1]
            SongFull = song + " - " + artist
            value = row[2]
            data = { "label" : SongFull,"value" :value}
            result.append(data)

    return jsonify(result)

    
if __name__ == '__main__':
    app.run(host = '0.0.0.0',port = 8080)
    