poster.pdf: poster.tex simple.eps \
	variants-en-gb.eps variants-en-us.eps \
	variants-sr-ec.eps variants-sr-el.eps \
	variants-zh-cn.eps variants-zh-tw.eps \
	variants-hi.eps variants-ur.eps
	xelatex $<
simple.dot: simple.foma
	foma -f $<
simple.svg: simple.dot
	dot -Tsvg -Nfontname=Montserrat -Efontname=Montserrat $< > $@
simple.eps: simple.svg
	inkscape --export-eps=$@ $<
variants-%.eps: variants.svg
	inkscape --export-eps=$@ --export-id=layer-$* $<
clean:
	$(RM) poster.pdf poster.aux poster.log poster.out *-converted-to.pdf
	$(RM) simple.dot simple.svg simple.eps
	$(RM) variants-*.eps
