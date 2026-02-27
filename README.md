# atomic-yellow-dell &nbsp; [![build](https://github.com/buggerman/atomic-yellow/actions/workflows/build.yml/badge.svg?branch=dell)](https://github.com/buggerman/atomic-yellow/actions/workflows/build.yml)

Dell laptop variant of [atomic-yellow](https://github.com/buggerman/atomic-yellow), with working Broadcom fingerprint support (USB ID `0a5c:5843`).

Built on top of `ghcr.io/buggerman/atomic-yellow:latest` and triggered automatically after each successful base image build.

## What's added

- `libfprint` replaced with `libfprint-tod` (TOD driver support)
- Broadcom TOD driver and firmware installed from Dell's upstream archive
- SELinux policy for the TOD driver included
- Intel media driver (`intel-media-driver`) for hardware video acceleration

## Installation

Start from any Fedora Atomic install ([Cosmic Atomic](https://www.fedoraproject.org/atomic-desktops/cosmic/download/) recommended).

**Step 1** — initial rebase (unsigned, bootstraps the image and its signing policy):

```bash
sudo rpm-ostree rebase ostree-unverified-registry:docker://ghcr.io/buggerman/atomic-yellow-dell:latest
```

Reboot, then **Step 2** — rebase to the signed transport:

```bash
sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/buggerman/atomic-yellow-dell:latest
```

Reboot to complete.

## Verification

Images are signed with [cosign](https://github.com/sigstore/cosign). To verify:

```bash
cosign verify --key cosign.pub ghcr.io/buggerman/atomic-yellow-dell
```
