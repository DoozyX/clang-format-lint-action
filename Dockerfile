ARG CLANG_VERSION=9.0.0

FROM doozy/clang-format:${CLANG_VERSION} as clang-format-bin
FROM python:3-alpine

COPY --from=clang-format-bin /usr/bin/clang-format /usr/bin/
COPY run-clang-format.py /run-clang-format.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]