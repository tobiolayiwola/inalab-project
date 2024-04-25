# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable for the port (if needed)
ENV PORT 5000
# Optionally, set a default greeting environment variable (can be overridden)
ENV GREETING Hello, World!

# Command to run the application
CMD ["python", "app.py"]