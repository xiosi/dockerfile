all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build              - build all images"
	# @echo "   1. make pull             - pull all images"
	@echo "   1. make clean              - remove all images"
	@echo ""

build-rust:
	@docker build --tag xiosi/root:rust -f dockerfile .
up-rust:
	@docker run -d -it --rm --name rustlang -m 24g  --privileged -p 1524:6006 -p 7729:22  -v ~/dockerros/code/rust:/root/code/src   xiosi/root:rust 
