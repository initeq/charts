# Helm 3
HELM=helm
STAGE=$(notdir $(CURDIR))
PACKAGES_DIR=../packages/$(STAGE)

CHARTS = $(wildcard */)

all: deps $(wildcard */)

deps:
	$(HELM) repo add cloudposse-incubator https://charts.cloudposse.com/incubator/
	$(HELM) repo add kube2iam https://jtblin.github.io/kube2iam/
	$(HELM) repo add nginx-stable https://helm.nginx.com/stable
	$(HELM) repo add bitnami https://charts.bitnami.com/bitnami
	$(HELM) repo add jetstack https://charts.jetstack.io
	$(HELM) repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	mkdir -p $(PACKAGES_DIR)

clean:
	rm -f *.tgz */requirements.lock
	rm -rf */tmpcharts/

.PHONY : $(CHARTS)
$(CHARTS): CHART ?= $(@D)
$(CHARTS): VERSION ?= $(shell yq r $(CHART)/Chart.yaml version)
$(CHARTS): PACKAGE ?= $(CHART)-$(VERSION).tgz
$(CHARTS):
	@echo "# Building package for $(CHART) ($(PACKAGE))"
	@$(HELM) dependency build --debug $@
	@$(HELM) package --debug $@
	mv -f $(PACKAGE) $(PACKAGES_DIR)
