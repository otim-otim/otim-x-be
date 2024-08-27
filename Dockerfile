# Step 1: Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy package.json and package-lock.json (or yarn.lock) into the container
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Install nodemon globally for hot-reloading
RUN npm install -g nodemon

# Step 6: Copy the rest of the application code into the container
COPY . .

# Step 7: Expose the port the app runs on
EXPOSE 3000

# Step 8: Start the app with nodemon for development
CMD ["nodemon", "-L", "--watch", "src", "--exec", "ts-node", "src/main.ts"]
