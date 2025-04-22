# Base image for Python
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy project files into the container
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libasound2-dev \
    portaudio19-dev \
    libportaudio2 \
    libportaudiocpp0 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 5001

# Command to run the application
CMD ["python", "app.py"]