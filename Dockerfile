# Use Rasa base image
FROM rasa/rasa:3.0.0

# Set working directory
WORKDIR /app

# Copy the Rasa directory into the container
COPY ./rasa /app/rasa

# Install Python dependencies for Rasa (if required)
RUN pip install -r /app/rasa/requirements.txt

# Expose Rasa port
EXPOSE 5005

# Default command to run Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
