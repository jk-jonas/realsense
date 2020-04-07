#!/bin/sh
# create the models for gazebo with plugins
for name in "d435" "d415"; do
    rosrun xacro xacro "$(rospack find realsense2_description)/urdf/test_${name}_camera.urdf.xacro" > "$(rospack find realsense_models)/urdf/rs_${name}_camera.urdf"
    gz sdf -p "$(rospack find realsense_models)/urdf/rs_${name}_camera.urdf" > "$(rospack find realsense_models)/sdf/rs_${name}_camera.sdf"
    sed -i "s/model:\/\/realsense2_description\//file:\/\//g" "$(rospack find realsense_models)/sdf/rs_${name}_camera.sdf"
    sed -i "s/<model name='realsense2_camera'>/<model name='rs_${name}_camera'>/g" "$(rospack find realsense_models)/sdf/rs_${name}_camera.sdf"
    cp -p "$(rospack find realsense_models)/sdf/rs_${name}_camera.sdf" "$(rospack find realsense_models)/models/rs_${name}_camera/rs_${name}_camera.sdf"
done
