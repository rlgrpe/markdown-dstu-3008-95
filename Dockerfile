FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# Enable contrib and non-free repositories
RUN sed -i 's|http://deb.debian.org/debian bullseye main|http://deb.debian.org/debian bullseye main contrib non-free|g' /etc/apt/sources.list

# Install dependencies, fonts, TeX Live, and Pandoc
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      wget \
      cabextract \
      xfonts-utils \
      fontconfig \
      perl \
      curl \
      ca-certificates \
      fonts-dejavu-core \
      texlive-bibtex-extra biber && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get install -y --no-install-recommends ttf-mscorefonts-installer && \
    apt-get install -y --no-install-recommends \
      texlive-xetex \
      texlive-fonts-recommended \
      texlive-latex-extra \
      texlive-lang-cyrillic && \
    wget -q https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-arm64.deb && \
    dpkg -i pandoc-2.19.2-1-arm64.deb && \
    rm pandoc-2.19.2-1-arm64.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m pandocuser

WORKDIR /home/pandocuser/data
USER pandocuser

VOLUME ["/home/pandocuser/data"]

ENTRYPOINT ["pandoc"]
CMD ["--help"]
