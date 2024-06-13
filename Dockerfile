# Stage 1 - Install dependencies and build the app in a build environment
FROM debian:latest AS build-env

# Install Flutter dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    unzip \
    libgconf-2-4 \
    gdb \
    libstdc++6 \
    libglu1-mesa \
    fonts-droid-fallback \
    lib32stdc++6 \
    python3 \
    sed && \
    apt-get clean

# Clone the Flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set Flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"

# Run Flutter doctor
RUN flutter doctor -v

# Switch to master channel and upgrade Flutter
RUN flutter channel master
RUN flutter upgrade

# Clone the app repository
RUN git clone https://github.com/QuillG/sommelio.git /app

# Set the working directory
WORKDIR /app

# Get dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine

# Copy the built web app to the NGINX html directory
COPY --from=build-env /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
