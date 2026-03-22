#!/usr/bin/env bash

set -oue pipefail

if [ "$(uname -m)" = "x86_64" ]; then
    systemctl enable thermald.service
fi
