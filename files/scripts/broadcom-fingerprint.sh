#!/usr/bin/env bash

set -oue pipefail

dnf remove -y libfprint
dnf install -y libfprint-tod

FIRMWARE_URL="http://dell.archive.canonical.com/updates/pool/public/libf/libfprint-2-tod1-broadcom/libfprint-2-tod1-broadcom_5.15.285-5.15.010.0.orig.tar.gz"
FIRMWARE_DEST="/usr/share/fprint/fw"

mkdir -p "${FIRMWARE_DEST}"
curl -sL "${FIRMWARE_URL}" \
  | tar -xz --strip-components=5 \
      -C "${FIRMWARE_DEST}" \
      brcm_linux_fp/var/lib/fprint/fw
