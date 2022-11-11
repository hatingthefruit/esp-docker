# ESP 8266 Docker Build Script
 
Docker container to build ESP 8266 using their toolchain without having to deal with their Python 2 dependency

# Getting Started

Running `make install` will build the docker container and copy the [esp-docker](esp-docker) script into your `$HOME/.local/bin` directory. 

The script wraps running make in the current dir in the docker container; you can try one of the [given examples](https://github.com/espressif/ESP8266_RTOS_SDK/tree/master/examples). For example:

```
cd ESP8266_RTOS_SDK/examples/get-started/hello_world
esp-docker make flash monitor
```