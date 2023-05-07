FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock ./
RUN yarn --ignore-scripts


RUN yarn add bcrypt

# 👇️ if you use TypeScript
RUN yarn add --dev @types/bcryptjs
RUN yarn add node-gyp && yarn add bcrypt --force --build-from-source
RUN set NODE_OPTIONS=--max_old_space_size=8096
# Copy bcrypt package from host
# RUN cp -r node_modules/bcrypt /usr/src/app/node_modules

# Copy app source code
COPY . .

CMD ["yarn", "start"]