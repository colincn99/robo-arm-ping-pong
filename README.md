# Robotic Arm Ping Pong Project

## Demo Video
https://github.com/user-attachments/assets/cbfec1d9-a86b-4378-af8a-62a42c6981bb

## Description
This is a group Caltech robotics class project. This branch features the ping pong demonstration that I primarily worked on.

The project utilizes ROS extensively and performs arm motions using inverse kinematics written by hand simulated in gazebo. 

## How to run

Build and run the docker with X11 forwarding. 
If you are on WSL2, you can install VcXSrv and run the following:
```sh
docker build -t ping-pong .
docker run -e DISPLAY=$(ip route list default | awk '{print $3}'):0 ping-pong
```

