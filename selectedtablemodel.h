#pragma once
#include <QAbstractTableModel>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlRecord>

class SelectedTableModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    SelectedTableModel(QObject* parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Q_INVOKABLE bool selectTable(QString tableName);

private:
    QSqlTableModel m_selectedTable;
    QList<QString> m_columnNames;
};
