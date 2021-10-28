#include "screen_handler.h"

screen_handler::screen_handler(QObject *parent) : QObject(parent)
{

}

void screen_handler::screen_in(QVariant data)
{

    emit screen_out(QVariant (data));
}
