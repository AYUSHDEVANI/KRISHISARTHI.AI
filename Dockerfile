# Use the official Rasa image as the base
# FROM rasa/rasa:3.1.1-full
# Use a base image with Python 3.10
FROM python:3.10-slim

# Set the working directory for Rasa
WORKDIR /app

# Copy Rasa project files into the container
COPY ./rasa /abc.ai/app/rasa

# Install additional Python dependencies for Flask app
COPY ./flask-app /abc.ai/app/flask-app

# Create a virtual environment in the /app directory
RUN python3.10 -m venv /app/venv

# Upgrade pip and install dependencies
RUN /app/venv/bin/python -m pip install --upgrade pip
RUN /app/venv/bin/pip install -r /app/flask-app/requirements.txt

# Install Rasa dependencies
# RUN /app/venv/bin/pip install -r /app/rasa/requirements.txt

# Make sure the virtual environment is used by default
ENV PATH="/app/venv/bin:$PATH"

# Copy custom action files


# Switch to root user to change permissions
USER root

COPY ./rasa/actions/actions.py /abc.ai/app/rasa/actions/actions.py

# Copy the start script into the container
COPY start.sh /abc.ai/app/start.sh

# Make the start script executable
RUN chmod +x /abc.ai/app/start.sh

# Expose necessary ports
EXPOSE 5000  
EXPOSE 5005  

# Use the entrypoint script to start both Rasa and Flask
ENTRYPOINT ["/abc.ai/app/start.sh"]
