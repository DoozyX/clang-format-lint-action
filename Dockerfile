FROM doozy/clang-format:latest as clang-format-bin
FROM python:3-alpine

COPY --from=clang-format-bin /usr/bin/clang-format /usr/bin/
COPY run-clang-format.py /run-clang-format.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]