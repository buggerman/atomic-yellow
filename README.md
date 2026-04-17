# atomic-yellow &nbsp; [![build](https://github.com/buggerman/atomic-yellow/actions/workflows/build.yml/badge.svg)](https://github.com/buggerman/atomic-yellow/actions/workflows/build.yml)

An evolving custom Fedora Cosmic Atomic image, built daily from `quay.io/fedora-ostree-desktops/cosmic-atomic:latest`.

This is the base image. Hardware-specific variants are maintained in separate branches and built on top of this image.

## What's included

- RPMFusion (nonfree) with freeworld codecs (`libavcodec`, GStreamer plugins)
- VA-API support via `gstreamer1-vaapi`
- Power management via `thermald` and `tlp`

## Hardware variants

| Branch | Image | Description |
|--------|-------|-------------|
| [dell](https://github.com/buggerman/atomic-yellow/tree/dell) | `ghcr.io/buggerman/atomic-yellow-dell:latest` | Dell laptops with Broadcom fingerprint support |

## Installation

Start from any Fedora Atomic install ([Cosmic Atomic](https://www.fedoraproject.org/atomic-desktops/cosmic/download/) recommended).

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

## Image retention

A weekly cleanup workflow keeps the registry tidy:

- `latest` and any plain-numeric Fedora-version tag (e.g. `43`, `44`) are always retained.
- The 30 newest remaining versions are kept; older ones are deleted.
- Applies to both `atomic-yellow` and `atomic-yellow-dell`.

Run `cleanup-ghcr` manually from the Actions tab (with `dry_run: true`) to preview what would be removed before a scheduled run.
