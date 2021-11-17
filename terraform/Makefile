.PHONY: terraform

terraform:
	@docker run --rm -it \
		-v ${CURDIR}/terraform:/go/src/github.com/hashicorp/terraform \
		-w /go/src/github.com/hashicorp/terraform \
		hashicorp/terraform:latest \
		$(cmd)