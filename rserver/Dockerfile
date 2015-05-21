# mxabierto R server
# Base R server installation
# Build:
#   docker build -t mxabierto/rserver .
# Usage:
#   docker run --rm -it -p 8787:8787 mxabierto/rserver

# Base image
FROM mxabierto/base

MAINTAINER bcessa <ben@pixative.com>

# Install dependencies
RUN \
  apt-get update && \
  apt-get install -y \
  dialog \
  gdebi-core \
  libatlas3-base \
  libopenblas-base \
  procps \
  r-base \
  r-base-dev \
  r-cran-boot \
  r-cran-cluster \
  r-cran-class \
  r-cran-codetools \
  r-cran-foreign \
  r-cran-kernsmooth \
  r-cran-lattice \
  r-cran-mass \
  r-cran-matrix \
  r-cran-mgcv \
  r-cran-nlme \
  r-cran-nnet \
  r-cran-rpart \
  r-cran-spatial \
  r-cran-survival \
  sudo && \
  rm -rf /var/lib/apt/lists/*

# Enviroment variables
ENV \
  R_LIBS_SITE=$R_LIBS_SITE-'/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library'

# Install libssl and rstudio package
RUN \
  wget http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl0.9.8_0.9.8o-4squeeze14_amd64.deb && \
  dpkg -i libssl0.9.8_0.9.8o-4squeeze14_amd64.deb && \
  wget http://download2.rstudio.org/rstudio-server-0.98.1103-amd64.deb && \
  gdebi -n rstudio-server-0.98.1103-amd64.deb && \
  rm libssl0.9.8_0.9.8o-4squeeze14_amd64.deb rstudio-server-0.98.1103-amd64.deb

# Setup user and permissions
RUN \
  useradd -m ruser && \
  echo "ruser:ruser" | chpasswd && \
  echo "R_LIBS_SITE=${R_LIBS_SITE-'/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library'}" >> /home/ruser/.Renviron && \
  chmod -Rv 775 /home/ruser 

ADD start.sh /root/start.sh

# Working directory
WORKDIR /home/ruser

# Entry point
ENTRYPOINT ["/root/start.sh"]

# Server port
EXPOSE 8787
