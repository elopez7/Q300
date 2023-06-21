cmake_minimum_required(VERSION 3.23)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Qml)

set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Qt Creator fizz buzz helper import path"
    FORCE
)

qt_add_library(fizzBuzzModule STATIC)
qt6_add_qml_module(fizzBuzzModule
    URI "fizzBuzzModule"
    AUTO_RESOURCE_PREFIX
    VERSION 1.0
    PLUGIN_TARGET fizzBuzzModulePlugin
    IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    SOURCES
        fizzbuzz.h
        fizzbuzz.cpp
        fizzbuzztablemodel.h
        fizzbuzztablemodel.cpp
        enumconverters.h
)


target_include_directories(fizzBuzzModule
    PUBLIC "{CMAKE_CURRENT_SOURCE_DIR}/../"
    PRIVATE "{CMAKE_CURRENT_SOURCE_DIR}"
)

target_link_directories(fizzBuzzModule
    PRIVATE Qt6::Core
)
