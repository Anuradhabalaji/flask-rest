# In the first part of our Dockerfile, we define the base Docker Image we want to use for the container.
FROM python:3-alpine

# We add Python to our Docker Image
#RUN apk add --update python3 py3-pip

# move data to the image. Left is location on your machine, right is location in the container
COPY requirements.txt requirements.txt
COPY . .

# Install app dependencies - rerun when you edit requirements.txt
RUN pip install -r requirements.txt

USER

# Expose port 8000 for container accessibility. You still have to add -p 8000:8000 to the docker run command
EXPOSE 8000
ENTRYPOINT ["python"]

# start the app.py file
CMD ["run.py"]