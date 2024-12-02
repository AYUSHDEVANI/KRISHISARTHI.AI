#!/bin/bash
rasa run --enable-api --cors "*" --port 5005 &
python /app/flask-app/app.py
