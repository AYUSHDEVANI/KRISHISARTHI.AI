# Use the official Rasa SDK image as a base image
FROM rasa/rasa:3.6.20-full

# Set the working directory inside the container
WORKDIR /app

# Copy all app files into the container
COPY . .

# Install additional dependencies if needed (Flask, Gunicorn, etc.)
RUN pip install --no-cache-dir -r requirements.txt

# Expose necessary ports
EXPOSE 5000 5005

# Set the environment for production
ENV FLASK_ENV=production
ENV PYTHONUNBUFFERED=1

# Run both Flask and Rasa together using Gunicorn for Flask
CMD ["sh", "-c", "rasa run -m models --enable-api --cors '*' --debug & gunicorn --workers 4 --bind 0.0.0.0:5000 app:app"]
