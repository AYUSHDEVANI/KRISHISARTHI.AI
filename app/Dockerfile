# Base image for Rasa
FROM rasa/rasa:latest-full

# Copy project files into the Docker image
COPY . /app

# Set the working directory
WORKDIR /app

# Install required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port on which Rasa will run
EXPOSE 5005

# Start Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
