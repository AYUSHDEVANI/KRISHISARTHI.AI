#!/bin/bash

# Start Rasa server in the background
rasa run --enable-api --cors "*" --port 5005 &

# Start Flask app
flask run --host=0.0.0.0 --port 5000
