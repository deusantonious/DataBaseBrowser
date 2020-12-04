#pragma once
#include <QAbstractListModel>
#include <QSqlDatabase>
#include <QtDebug>

class TableListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    TableListModel(QObject* parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex {}) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    enum {
        TableName = Qt::UserRole + 1
    };
};
