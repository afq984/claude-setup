#!/bin/bash
set -eux

# Install bazelisk
curl -fsSL -o /usr/local/bin/bazelisk \
  https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64
chmod +x /usr/local/bin/bazelisk
ln -sf /usr/local/bin/bazelisk /usr/local/bin/bazel

# Point Bazel's embedded JDK to the system trust store (has proxy CA certs)
echo 'startup --host_jvm_args=-Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts' > ~/.bazelrc
