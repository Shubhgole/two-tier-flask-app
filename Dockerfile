#Getting base image of python
FROM python:3.9

#Working directory for container
WORKDIR app/

# install required packages for system
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

#Copy the code from local to container
COPY . .

#Run the requirements
RUN pip install mysqlclient
RUN pip install -r requirements.txt

#Expose port
EXPOSE 5000

#Run the application
CMD ["python", "app.py"]
