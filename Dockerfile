FROM ubuntu:20.04

# non interactive frontend for locales
ENV DEBIAN_FRONTEND=noninteractive

# installing texlive and utils
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        texlive-base \ 
        texlive \
        texlive-full \
        texlive-latex-extra \
        texlive-extra-utils \
        texlive-fonts-extra \
        texlive-bibtex-extra \
        biber \ 
        latexmk \
        locales && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir project

# generating locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

WORKDIR /project
