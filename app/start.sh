#!/bin/bash

# Start Rasa server
/app/venv/bin/rasa run --enable-api --cors "*"

# Start Flask application
export FLASK_APP=/app/flask-app/app.py
/app/venv/bin/flask run --host=0.0.0.0 --port=5000
