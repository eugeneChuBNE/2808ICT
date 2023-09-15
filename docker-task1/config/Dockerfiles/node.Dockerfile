FROM node:18

# Create app directory
WORKDIR /usr/src

# Clone the repo zip in internet
RUN apt-get update && apt-get install -y wget unzip

RUN wget https://formal-analysis.com/tmp/pizzeria.zip 

RUN unzip pizzeria.zip -d ./

RUN rm -rf pizzeria.zip

WORKDIR /usr/src/pizzeria

# Install app dependencies
RUN npm install

# Expose the port
EXPOSE 3000

# Run the app
CMD [ "npm", "start" ]