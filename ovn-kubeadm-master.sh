#!/bin/bash

NODE_NAME=master

CENTRAL_IP=
LOCAL_IP=

CLUSTER_IP_SUBNET=192.168.0.0/16
MASTER_SWITCH_SUBNET=192.168.1.0/24

ovs-vsctl set Open_vSwitch . external_ids:ovn-remote="tcp:$CENTRAL_IP:6642" \
  external_ids:ovn-nb="tcp:$CENTRAL_IP:6641" \
  external_ids:ovn-encap-ip="$LOCAL_IP" \
  external_ids:ovn-encap-type="geneve"

ovs-vsctl set Open_vSwitch . external_ids:k8s-api-server="127.0.0.1:8080"

ovnkube --init-master $NODE_NAME \
	--kubeconfig $HOME/.kube/config \
	--cluster-subnet $CLUSTER_IP_SUBNET \
	--net-controller

