include (../../settings.pro)
include (../../version.pro)
include ( ../programs-libs.pro )

TEMPLATE = app
CONFIG += thread
target.path = $${PREFIX}/bin
INSTALLS = target

QMAKE_CLEAN += $(TARGET)

SDK = /opt/NVIDIA_GPU_Computing_SDK
INCLUDEPATH += $$SDK/shared/inc $$SDK/OpenCL/common/inc
#INCLUDEPATH += $$SDK/OpenCL/common/inc
LIBPATH += $$SDK/shared/lib $$SDK/shared/lib/linux
LIBPATH += $$SDK/OpenCL/common/lib

LIBS += -lOpenCL -loclUtil_x86_64 -lshrutil_x86_64 -lglut -lGLEW

# Input
HEADERS += commandlineparser.h
HEADERS += openclinterface.h openglsupport.h
HEADERS += packetqueue.h
HEADERS += resultslist.h
HEADERS += gpuplayer.h
HEADERS += queueconsumer.h audioconsumer.h videoconsumer.h
HEADERS += audioprocessor.h videoprocessor.h
HEADERS += audiopacket.h videopacket.h videosurface.h
HEADERS += videodecoder.h vdpauvideodecoder.h ffmpegvideodecoder.h

SOURCES += main.cpp commandlineparser.cpp
SOURCES += openclinterface.cpp
SOURCES += packetqueue.cpp
SOURCES += gpuplayer.cpp
SOURCES += queueconsumer.cpp audioconsumer.cpp videoconsumer.cpp
SOURCES += audioprocessor.cpp videoprocessor.cpp
SOURCES += openclaudioprocessor.cpp softwareaudioprocessor.cpp
SOURCES += openclvideoprocessor.cpp softwarevideoprocessor.cpp
SOURCES += audiopacket.cpp videopacket.cpp videosurface.cpp
SOURCES += vdpauvideodecoder.cpp ffmpegvideodecoder.cpp

#The following line was inserted by qt3to4
QT += xml sql network

using_x11:DEFINES += USING_X11
using_xv:DEFINES += USING_XV
using_xrandr:DEFINES += USING_XRANDR
using_opengl:QT += opengl
using_opengl:DEFINES += USING_OPENGL
using_opengl_video:DEFINES += USING_OPENGL_VIDEO
using_vdpau:DEFINES += USING_VDPAU
