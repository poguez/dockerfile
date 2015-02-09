#!/bin/bash

# CONFIG PARAMS
SERVER=http://download.enlightenment.org/releases/
LIBS=1.7.9
E_VER=0.17.4
TERMINOLOGY_VER=0.3.0

# TOOLS
echo "Installing: Build Tools"
apt-get install -y \
gettext \
autoconf \
automake \
autopoint \
make \
gcc \
byacc \
libtool \
git \
xinit \
check

# DEPENDENCIES
echo "Installing: Dependencies"
apt-get install -y \
dbus-x11 \
libc-dev \
libpthread-stubs0-dev \
zlib1g-dev \
libpam-dev \
liblua5.1-0-dev \
libxkbfile-dev \
libxcb-glx0-dev \
libxcb-shape0-dev \
libxcb-icccm4-dev \
libxcb-xfixes0-dev \
libxcb-xinerama0-dev \
libxcb-sync0-dev \
libxcb-keysyms1-dev \
libfreetype6-dev \
libfontconfig-dev \
libfribidi-dev \
libpng-dev \
libjpeg-dev \
libtiff-dev \
libgif-dev \
librsvg2-dev \
libx11-dev \
libdbus-1-dev \
libxtst-dev \
libxext-dev \
libxrender-dev \
libxcomposite-dev \
libxdamage-dev \
libxfixes-dev \
libxrandr-dev \
libxinerama-dev \
libxss-dev \
libxp-dev \
libxtst-dev \
libxcursor-dev \
libpulse-dev \
libsndfile-dev \
libudev-dev \
libblkid-dev \
libmount-dev \
libgstreamer0.10-dev \
libcurl4-gnutls-dev \
libc-ares-dev \
libgnutls-dev \
libasound2-dev \
mesa-common-dev \
libspectre-dev \
libpoppler-dev \
libpoppler-private-dev \
libraw-dev \
libxine-dev \
libgl1-mesa-dev

# EFL
DEPS[1]=eina
DEPS[2]=eet
DEPS[3]=evas
DEPS[4]=evas_generic_loaders
DEPS[5]=ecore
DEPS[6]=eio
DEPS[7]=embryo
DEPS[8]=edje
DEPS[9]=efreet
DEPS[10]=e_dbus
DEPS[11]=eeze
DEPS[12]=emotion
DEPS[13]=ethumb
DEPS[14]=elementary
for i in "${DEPS[@]}"; do
  echo "Installing:" $i-${LIBS}
  wget ${SERVER}$i-${LIBS}.tar.gz
  tar xvzf $i-${LIBS}.tar.gz
  cd $i-${LIBS}
  ./autogen.sh
  make
  make install
  ldconfig
  cd ..
  rm $i-${LIBS}.tar.gz
  rm -rf $i-${LIBS}
done

# ENLIGHTENMENT
echo "Installing: Enlightenment" $E_VER
wget ${SERVER}enlightenment-${E_VER}.tar.gz
tar xvzf enlightenment-${E_VER}.tar.gz
cd enlightenment-${E_VER}
./configure
make
make all install
cd ..
rm -rf enlightenment-${E_VER}
rm enlightenment-${E_VER}.tar.gz

# TERMINOLOGY
echo "Installing: Terminology" $TERMINOLOGY_VER
wget ${SERVER}terminology-${TERMINOLOGY_VER}.tar.gz
tar xvzf terminology-${TERMINOLOGY_VER}.tar.gz
cd terminology-${TERMINOLOGY_VER}
./autogen.sh
make && make install
cd ..
rm -rf terminology-${TERMINOLOGY_VER}
rm terminology-${TERMINOLOGY_VER}.tar.gz

# CLEANUP
apt-get clean
apt-get autoclean
apt-get autoremove

# XINITRC
echo "exec enlightenment_start" >> ~/.xinitrc