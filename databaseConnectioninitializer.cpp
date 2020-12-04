#include "databaseConnectioninitializer.h"

DataBaseConnectionInitializer::DataBaseConnectionInitializer(QObject* parent)
{
    Q_UNUSED(parent)
}

bool DataBaseConnectionInitializer::initialize(QString dataBaseName, QString userName, QString userPass, QString hostName, int port)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");

    db.setDatabaseName(dataBaseName);
    db.setUserName(userName);
    db.setPassword(userPass);
    db.setHostName(hostName);
    db.setPort(port);
    bool isOpened {db.open()};

    if (isOpened) {
        qInfo() << "[Info] DataBase was opened succussefully";
    }
    else {
        //todo remove old connection
        //QSqlDatabase::removeDatabase("qt_sql_default_connection");
        qCritical() << "[Crit] DataBase did not open";
    }

    return isOpened;
}
