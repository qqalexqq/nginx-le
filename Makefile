GITTAG=$(shell git describe --abbrev=0 --tags)

release:
	- docker build . -t 2q.re/nginx-le:$(GITTAG)
	- docker push 2q.re/nginx-le:$(GITTAG)
	- docker push 2q.re/nginx-le:latest

.PHONY: release
