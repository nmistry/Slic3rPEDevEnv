# Slic3rPEDevEnv

An opinionated take on a docker based development environment for Slic3r Prusa Edition. 

## Getting Started

Run the docker container and access with port `6080`

```
docker run -p 6080:80 nmistry73/slic3r-pe-dev-env
```

Browse to http://localhost:6080
Open a LXTerminal and run the follow to launch the included (under "System Tools")
```
cd ~/Slic3r
./slic3r.pl --gui
```

## Building latest version of Slic3r PE

In the event that you want to use a more recent version of Slic3r PE

```
cd ~/Slic3r
export LDLOADLIBS=-lstdc++
perl Build.PL --gui \
    && mkdir -p build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make
```

## Thanks

Thanks to `dorowu` for his `ubuntu-desktop-lxde-vnc` docker image which is the base for this image. https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc/   This was a real time saver. 

