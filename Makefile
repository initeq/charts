build:
	docker run -v $(CURDIR)/incubator:/build-harness/incubator -v $(CURDIR)/packages:/build-harness/packages \
		-e HELM_CHART_REPO_URL=https://charts.initeq.net \
		cloudposse/build-harness:0.37.0 -C incubator all

index:
	docker run -v $(CURDIR)/incubator:/build-harness/incubator -v $(CURDIR)/packages:/build-harness/packages \
		-e HELM_CHART_REPO_URL=https://charts.initeq.net \
		cloudposse/build-harness:0.37.0 -C packages all

all: build index
	@exit 0
