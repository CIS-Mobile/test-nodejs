FROM node:18-alpine

RUN mkdir -p /usr/src/node-app

WORKDIR /usr/src/node-app

# Copy package.json, yarn.lock, and ecosystem.config.json, then install dependencies as root
COPY package.json yarn.lock ecosystem.config.json ./
RUN yarn install --pure-lockfile

# Copy the source code and change ownership to the node user
# COPY . . # not relevant when mounting a volume
RUN chown -R node:node /usr/src/node-app

# Switch to the node user and run the application
USER node

EXPOSE 4000
CMD ["npm", "start"]
