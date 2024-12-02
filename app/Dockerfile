# Use the official Rasa base image
FROM rasa/rasa:latest-full

# Set environment variables
ENV RASA_ENV production

# Copy project files into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Install additional Python dependencies if needed
RUN pip install --no-cache-dir -r requirements.txt || true

# Expose the default Rasa port
EXPOSE 5005

# Command to run Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
