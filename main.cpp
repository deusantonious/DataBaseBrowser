#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include "tablelistmodel.h"
#include "databaseConnectioninitializer.h"
#include "selectedtablemodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    qmlRegisterType<TableListModel>("TableListModel", 1, 0, "TableListModel");
    qmlRegisterType<SelectedTableModel>("SelectedTableModel", 1, 0, "SelectedTableModel");

    qmlRegisterSingletonType<DataBaseConnectionInitializer>("DataBaseConnectionInitializer", 1, 0, "DataBaseConnectionInitializer",
                                                            [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)

        DataBaseConnectionInitializer *ptr = new DataBaseConnectionInitializer();
        return ptr;
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
