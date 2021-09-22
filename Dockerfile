# fix version
FROM ghcr.io/xu-cheng/texlive-full:20210901

LABEL org.opencontainers.image.title="Docker Image of TeXLive with zh_CN Support" \
  org.opencontainers.image.authors="Cheng Xu <copyright@xuc.me>, HermitSun <syl1887415157@126.com>" \
  org.opencontainers.image.source="https://github.com/HermitSun/latex-docker" \
  org.opencontainers.image.licenses="MIT"

# fonts from https://github.com/Haixing-Hu/latex-chinese-fonts
# ignore files in .dockerignore
COPY . /

# prepare fonts
RUN cp /opt/texlive/texdir/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf \
    && mv /adobe/ /usr/share/fonts/ \
    && mv /linux/ /usr/share/fonts/ \
    && mv /mac/ /usr/share/fonts/ \
    && mv /win/ /usr/share/fonts/ \
    && mv /common/ /usr/share/fonts/ \
    && fc-cache -fsv
