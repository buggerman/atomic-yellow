#!/usr/bin/env bash

set -oue pipefail

rpm-ostree override remove libfprint --install=libfprint-tod
