# Use the official nginx image as the base
FROM nginx:latest

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the assets folder to the web root
COPY assets .

# Copy the contents of the 'src' directory to the web root
COPY src .

# Expose the default nginx port
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]