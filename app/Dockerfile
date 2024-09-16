# Use the official Rasa image as the base
FROM rasa/rasa:3.0.0

# Set the working directory for Rasa
WORKDIR /app

# Copy Rasa project files into the container
COPY ./rasa /app/rasa

# Install additional Python dependencies for your Flask app
COPY ./flask-app /app/flask-app
RUN pip install -r /app/flask-app/requirements.txt

# Create a virtual environment
RUN python -m venv /opt/venv

# Activate the virtual environment and install dependencies
RUN /opt/venv/bin/python -m pip install --upgrade pip && \
    /opt/venv/bin/pip install -r /app/flask-app/requirements.txt

# Make sure the virtual environment is used by default
ENV PATH="/opt/venv/bin:$PATH"

# Expose necessary ports
EXPOSE 5000  
EXPOSE 5005  

# Run Rasa and Flask app in the container
CMD ["sh", "-c", "rasa run -m /app/rasa/models --enable-api --cors '*' & python /app/flask-app/app.py"]


#