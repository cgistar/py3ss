FROM alpine:3.9
MAINTAINER daiqing

ENV MAGICK_HOME=/usr
RUN apk add --update --no-cache \
    git \
    python3-dev \
    libsodium

RUN python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -rf /var/cache/apk/* && \
    rm -rf ~/.cache

RUN pip install git+https://github.com/shadowsocks/shadowsocks.git@master

WORKDIR /bootstrap
COPY entrypoint.sh .

EXPOSE 443
ENTRYPOINT [ "sh", "entrypoint.sh" ]
