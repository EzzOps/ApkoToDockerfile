# ApkoToDockerfile
this repo is just a try to reverse apko yaml file into dockerfile

## Step 1: Base Image

The Dockerfile starts by using the `cgr.dev/chainguard/wolfi-base` image as the base image. This image provides the base system for the container.
I use this image becuase `Wolfi` support glibc library instead of musl, so that I didn't choose alpine as a base image

## Step 2: Adding Repository

The Dockerfile adds the `https://packages.wolfi.dev/os` repository to the `/etc/apk/repositories` file. This repository will be used to install additional packages.
This is the package repo that contain all needed apk packages
like for example in apt repo Ex:
```
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main" \
    apt-get update \
    apt-get install -y kubectl \
```

## Step 3: Installing Packages

The Dockerfile installs the following packages using the `apk` package manager:

- `gnupg`: GNU Privacy Guard for secure communication and data encryption.
- `wget`: Command-line tool for downloading files from the web.

## Step 4: Downloading RSA Public Key

The Dockerfile downloads the RSA public key from `https://packages.wolfi.dev/os/wolfi-signing.rsa.pub` and saves it as `/etc/apk/keys/wolfi-signing.rsa.pub`. This key is used for package verification.

## Step 5: Installing Additional Packages

The Dockerfile installs the following additional packages using the `apk` package manager:

- `ca-certificates-bundle`: Bundle of CA certificates for secure communication.
- `wolfi-baselayout`: Base layout package for the container.
- `glibc-locale-en`: English locale support for the container.
- `openjdk-17-jre`: OpenJDK 17 JRE (Java Runtime Environment).
- `openjdk-17-default-jvm`: Default JVM (Java Virtual Machine) for OpenJDK 17.

## Step 6: Setting Environment Variables

The Dockerfile sets the following environment variables:

- `LANG`: Sets the default language to `en_US.UTF-8`.
- `JAVA_HOME`: Sets the Java home directory to `/usr/lib/jvm/java-17-openjdk`.

## Step 7: Cleaning Up

The Dockerfile removes the `/var/cache/apk/*` directory to clean up the package cache.


openjdk-11-11.0.22-r1
openjdk-11-dbg-11.0.22-r1
openjdk-11-default-jdk-11.0.22-r1
openjdk-11-default-jvm-11.0.22-r1
openjdk-11-demos-11.0.22-r1
openjdk-11-doc-11.0.22-r1
openjdk-11-jmods-11.0.22-r1
openjdk-11-jre-11.0.22-r1
openjdk-11-jre-base-11.0.22-r1
openjdk-11-jre-doc-11.0.19.5-r2
openjdk-11-jre-headless-17.0.5.8-r4

openjdk-17-17.0.10-r1
openjdk-17-dbg-17.0.10-r1
openjdk-17-default-jdk-17.0.10-r1
openjdk-17-default-jvm-17.0.10-r1
openjdk-17-demos-17.0.10-r1
openjdk-17-doc-17.0.10-r1
openjdk-17-jmods-17.0.10-r1
openjdk-17-jre-17.0.10-r1
openjdk-17-jre-base-17.0.10-r1


wolfi-base-1-r4
wolfi-baselayout-20230201-r7


ca-certificates-20230506-r1
ca-certificates-bundle-20230506-r1


zlib-1.3.1-r0
zlib-dev-1.3.1-r0
zlib-static-1.3.1-r0

openssl-3.2.1-r0
openssl-config-3.2.1-r0
openssl-dev-3.2.1-r0

libssl3-3.2.1-r0

libcrypt1-2.38-r11
libcrypto3-3.2.1-r0


apk-tools-2.14.0-r1
apk-tools-dev-2.14.0-r1

busybox-1.36.1-r6
busybox-full-1.36.1-r6

---
Wolfi base image
```
apk-tools               2.14.0-r1    apk   
busybox                 1.36.1-r6    apk   
ca-certificates-bundle  20230506-r1  apk   
glibc                   2.38-r11     apk   
glibc-locale-posix      2.38-r11     apk   
gnupg                   2.2.41-r1    apk   
ld-linux                2.38-r11     apk   
libcrypt1               2.38-r11     apk   
libcrypto3              3.2.1-r0     apk   
libssl3                 3.2.1-r0     apk   
openssl-config          3.2.1-r0     apk   
wget                    1.21.4-r1    apk   
wolfi-base              1-r4         apk   
wolfi-baselayout        20230201-r7  apk   
wolfi-keys              1-r6         apk   
zlib                    1.3.1-r0     apk
```e