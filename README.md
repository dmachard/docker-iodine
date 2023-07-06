# Iodine Docker Image 

This *[Iodine](https://code.kryo.se/iodine/) Docker Image* is based on **Debian 12**.

Requirements to run this image:
- NET_ADMIN capability
- a TUN device passed through
- Network host mapped

## Supported tags and respective `Dockerfile` links

- [`0.8.0-r0`, `latest`](https://github.com/dmachard/docker-iodine/tree/main/0.8.0)

## How to use this image

Two modes of execution is available:
- `client`
- `server`

### Client mode

```
sudo docker run --cap-add=NET_ADMIN --device=/dev/net/tun --network=host -it dmachard/iodine:0.8.0 client
iodine IP over DNS tunneling client

Usage: iodine [-46fhrv] [-u user] [-t chrootdir] [-d device] [-P password]
              [-m maxfragsize] [-M maxlen] [-T type] [-O enc] [-L 0|1] [-I sec]
              [-z context] [-F pidfile] [nameserver] topdomain
```

### Server mode

```
sudo docker run --cap-add=NET_ADMIN --device=/dev/net/tun --network=host -it dmachard/iodine:0.8.0 server
Usage: iodined [-46cDfsv] [-u user] [-t chrootdir] [-d device] [-m mtu]
               [-z context] [-l ipv4 listen address] [-L ipv6 listen address]
               [-p port] [-n auto|external_ip] [-b dnsport] [-P password]
               [-F pidfile] [-i max idle time] tunnel_ip[/netmask] topdomain
```

## How to build

```
sudo docker build -t iodine .
```