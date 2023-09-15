# Task 1

```bash
# 1. Create a network
docker network create server-network;

# 2. Create a volume
docker volume create volume-node;
docker volume create volume-mongo;
docker volume create volume-mongo-tmp;

# 3. Build images
docker build -t node-image:1 - < ./config/Dockerfiles/node.Dockerfile;
docker build -t nginx-image:1 - < ./config/Dockerfiles/nginx.Dockerfile;

# 4. Run containers
docker run -d --restart always --name mongo --hostname mongo-container --network server-network --env-file ./.env --read-only -v ./config/mongo/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js -v volume-mongo:/data/db -v volume-mongo-tmp:/tmp/ mongo;

docker run -d --restart always --name node-container --hostname node --network server-network --env-file ./.env  -v volume-node:/usr/src/app node-image:1;

docker run -d --name nginx-container --hostname nginx --network server-network -p 80:80 -p 443:443 -v ./config/nginx/default.conf:/etc/nginx/conf.d/default.conf -v ./config/nginx/ssl:/etc/nginx/ssl nginx-image:1;

```



# Task 2
```
docker-compose up -d
```