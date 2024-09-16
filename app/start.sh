# #!/bin/bash

# # Start Rasa server
# rasa run --enable-api --cors "*" &

# # Start Action server
# rasa run actions &

# # Start Flask app
# cd /app/flask-app
# flask run --host=0.0.0.0 --port=5000 &
# wait -n



# # Start Flask application
# # export FLASK_APP=/app/flask-app/app.py
# # /app/venv/bin/flask run --host=0.0.0.0 --port=5000

# # Exit when either Flask or Rasa stops
# exit $?


# Start the Flask app in the background
echo "Starting Flask app..."
cd /app/flask-app
flask run --host=0.0.0.0 --port=5000 &

# Start the Rasa action server in the background
echo "Starting Rasa action server..."
cd /app/rasa
rasa run actions --actions actions &

# Start the Rasa server
echo "Starting Rasa server..."
rasa run --enable-api --cors "*" --debug
