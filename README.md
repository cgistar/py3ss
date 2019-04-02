# py3ss
python 3 55 docker Dockerfile

# build
```bash
docker build -t pyshadowsocks .
docker run -d -p 10086:443 --name pyssserv --restart unless-stopped pyshadowsocks -m chacha20-ietf-poly1305 -k yourpassword
```
