#!/bin/bash
# This script cleans up the docker install of ranch.
# Warning: It NUKES EVERYTHING
# run with sudo
rm -rf rancher/
docker container rm docker-rancher-manager-1