#pragma once
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QtDebug>

class DataBaseConnectionInitializer : public QObject
{
    Q_OBJECT
public:
    DataBaseConnectionInitializer(QObject* parent = nullptr);
    Q_INVOKABLE bool initialize(QString dataBaseName, QString userName, QString userPass,
                                QString hostName, int port);
};
