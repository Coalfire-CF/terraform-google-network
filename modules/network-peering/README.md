# Google Cloud Network Peering Terraform Module

This submodule allows creation of a [VPC Network Peering](https://cloud.google.com/vpc/docs/vpc-peering) between two networks.

The resources created/managed by this module are:

- one network peering from `local network` to `peer network`, which will be named `<prefix>-<local network name>-<peer network name>`
- one network peering from `peer network` to `local network`, which will be named `<prefix>-<peer network name>-<local network name>`