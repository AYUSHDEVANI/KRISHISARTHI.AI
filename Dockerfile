# FROM python:3.8-slim

# # Use Rasa base image
# FROM rasa/rasa:3.0.0

# # Set working directory
# WORKDIR /app


# COPY ./app/rasa /app/rasa


# # Copy the Flask app directory into the container
# COPY ./app/flask-app /app/flask-app
# USER root

# # Install Python dependencies for Flask
# RUN pip install --upgrade pip
# RUN pip install -r /app/flask-app/requirements.txt


# USER rasa

# # Expose ports for Rasa and Flask
# EXPOSE 5005 8000

# # Command to run Rasa and Flask simultaneously (or adjust as needed)
# # CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]

# # COPY ./app/start.sh /app/start.sh
# # RUN chmod +x /app/start.sh

# CMD ["rasa", "train"]

# CMD ["rasa", "run", "--enable-api", "--port", "5005"]

# Use the Rasa base image
FROM rasa/rasa:3.0.0

# Set working directory
WORKDIR /app

# Copy Rasa project files into the container
COPY ./app/rasa /app/rasa

# Copy Flask app files into the container (if needed)
COPY ./app/flask-app /app/flask-app

# Ensure Rasa dependencies are up to date
USER root
RUN pip install --upgrade pip && \
    pip install -r /app/rasa/requirements.txt

# Switch back to Rasa user
USER rasa

# Expose the ports for Rasa
EXPOSE 5005

# Command to start Rasa server
CMD ["run", "--enable-api", "--cors", "*", "--port", "5005"]
