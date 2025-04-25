# rpi-rails-mariadb-docker

Turn your Raspberry Pi into a Rails web server that starts on boot.

Serve content from your home for a real .com domain over SSL that's automatically setup and renewed.

Building this image should work on both ARM64 Mac and AMD64 Mac laptops.

AMD is much slower as expected due to emulation.

```sh
git clone https://github.com/jonnymacs/rpi-rails-mariadb-docker
cd rpi-rails-mariadb-docker
```

# some setup

 - Populate custom-rpi-image/ext_dir/custome-rpi-image.options
 - setup an account on dynu.com for your domain
 - update your registrar to point to the dyno nameservers
 - configure your router with port forwarding for ports 80, 443
 - set APP_IMAGE_NAME - this is (typically) the root directory of your app
 - build the RPI image

```
./build.sh
```

 - Use the Raspberry Pi Imager tool to install the img file located in deploy on an SD card or USB stick.
 - boot the device
 - ssh to your Pi

```
ssh <device_user1_from_options>@<device_hostname>.local
```

 - retrieve the initial cert

```
./manage-cert.sh
```

# deploy your app

 - back on your local machine build a docker image for your app using Docker Compose using "app" as the service name

```
docker compose build
```

 - Save your docker image and copy to the Pi

```
docker save -o <your-app-name>.tar <your-app-name>:latest
scp <your-app-name>.tar <your-app-name>.local
```

 - ssh to your Pi
 - load your image to the docker registry

```
docker load -i <your-app-name>.tar
```

 - start the app

```
./start.sh
```

 - migrate your data if it's the first time starting the app

**[Watch and Like the recorded video for this project on YouTube](https://www.youtube.com/watch?v=hf-W73XD8wc)** 

[![Watch and Like the recorded video for this project on YouTube](https://img.youtube.com/vi/hf-W73XD8wc/maxresdefault.jpg)](https://www.youtube.com/watch?v=hf-W73XD8wc)

**[Subscribe to the channel for more similar content](https://www.youtube.com/@macmind-io?sub_confirmation=1)

Please refer to https://github.com/raspberrypi/rpi-image-gen for more information rpi-image-gen

Refer to https://www.dynu.com/en-US/ for more info on Dynu DNS

Refer to https://github.com/ddclient/ddclient for more info on ddclient

[Follow me on X](https://x.com/jonnymacs), or join my [Discord](https://discord.gg/5KjjbhYY) and don't forget to star [this GitHub repository](https://github.com/jonnymacs/rpi_tutorials)!