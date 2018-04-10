FROM    alpine:latest

RUN     apk add --no-cache \
            build-base \
            ca-certificates \
            libffi-dev \
            openssl-dev \
            python3-dev && \
        pip3 install \
            --no-cache-dir \
            ansible && \
        apk del \
            build-base \
            ca-certificates

WORKDIR /src

CMD     ansible
