# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY app/requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY app /app

# Expose the port the app runs on
EXPOSE 5005

# Command to run the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
