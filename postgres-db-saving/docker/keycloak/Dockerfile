FROM jboss/keycloak:12.0.4
USER root
RUN microdnf install -y nc bash && microdnf clean all
COPY scripts/run.sh .
RUN chmod ug+x run.sh && chown 1000:1000 run.sh
USER 1000
ENTRYPOINT ["./run.sh"]