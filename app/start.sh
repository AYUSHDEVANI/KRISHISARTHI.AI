#!/bin/bash

# Start Rasa server in the background
rasa run --enable-api --cors "*" &

# Start Flask app
exec flask run --host=0.0.0.0 --port=5000
