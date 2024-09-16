#!/bin/bash

# Start Rasa server in the background
rasa run -m /app/rasa/models --enable-api --cors '*' &

# Start Flask app
python /app/flask-app/app.py
