#1. Use specific and minimal base image
FROM node:20-alpine

#2. Set working directory inside the container
WORKDIR /app

#3. Copy dependencies first for better caching
COPY package*.json ./

#4. Install only production dependencies
RUN npm install --omit=dev

#5. Copy the rest of the application code
COPY . .

#6. Expose the port the app runs on
EXPOSE 3000

#7. Run as non-root user for better security
USER node

#8. Define the startup command
CMD [ "node", "server.js" ]