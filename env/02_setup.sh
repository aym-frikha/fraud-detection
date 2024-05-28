#!/bin/bash

sudo apt update && apt upgrade -y

lxd init --auto
lxc network set lxdbr0 ipv6.address none

sudo snap install juju --channel 3.4/stable

juju bootstrap localhost local

# KAFKA
juju add-model kafka
juju deploy -n 1 zookeeper -m kafka
juju deploy -n 1 kafka -m kafka
juju relate kafka zookeeper
juju deploy self-signed-certificates --config ca-common-name="Test CA" -m kafka
juju relate zookeeper self-signed-certificates
juju relate kafka:certificates self-signed-certificates


juju status --watch 5s

juju run kafka/leader get-admin-credentials

#POSTGRESQL
juju add-model db
juju deploy postgresql -n2 -m db
juju deploy self-signed-certificates --config ca-common-name="Tutorial CA" -m db
juju integrate postgresql self-signed-certificates -m db

