Docker image for NodeJS microservices

## Usage
- DockerFile

```
FROM kmade/noker:latest

EXPOSE 8000
EXPOSE 5858

# Install nodemon
RUN npm install -g nodemon
# Provides cached layer for node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src/

# Define working directory
WORKDIR /src
ADD . /src
CMD ["npm", "start:dev"]
```

- package.json

```json
"scripts": {
  "start:dev": "nodemon --watch ./ --inspect=0.0.0.0:5858 index.js"
},
```

## VCode debugger

```json
{
  "name": "Attach",
  "type": "node",
  "request": "attach",
  "protocol": "inspector",
  "port": 5858,
  "address": "0.0.0.0",
  "restart": false,
  "sourceMaps": false,
  "outDir": null,
  "localRoot": "${workspaceRoot}/",
  "remoteRoot": "/src/"
}
```
