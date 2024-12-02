# Use the official Rasa image as the base
FROM rasa/rasa:latest-full

# Copy your Rasa project into the Docker image
COPY . /app

# Set the working directory
WORKDIR /app

# Install dependencies (if any)
RUN pip install --no-cache-dir -r requirements.txt

# Expose Rasa port
EXPOSE 5005

# Start the Rasa server with API enabled
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
