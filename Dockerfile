FROM python3.7

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /root/Project1/flask-rest

# Copying source files
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 8000 for container accessibility. You still have to add -p 8000:8000 to the docker run command
EXPOSE 8000
ENTRYPOINT ["python"]

# start the app.py file 
CMD ["run.py"]