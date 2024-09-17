#!/bin/bash

# Start the Flask app in the background
echo "Starting Flask app..."
cd /app/flask-app
flask run --host=0.0.0.0 --port=5000 &

# Start the Rasa action server in the background
echo "Starting Rasa action server..."
cd /app/rasa
rasa run actions --port 5055 &

# Start the Rasa server
echo "Starting Rasa server..."
rasa run --enable-api --cors "*" --debug

