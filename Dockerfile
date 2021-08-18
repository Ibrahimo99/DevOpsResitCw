FROM node:14
# Create app directory
WORKDIR /home/ubuntu/DevOpsResitCw/

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]
