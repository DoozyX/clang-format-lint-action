FROM python:3-alpine

RUN apk update \
 && apk add git \
 && rm -rf /var/cache/apk/*

COPY run-clang-format.py /run-clang-format.py
COPY entrypoint.sh /entrypoint.sh
COPY clang-format/ /clang-format/

ENTRYPOINT ["/entrypoint.sh"]