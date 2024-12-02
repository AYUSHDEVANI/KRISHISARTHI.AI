# Step 1: Use an official Python base image
FROM python:3.8-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the project files into the container
COPY . /app

# Step 4: Install system dependencies (if any are needed for Rasa)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
    

# Step 5: Install virtualenv to manage environments
RUN pip install virtualenv

# Step 6: Create a virtual environment inside the container
RUN virtualenv /app/venv

# Step 7: Activate the virtual environment and install Rasa
RUN /app/venv/bin/pip install rasa[full]

# Step 8: Ensure the models directory is correctly placed
# RUN mkdir -p /app/rasa/models



# Step 9: Expose the port on which Rasa runs
EXPOSE 5050

# Step 9: Default command to run Rasa when the container starts
CMD ["/app/venv/bin/rasa", "run", "--model", "/app/rasa/models", "--enable-api", "--cors", "*", "--port", "5050"]
