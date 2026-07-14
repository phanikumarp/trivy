FROM alpine:3.24.1
RUN apk --no-cache add ca-certificates git && \
    addgroup -S trivy && adduser -S trivy -G trivy
ARG TARGETPLATFORM
COPY ${TARGETPLATFORM}/trivy /usr/local/bin/trivy
COPY contrib/*.tpl contrib/
USER trivy
ENTRYPOINT ["trivy"]
