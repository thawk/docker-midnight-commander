FROM alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/thawk/docker-midnight-commander.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN apk add --no-cache \
        openssh \
        mc

RUN mkdir -p /root/.local/share/mc/skins
COPY solarized.ini /root/.local/share/mc/skins/

ENV MC_SKIN=solarized

ENTRYPOINT ["/usr/bin/mc"]
