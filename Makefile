build:
	@rm *.txt *.rsc
	@bash ./scripts/generate.sh
	@bash ./scripts/generate_isp.sh
	@bash ./scripts/generate_ros.sh
	@bash ./scripts/generate_cloud.sh
	@bash ./scripts/generate_sites.sh
	@if [[ ! -z "$(CI)" ]]; then \
		$(MAKE) commit; \
	fi

commit:
	@bash ././scripts/commit.sh
