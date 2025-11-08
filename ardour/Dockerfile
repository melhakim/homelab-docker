FROM alpine/git AS git
RUN git clone --progress https://github.com/Ardour/ardour.git /ardour-src

FROM ubuntu AS compiler
RUN sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu.sources
RUN apt update && apt upgrade -y
RUN apt install -y git python-is-python3
#RUN apt install -y libasound2-dev libaubio-dev libboost-all-dev \
    #libcppunit-dev fftw-dev libflac-dev g++ gcc git libc6-dev libglibmm-2.4-dev \
    #libgtkmm-2.4-dev libjack-dev libarchive-dev liblo-dev libsamplerate-dev \
    #libsndfile-dev libusb-dev libwebsockets-dev libxml2-dev liblilv-dev \
    #liblrdf0-dev lv2-dev libpangomm-1.4-dev libpulse-dev python3 libraptor2-dev \
    #librubberband-dev libserd-dev libsord-dev libsoundtouch-dev libsratom-dev \
    #libsuil-dev libtag1-dev libvamp-sdk2v5 libvamp-hostsdk3v5 libcurl4-gnutls-dev \
    #python-is-python3 vamp-plugin-sdk libfftw3-dev libudev-dev \
    #libusb-dev libusb-1.0-0-dev libreadline-dev distcc
#RUN ln -s /usr/lib/libraptor2.so.0 /usr/lib/libraptor.so.0

RUN apt build-dep -y ardour

#ENV DISTCC_HOSTS="mohammed@arch-hakim,lzo" \
    #SSH_AUTH_SOCK=/ssh_auth_sock CC=distcc CXX="distcc g++"

COPY --from=git /ardour-src /ardour-src
WORKDIR /ardour-src
#RUN ./waf configure && ./waf build
#VOLUME /ardour-src
#RUN ./waf install
RUN echo "*\thard\tmemlock\t0" >> /etc/security/limits.conf

#Needed for packaging:
RUN apt install -y chrpath rsync unzip
