#ifndef SCREEN_HANDLER_H
#define SCREEN_HANDLER_H

#include <QObject>
#include <QVariant>
class screen_handler : public QObject
{
    Q_OBJECT
public:
    explicit screen_handler(QObject *parent = nullptr);

signals:
    void screen_out(QVariant data);

public slots:
    void screen_in(QVariant data);
};

#endif // SCREEN_HANDLER_H
