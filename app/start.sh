#!/bin/bash

# Start the Flask app
# gunicorn --bind 0.0.0.0:5000 app:app &

# Start the Rasa server
rasa run --model /app/rasa/models --port 5005
