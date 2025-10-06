# Dockerfile content goes here

# Use the official Android image as a parent image
FROM android:latest

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies
RUN ./gradlew build

# Command to run when starting the container
CMD ["./gradlew", "assembleDebug"]