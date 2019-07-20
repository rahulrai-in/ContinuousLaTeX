FROM debian:latest

LABEL "maintainer"="Rahul Rai <rahul@rahul-rai.com>"
LABEL "repository"="https://github.com/rahulrai-in/LaTeXResume"
LABEL "homepage"="https://github.com/rahulrai-in/LaTeXResume"

LABEL "com.github.actions.name"="Convert to PDF"
LABEL "com.github.actions.description"="Convert documents to PDF with xelatex."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="blue"

ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependencies
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    fonts-font-awesome \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-lang-english \
    texlive-xetex && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]