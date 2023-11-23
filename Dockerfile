# Use a different base image
FROM python:3.9-slim-buster

# Install required packages
RUN apt-get update && \
  apt-get install -y ffmpeg openjdk-11-jdk && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*



# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
