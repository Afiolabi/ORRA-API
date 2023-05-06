FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock ./
RUN yarn install --ignore-scripts
RUN npm install -g node-gyp

RUN npm install bcrypt

# 👇️ if you use TypeScript
RUN npm install --save-dev @types/bcryptjs
# Copy bcrypt package from host
# RUN cp -r node_modules/bcrypt /usr/src/app/node_modules

# Copy app source code
COPY . .

CMD ["yarn", "start"]