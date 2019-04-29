QT += core
QT -= gui

CONFIG += c++11

TARGET = TdxTradeServer
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    tts_setting.cpp \
    tts_tradeapi.cpp \
    tts_server.cpp \
    tts_encrypt.cpp \
    aes.cpp \
    tts_dll.cpp \
    tts_activeclients.cpp

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += conan_basic_setup

CONFIG(debug, debug|release) {
    include("./conan/debug/conanbuildinfo.pri")
} else {
    include("./conan/release/conanbuildinfo.pri")
}

QMAKE_CXXFLAGS_DEBUG+=-MTd
QMAKE_CXXFLAGS_RELEASE+=-MT

HEADERS += \
    tts_setting.h \
    tts_tradeapi.h \
    tts_common.h \
    tts_server.h \
    tts_encrypt.h \
    aes.h \
    tts_dll.h \
    tts_activeclients.h
DISTFILES += \
    conanfile.txt \
    README.md \
    build_debug_version.py \
    .gitignore \
    ChangeLog.md \
    build_release_version.py \
    resource.rc

RC_FILE += resource.rc


