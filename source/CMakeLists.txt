cmake_minimum_required(VERSION 3.5)

set(C74_MIN_API_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../min-api)
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)

#############################################################
# MAX EXTERNAL
#############################################################

include_directories(
    "${C74_INCLUDES}"
)

set(SOURCE_FILES
    ${PROJECT_NAME}.cpp
)

add_library(
    ${PROJECT_NAME}
    MODULE
    ${SOURCE_FILES}
)

# Set the output directory to the externals folder without nesting .mxo inside itself
set_target_properties(${PROJECT_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../../../externals/${PROJECT_NAME}.mxo/Contents/MacOS"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../../../externals/${PROJECT_NAME}.mxo/Contents/MacOS"
    BUNDLE TRUE
    BUNDLE_EXTENSION mxo
)

# Ensure the output directories exist
file(MAKE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../../../externals/${PROJECT_NAME}.mxo/Contents/MacOS")

# Specify architectures for universal binary on macOS
if(APPLE)
    set_target_properties(${PROJECT_NAME} PROPERTIES
        OSX_ARCHITECTURES "x86_64;arm64"
    )
endif()

include(${C74_MIN_API_DIR}/script/min-posttarget.cmake)

#############################################################
# UNIT TEST
#############################################################

include(${C74_MIN_API_DIR}/test/min-object-unittest.cmake)
