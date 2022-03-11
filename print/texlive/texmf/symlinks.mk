# This file is autogenerated. Do not edit.

tl-symlinks-buildset:
	cd ${PREFIX}/bin && \
		ln -s luatex dvilualatex && \
		ln -s luatex dviluatex && \
		ln -s pdftex etex && \
		ln -s pdftex latex && \
		ln -s luahbtex lualatex && \
		ln -s pdftex pdfetex && \
		ln -s pdftex pdflatex

tl-symlinks-main:
	cd ${PREFIX}/bin && \
		ln -s pdftex amstex && \
		ln -s pdftex cslatex && \
		ln -s pdftex csplain && \
		ln -s pdftex eplain && \
		ln -s pdftex jadetex && \
		ln -s tex lollipop && \
		ln -s luatex luacsplain && \
		ln -s pdftex mex && \
		ln -s pdftex mllatex && \
		ln -s pdftex mltex && \
		ln -s pdftex pdfcslatex && \
		ln -s pdftex pdfcsplain && \
		ln -s pdftex pdfjadetex && \
		ln -s pdftex pdfmex && \
		ln -s pdftex pdfxmltex && \
		ln -s pdftex texsis && \
		ln -s pdftex utf8mex && \
		ln -s xetex xelatex && \
		ln -s pdftex xmltex

tl-symlinks-full:
	cd ${PREFIX}/bin && \
		ln -s luatex dvilualatex-dev && \
		ln -s pdftex latex-dev && \
		ln -s luahbtex lualatex-dev && \
		ln -s luatex optex && \
		ln -s pdftex pdflatex-dev && \
		ln -s eptex platex && \
		ln -s eptex platex-dev && \
		ln -s euptex uplatex && \
		ln -s euptex uplatex-dev && \
		ln -s xetex xelatex-dev

tl-symlinks-context:
	true

