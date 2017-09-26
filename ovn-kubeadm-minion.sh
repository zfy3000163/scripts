#!/bin/bash

NODE_NAME=m1

CENTRAL_IP=
LOCAL_IP=

ovs-vsctl set Open_vSwitch . external_ids:ovn-remote="tcp:$CENTRAL_IP:6642" \
  external_ids:ovn-nb="tcp:$CENTRAL_IP:6641" \
  external_ids:ovn-encap-ip="$LOCAL_IP" \
  external_ids:ovn-encap-type="geneve"

ovnkube --init-node $NODE_NAME \
	--kubeconfig $HOME/.kube/config

