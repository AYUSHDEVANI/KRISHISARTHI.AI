# Base image
FROM rasa/rasa:3.0.0-full

# Copy the Rasa files
COPY . /app

# Set the working directory
WORKDIR /app

# Expose port 5005 for the Rasa server
EXPOSE 5005

# Run Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*"]
