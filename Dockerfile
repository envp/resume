FROM pandoc/latex

WORKDIR /latex
ENV TEXINPUTS=/latex:$TEXINPUTS

RUN tlmgr update --self
RUN tlmgr install \
        anyfontsize \
        cormorantgaramond \
        fontawesome \
        fontaxes \
        hyphenat \
        import \
        lato

ENTRYPOINT []
