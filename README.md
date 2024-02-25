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





