#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include "tablelistmodel.h"
#include "databaseConnectioninitializer.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    qmlRegisterType<TableListModel>("TableListModel", 1, 0, "TableListModel");
    qmlRegisterSingletonType<DataBaseConnectionInitializer>("Qt.example.qobjectSingleton", 1, 0, "MyApi", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)

        DataBaseConnectionInitializer *example = new DataBaseConnectionInitializer();
        return example;
    });

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
