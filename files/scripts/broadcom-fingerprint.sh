#!/usr/bin/env bash

set -oue pipefail

if rpm -q libfprint &>/dev/null; then
    dnf swap -y libfprint libfprint-tod
else
    dnf install -y libfprint-tod
fi

FIRMWARE_URL="http://dell.archive.canonical.com/updates/pool/public/libf/libfprint-2-tod1-broadcom/libfprint-2-tod1-broadcom_5.15.285-5.15.010.0.orig.tar.gz"
FIRMWARE_DEST="/usr/share/fprint/fw"

mkdir -p "${FIRMWARE_DEST}"
curl -sL "${FIRMWARE_URL}" \
  | tar -xz --strip-components=5 \
      -C "${FIRMWARE_DEST}" \
      brcm_linux_fp/var/lib/fprint/fw
