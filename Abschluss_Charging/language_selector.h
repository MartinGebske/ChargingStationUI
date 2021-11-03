#ifndef LANGUAGE_SELECTOR_H
#define LANGUAGE_SELECTOR_H

#include <QObject>

class language_selector : public QObject
{
    Q_OBJECT
public:
    explicit language_selector(QObject *parent = nullptr);
    void setGermanLoca();
    void setEnglishLoca();

signals:


};

#endif // LANGUAGE_SELECTOR_H
