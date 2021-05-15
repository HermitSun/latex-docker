# fix version
FROM ghcr.io/xu-cheng/texlive-full:20210501

LABEL org.opencontainers.image.title="Docker Image of TeXLive with zh_CN Support" \
  org.opencontainers.image.authors="Cheng Xu <copyright@xuc.me>, HermitSun <syl1887415157@126.com>" \
  org.opencontainers.image.source="https://github.com/HermitSun/latex-docker" \
  org.opencontainers.image.licenses="MIT"

# zh_CN fonts from https://github.com/Haixing-Hu/latex-chinese-fonts
COPY ./zh_CN/ /zh_CN/

# prepare fonts from texlive & zh_CN/
RUN cp /opt/texlive/texdir/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf \
    && mv /zh_CN/ /usr/share/fonts/zh_CN/ \
    && fc-cache -fsv
