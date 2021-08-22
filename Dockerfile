# SECTION 1 - Normal Image
#FROM node:10-alpine

#3WORKDIR /app

#COPY . .

#EXPOSE 8080

#RUN npm install 

#CMD [ "npm", "start"]


# SECTION 2 - Second Section

#get a node image
FROM node

# set the working directory
WORKDIR /app

# copy your app file (from current directory web & api) to /app
COPY . /app

#expose 9090 (web) and 9090 (api/) ports
EXPOSE 9030
EXPOSE 9090

# run both wen and api servers
CMD node /app/web/server.js & node /app/api/server.js



# Section 3 - Docker Compose, Orchestrating Multiple Containers
















# Install the base requirements for the app.
# This stage is to support development.
#FROM python:alpine AS base
#WORKDIR /app
#COPY requirements.txt .
#RUN pip install -r requirements.txt

# Run tests to validate app
#FROM node:12-alpine AS app-base
#RUN apk add --no-cache python g++ make
#WORKDIR /app
#COPY app/package.json app/yarn.lock ./
#RUN yarn install
#COPY app/spec ./spec
#COPY app/src ./src
#RUN yarn test

# Clear out the node_modules and create the zip
#FROM app-base AS app-zip-creator
#RUN rm -rf node_modules && \
#    apk add zip && \
#    zip -r /app.zip /app

# Dev-ready container - actual files will be mounted in
#FROM base AS dev
#CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]

# Do the actual build of the mkdocs site
#FROM base AS build
#COPY . .
#RUN mkdocs build

# Extract the static content from the build
# and use a nginx image to serve the content
#FROM nginx:alpine
#COPY --from=app-zip-creator /app.zip /usr/share/nginx/html/assets/app.zip
#COPY --from=build /app/site /usr/share/nginx/html

