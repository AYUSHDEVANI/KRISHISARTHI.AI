# Use Rasa base image
FROM rasa/rasa:3.0.0

# Set working directory
WORKDIR /app

# Copy the Rasa directory into the container
COPY ./app/rasa /app/rasa

# Copy the Flask app directory into the container
COPY ./app/flask-app /app/flask-app

# Install Python dependencies for Flask
RUN pip install -r /app/flask-app/requirements.txt

# Expose ports for Rasa and Flask
EXPOSE 5005 8000

# Command to run Rasa and Flask simultaneously (or adjust as needed)
# CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]

COPY ./app/start.sh /app/start.sh
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]

