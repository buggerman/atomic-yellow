# atomic-yellow &nbsp; [![build](https://github.com/buggerman/atomic-yellow/actions/workflows/build.yml/badge.svg)](https://github.com/buggerman/atomic-yellow/actions/workflows/build.yml)

Custom Fedora Cosmic Atomic image for the Dell Laptops, with working Broadcom fingerprint support (USB ID `0a5c:5843`).

Builds daily from `quay.io/fedora-ostree-desktops/cosmic-atomic:latest`.

## What's different

- `libfprint` replaced with `libfprint-tod` (TOD driver support)
- Broadcom TOD driver and firmware installed from Dell's upstream archive
- SELinux policy for the TOD driver included

## Installation

Start from any Fedora Atomic install (Cosmic Atomic recommended).

**Step 1** — initial rebase (unsigned, bootstraps the image and its signing policy):

```bash
sudo rpm-ostree rebase ostree-unverified-registry:docker://ghcr.io/buggerman/atomic-yellow:latest
```

Reboot, then **Step 2** — rebase to the signed transport:

```bash
sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/buggerman/atomic-yellow:latest
```

Reboot to complete.

## Verification

Images are signed with [cosign](https://github.com/sigstore/cosign). To verify:

```bash
cosign verify --key cosign.pub ghcr.io/buggerman/atomic-yellow
```
