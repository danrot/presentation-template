all: presentation

presentation: ${addsuffix .svg, ${wildcard diagrams/*.dot}} ${addsuffix .svg, ${wildcard diagrams/*.plantuml}}
	$(MAKE) MARKDOWN_PRESENTATION_DIR=markdown-presentation -f markdown-presentation/Makefile

diagrams/%.dot.svg: diagrams/%.dot
	dot -T svg -O $^

diagrams/%.plantuml.svg: diagrams/%.plantuml
	cat $^ | plantuml -tsvg -pipe > $^.svg
