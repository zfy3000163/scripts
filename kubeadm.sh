#!/bin/bash

kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version stable
