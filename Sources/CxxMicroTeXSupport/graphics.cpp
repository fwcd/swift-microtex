#include "graphics.h"

GraphicsContext::GraphicsContext()
  : surface(Cairo::ImageSurface::create(Cairo::ImageSurface::Format::ARGB32, 1, 1)),
    context(Cairo::Context::create(surface)),
    g2d(context) {}

GraphicsContext::~GraphicsContext() {}
