# python:3.6.9-slim
FROM python@sha256:c680e3cc5c639e829367d4dc3874d7bcbe5f4af3490dcd4d5db7069e9f5f3538

# Setup analysis user for docker
RUN groupadd -r analysis && \
    useradd -m --no-log-init --gid analysis analysis

USER analysis

ENV PATH "${PATH}:/home/analysis/.local/bin"
RUN python -m pip install --user dlint==0.9.2 flake8-json==19.8.0
COPY src /analyzer

# Setup entrypoint into the analysis code logic
WORKDIR /
CMD ["/analyzer/analyze.sh"]
