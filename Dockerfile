# Use the official Python image.
FROM python:3.9-slim

# Set the working directory.
WORKDIR /app

# Install system dependencies.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git curl && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install AI frameworks.
RUN pip install tensorflow keras

# Setup for dashboard.
COPY dashboard/ ./dashboard/
RUN cd dashboard && \
    pip install -r requirements.txt

# Copy the rest of the application code.
COPY . .

# Command to run the application.
CMD ["python", "app.py"]