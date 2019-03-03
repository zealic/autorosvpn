build:
	@rm *.txt
	@bash ./scripts/generate.sh
	@bash ./scripts/generate_isp.sh
	@if [[ ! -z "$(CI)" ]]; then \
		$(MAKE) commit; \
	fi

commit:
	@bash ././scripts/commit.sh
