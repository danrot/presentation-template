all: presentation

presentation: ${addsuffix .svg, ${wildcard diagrams/*.dot}}
	$(MAKE) MARKDOWN_PRESENTATION_DIR=markdown-presentation -f markdown-presentation/Makefile

diagrams/%.dot.svg: diagrams/%.dot
	dot -T svg -O $^
