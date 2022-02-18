    FROM python:3

    #Set the working directory
    WORKDIR /usr/src/app

    #copy all the files
    COPY . .

    #Install the dependencies
    RUN apt-get -y update
    RUN python -m pip install --upgrade pip
    RUN pip3 install -r requirements.txt

    #Expose the required port
    EXPOSE 8080

    #Run the command
    CMD python app.py