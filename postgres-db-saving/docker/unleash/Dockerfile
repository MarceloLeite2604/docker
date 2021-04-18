FROM unleashorg/unleash-server:3.17.4-node14-alpine
USER root
RUN apk add --no-cache bash netcat-openbsd
COPY scripts/run.sh /unleash/run.sh
RUN chmod ug+x /unleash/run.sh && chown node /unleash/run.sh
USER node
ENTRYPOINT ["/unleash/run.sh"]
