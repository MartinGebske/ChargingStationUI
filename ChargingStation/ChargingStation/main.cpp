#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "screen_handler.h"
#include "hpc_manager.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<screen_handler>("de.martingebske", 1,0, "ScreenHandler");
    qmlRegisterType<hpc_manager>("de.martingebske", 1,0, "HPC_Manager");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
