# Use Rasa's official image
FROM rasa/rasa:3.4.0  
# Replace with your Rasa version

# Copy project files into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Install action server dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Rasa server port
EXPOSE 5005

# Run the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
