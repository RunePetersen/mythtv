#ifndef _VIDEODECODER_H
#define _VIDEODECODER_H

#include "openclinterface.h"
#include "videosurface.h"

extern "C" {
#include "libavcodec/avcodec.h"
}

class VideoDecoder
{
  public:
    VideoDecoder(OpenCLDevice *dev, bool useCPU) : m_dev(dev), m_width(0),
        m_height(0), m_codecId(CODEC_ID_NONE), m_codec(NULL), m_useCPU(useCPU),
        m_isCPU(useCPU) {};
    ~VideoDecoder() {};
    virtual const char *Name(void) = 0;
    virtual bool Initialize(void) = 0;
    virtual VideoSurface *DecodeFrame(AVFrame *frame) = 0;
    virtual void DiscardFrame(VideoSurface *frame) = 0;
    virtual void Shutdown(void) = 0;
    virtual void SetCodec(AVCodec *codec) = 0;
    void SetSize(uint32_t width, uint32_t height) 
    {
        m_width = width;
        m_height = height;
    }

    OpenCLDevice *m_dev;
    uint32_t m_width;
    uint32_t m_height;
    CodecID m_codecId;
    AVCodec *m_codec;
    bool m_useCPU;
    bool m_isCPU;
};

#endif

/*
 * vim:ts=4:sw=4:ai:et:si:sts=4
 */