FROM ibmcom/websphere-traditional:latest-ubi
# put app and scripts and properties in /work/config
# put external library (e.g db driver) in /work/lib 
COPY --chown=was:root ./assets/app /work/app
COPY --chown=was:root ./assets/config /work/config
COPY --chown=was:root ./assets/lib /work/lib
RUN /work/configure.sh
