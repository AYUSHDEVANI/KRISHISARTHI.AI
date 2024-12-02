# Use Rasa base image
FROM rasa/rasa:3.0.0

# Set working directory
WORKDIR /app

# Copy the Rasa directory into the container
COPY ./rasa /app/rasa

# Copy the Flask app directory into the container
COPY ./flask-app /app/flask-app

# Install Python dependencies for Flask
RUN pip install -r /app/flask-app/requirements.txt

# Expose Rasa and Flask ports
EXPOSE 5005 8000

# Default command to run Rasa server and Flask app
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
