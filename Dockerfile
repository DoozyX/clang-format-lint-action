FROM python:3-alpine

ENV REVIEWDOG_VERSION=v0.14.1

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY run-clang-format.py /run-clang-format.py
COPY entrypoint.sh /entrypoint.sh
COPY clang-format/ /clang-format/

ENTRYPOINT ["/entrypoint.sh"]