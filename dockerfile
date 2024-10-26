# Use the official Node.js image as the base
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the files into the container
COPY . .

# Build the app for production
RUN npm run build

# Use a lightweight web server to serve the app
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build"]
 
