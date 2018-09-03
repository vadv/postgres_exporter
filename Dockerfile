FROM scratch

COPY ./bin/postgres_exporter /postgres_exporter
COPY ./queries.yaml /queries.yaml

EXPOSE 9187

ENTRYPOINT [ "/postgres_exporter", "--extend.query-path", "/queries.yaml" ]
