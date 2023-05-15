#ifndef IMAGENVIEW_HPP
#define IMAGENVIEW_HPP

#include <gui_generated/imagen_screen/imagenViewBase.hpp>
#include <gui/imagen_screen/imagenPresenter.hpp>

class imagenView : public imagenViewBase
{
public:
    imagenView();
    virtual ~imagenView() {}
    virtual void setupScreen();
    virtual void tearDownScreen();
protected:
};

#endif // IMAGENVIEW_HPP
