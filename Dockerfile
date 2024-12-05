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
FROM rasa/rasa:3.6.20

# Set working directory
WORKDIR /app

# Copy Rasa project files
COPY ./app/rasa /app/rasa

# Switch to root for installation
USER root

# Install specific Rasa version
RUN pip install --no-cache-dir rasa==3.6.20

RUN pip install --no-cache-dir --upgrade setuptools


# Install dependencies from requirements.txt if present
RUN if [ -f /app/rasa/requirements.txt ]; then pip install --no-cache-dir -r /app/rasa/requirements.txt; fi

ENV PYTHONUNBUFFERED 1
ENV PYTHONWARNINGS "ignore"

# Copy models into the container
COPY ./app/rasa/models/ /app/rasa/models/

# Switch back to Rasa user
USER rasa

# Expose Rasa port
EXPOSE 5005

# Start the Rasa server
CMD ["run", "--enable-api", "--model", "/app/rasa/models/20241205-234108-daring-passenger.tar.gz"]


