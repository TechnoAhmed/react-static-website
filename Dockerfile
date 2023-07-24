# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the React application
RUN npm run build

# Expose the port on which the application will run (if applicable)
# Change <PORT_NUMBER> to the actual port number used by the application
EXPOSE <PORT_NUMBER>

# Specify the command to serve the application (if using npm)
# CMD ["npm", "start"]

# If using serve package to serve the built static files
RUN npm install -g serve

# Specify the command to serve the application using serve
CMD ["serve", "-s", "build", "-l", "<PORT_NUMBER>"]
