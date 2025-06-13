FROM osrf/ros:noetic-desktop-full-focal

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-kdl-parser-py \
    ros-noetic-effort-controllers \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pyquaternion
RUN adduser user
COPY . /home/user/catkin_ws/src/robo-arm-ping-pong
WORKDIR /home/user/catkin_ws
SHELL ["/bin/bash", "-ec"]
RUN source /opt/ros/noetic/setup.bash && catkin_make
RUN chown -R user /home/user

WORKDIR /home/user
USER user 
CMD ["/bin/bash", "-ec", "source /home/user/catkin_ws/devel/setup.bash \
      && roslaunch gazebodemos ping_pong.launch"]
