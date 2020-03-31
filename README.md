# ubi-awscli
[![Docker Repository on Quay](https://quay.io/repository/davivcgarcia/ubi-awscli/status "Docker Repository on Quay")](https://quay.io/repository/davivcgarcia/ubi-awscli)

Unofficial image for AWS CLI based on Red Hat Universal Base Image v8

## Why another image?

This image was build using the [Red Hat Universal Base Image (UBI) 8](https://developers.redhat.com/products/rhel/ubi/), which provides a stable foundation to workloads running on mission-critical environments, specially on **Red Hat OpenShift Container Platform**.

## How to use?

If you running standalone containers, you can use `podman` or `docker` with:

```bash
podman run -it quay.io/davivcgarcia/ubi-awscli aws help
```

## Any support?

This is a community project, not backed nor supported by Red Hat.
