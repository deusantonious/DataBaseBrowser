
#include "tablelistmodel.h"

TableListModel::TableListModel(QObject *parent)
{
    Q_UNUSED(parent);

}

int TableListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return QSqlDatabase::database().tables().count();
}

QVariant TableListModel::data(const QModelIndex &index, int role) const
{
    if (role != TableName) {
        return {};
    }

    return QVariant::fromValue(QSqlDatabase::database().tables().at(index.row()));
}

QHash<int, QByteArray> TableListModel::roleNames() const
{
    QHash <int, QByteArray> roles;
    roles[TableName] = "tableName";
    return roles;
}
