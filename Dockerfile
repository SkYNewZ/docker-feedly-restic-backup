FROM alpine

ARG BUILD_DATE

LABEL maintainer="Quentin Lemaire <quentin@lemairepro.fr>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.name="docker-feedly-restic-backup"
LABEL org.label-schema.description="Docker image to fetch OPML Feedly exports and backup it using Restic"
LABEL org.label-schema.url="https://github.com/SkYNewZ/docker-feedly-restic-backup"

COPY --from=skynewz/runitor /runitor /bin/runitor
COPY --from=skynewz/restic /restic /bin/restic
COPY --from=skynewz/feedly-opml-export /feedly-opml-export /bin/feedly-opml-export

RUN apk add --no-cache bash && \
  echo "Runitor: $(runitor --version)" && \
  echo "Restic: $(restic version)" && \
  echo "feedly-opml-export: $(feedly-opml-export version)"

USER 65534:65534
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY backup.sh /backup.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]