# Base image with Python 3.8
FROM python:3.10.0-slim

# Use the official Rasa image as the base
FROM rasa/rasa:3.6.20

# Set the working directory for Rasa
WORKDIR /app

# Copy Rasa project files into the container
COPY ./rasa /app/rasa

# Install additional Python dependencies for your Flask app
COPY ./flask-app /app/flask-app
# RUN pip install -r /app/flask-app/requirements.txt

# Create a virtual environment in the /app directory
RUN python -m venv /app/venv

# Upgrade pip and install Flask app dependencies inside the virtual environment
RUN /app/venv/bin/python -m pip install --upgrade pip && \
    /app/venv/bin/pip install -r /app/flask-app/requirements.txt

# Make sure the virtual environment is used by default
ENV PATH="/app/venv/bin:$PATH"

# Switch to root user to change permissions
# USER root

# Copy the start script into the container
COPY start.sh /app/start.sh

# Make the start script executable
RUN chmod +x /app/start.sh

# Expose necessary ports
EXPOSE 5000  
EXPOSE 5005  

# # Use the start script to run both Rasa and Flask
# # Set the entrypoint to start.sh
# ENTRYPOINT ["/app/start.sh"]

# Use the entrypoint script to start the services
ENTRYPOINT ["/app/start.sh"]