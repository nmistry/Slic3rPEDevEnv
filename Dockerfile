FROM dorowu/ubuntu-desktop-lxde-vnc


RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    cpanminus \
    freeglut3-dev \
    git \
    libboost-all-dev \
    libboost-filesystem-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libcurl4-openssl-dev \
    libeigen3-dev \
    libextutils-cppguess-perl \
    libextutils-typemaps-default-perl \
    libextutils-xspp-perl \
    libglew-dev \
    libgtk2.0-dev \
    liblocal-lib-perl \
    libmodule-build-perl \
    libopengl-perl \
    libtbb-dev \
    libwx-glcanvas-perl \
    libwx-perl \
    libwxgtk-media3.0-dev \
    libwxgtk3.0-dev \
    libxmu-dev \
    wx-common \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/prusa3d/Slic3r.git \
 && cd Slic3r \
 && git checkout -b origin/master

WORKDIR Slic3r

ENV LDLOADLIBS=-lstdc++

# perl Build.PL
RUN perl Build.PL --gui \
    && mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make
