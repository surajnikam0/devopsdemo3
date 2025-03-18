# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Define the environment variable for Flask
ENV FLASK_APP=app.py

# Run the application
CMD ["python", "app.py"]

