# Use an official Python runtime as the base image
FROM python:3.9

# Install system dependencies
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev


# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip3 install  -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose the port that the Flask app will run on
EXPOSE 5000

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Set the command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
