#pragma once

#include <cairomm/cairomm.h>
#include <platform/cairo/graphic_cairo.h>

struct GraphicsContext {
public:
  GraphicsContext();
  virtual ~GraphicsContext();
private:
  Cairo::RefPtr<Cairo::ImageSurface> surface;
  Cairo::RefPtr<Cairo::Context> context;
  tex::Graphics2D_cairo g2d;
};
