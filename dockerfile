FROM cgr.dev/chainguard/wolfi-base

RUN echo "https://packages.wolfi.dev/os" >> /etc/apk/repositories

RUN apk add --no-cache gnupg wget

RUN wget -O /etc/apk/keys/wolfi-signing.rsa.pub https://packages.wolfi.dev/os/wolfi-signing.rsa.pub

RUN apk add --no-cache \
      glibc-locale-en \
      openjdk-17-jre \
      openjdk-17-default-jvm 

ENV LANG=en_US.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk

RUN apk del --no-cache \
    gnupg \
    wget 

RUN rm -rf /var/cache/apk/*

# I couldn't remoove 'sh' via (apk del sh), so I'm doing it via disabling the execution permission
RUN chmod -x /bin/sh

