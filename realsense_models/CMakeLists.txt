cmake_minimum_required(VERSION 2.8.3)
project(realsense_models)

# build the models
add_custom_target(create_models ALL COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/scripts/create_models.sh)

