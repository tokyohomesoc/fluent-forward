.SILENT :
.PHONY : fluent-forward

fluent-forward:
	docker build -t tokyohomesoc/fluent-forward:test .
	docker images
    docker history tokyohomesoc/fluent-forward:test