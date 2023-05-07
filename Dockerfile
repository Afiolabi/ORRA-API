FROM node:16-alpine as build

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

# Copy app source code
COPY . .

# Build the app
RUN yarn build

# Production image
FROM node:16-alpine

# Create app directory
WORKDIR /usr/src/app

# Install production dependencies only
COPY package.json yarn.lock ./
RUN yarn --prod --ignore-scripts

# Copy build artifacts from the previous stage
COPY --from=build /usr/src/app/dist ./dist

# Start the app
CMD ["yarn", "start"]
# FROM node:16-alpine

# # Create app directory
# WORKDIR /usr/src/app

# # Install app dependencies
# COPY package.json yarn.lock ./
# RUN yarn --ignore-scripts


# RUN yarn add bcrypt

# # 👇️ if you use TypeScript
# RUN yarn add --dev @types/bcryptjs
# RUN yarn add node-gyp && yarn add bcrypt --force --build-from-source
# RUN set NODE_OPTIONS=--max_old_space_size=8096
# # Copy bcrypt package from host
# # RUN cp -r node_modules/bcrypt /usr/src/app/node_modules
# RUN  yarn build
# # Copy app source code
# COPY . .

# CMD ["yarn", "start"]