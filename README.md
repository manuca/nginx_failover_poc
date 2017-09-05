# Experiment with Nginx to handle failing backend servers

Create a Docker network

```
docker create network nut
```

Build images for both backend server and nginx:

```
cd server && docker build -t server .
cd nginx && docker build -t nginx .
```

Start services:

```
docker run --rm --name c1 --network nut -e name=c1 server rackup -E production
docker run --rm --name c2 --network nut -e name=c2 server rackup -E production
docker run --rm --name nginx --network nut -p 80:80 nginx
```

If you kill `c1` (the main backend) with:

`docker stop c1`

You'll notice requests go yo `c2`.
