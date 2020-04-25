TTFS = $(shell find fira_code -type f -name '*.ttf')
OTFS = $(shell find fira_code -type f -name '*.otf')
TARGETS = $(TTFS:fira_code/%=output/%) $(OTFS:fira_code/%=output/%)

all: $(TARGETS)

$(TARGETS): output/%: fira_code/%
	@pyftfeatfreeze -f 'ss01,ss02,ss03' $^ $@
	@mkdir -p `dirname $@`
	@echo "$^ => $@"