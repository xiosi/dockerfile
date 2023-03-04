all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build              - build all images"
	# @echo "   1. make pull             - pull all images"
	@echo "   1. make clean              - remove all images"
	@echo ""

build:
	@docker build --tag xiosi/root:fastfcn -f fastfcn/dockerfile fastfcn
build-segnet:
	@docker build --tag xiosi/root:segnet -f segnet/dockerfile segnet
up-fast-fcn:
	@docker run -it --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0,1,2,3 --name fastfcn –shm-size 8G  --privileged -p 7729:22 -v ~/datasets:/root/dataset -v ~/HDD/user/xiosi/code:/root/code xiosi/root:fastfcn  /bin/bash

test:
	@docker run -it --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0,1,2,3 --name xiosi-test-container --privileged -p 7729:22 -v ~/datasets:/root/dataset -v ~/HDD/user/xiosi/code:/root/code hornlive/pytorch1.10.0-cuda11.3-cudnn8-runtime-based:latest  /bin/bash

up-segnet:
	@docker run -d -it --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0,1,2,3 --name segnet -m 24g  --privileged -p 7729:22 -v ~/datasets:/root/dataset -v ~/HDD/user/xiosi/code:/root/code xiosi/root:segnet  /bin/bash
exec:
	@docker exec -it segnet /bin/bash
