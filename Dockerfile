ARG LATEX_IMAGE_TAG=edge-ubuntu
FROM pandoc/latex:$LATEX_IMAGE_TAG

RUN tlmgr list
RUN tlmgr update --self && \
    tlmgr install \
    merriweather \
    fontaxes \
    mweights \
    mdframed \
    needspace \
    sourcesanspro \
    sourcecodepro \
    titling \
    ly1 \
    pagecolor \
    adjustbox \
    collectbox \
    titlesec \
    fvextra \
    pdftexcmds \
    footnotebackref \
    zref \
    fontawesome5 \
    footmisc \
    sectsty \
    koma-script \
    lineno \
    awesomebox \
    background \
    everypage \
    xurl \
    epstopdf \
    tcolorbox \
    hardwrap \
    catchfile \
    ctex \
    environ \
    pdfpages

RUN apk add --update ttf-dejavu font-isas-misc ttf-droid ttf-droid-nonlatin fontconfig && rm -rf /var/cache/apk/*
RUN apt-get update
RUN apt-get install -yy python3 python3-pip python3-virtualenv
RUN virtualenv /venv
ENV PATH=/venv/bin/:$PATH
RUN pip3 install pandoc-latex-environment
