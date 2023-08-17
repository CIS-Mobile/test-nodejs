FROM node:18-alpine

RUN mkdir -p /usr/src/node-app

WORKDIR /usr/src/node-app

# Copy package.json and yarn.lock and install dependencies as root
COPY package.json yarn.lock ./
RUN yarn install --pure-lockfile

# Copy the source code and change ownership to the node user
COPY . .
RUN chown -R node:node /usr/src/node-app

# Switch to the node user and run the application
USER node

EXPOSE 3000
CMD ["npm", "start"]
