html: slides.md
	pandoc\
	    slides.md\
	    -o slides.html\
	    -s\
	    --self-contained\
	    --section-divs\
	    --lua-filter=codeblock-filter.lua\
	    -c slides.css\
	    -A slides_before_body.html
