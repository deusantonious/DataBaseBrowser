#include "selectedtablemodel.h"
#include <QDebug>
SelectedTableModel::SelectedTableModel(QObject* parent)
{
    Q_UNUSED(parent);
}

int SelectedTableModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_selectedTable.rowCount() + 1;
}

int SelectedTableModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_selectedTable.columnCount();
}

QVariant SelectedTableModel::data(const QModelIndex &index, int role) const
{
    Q_UNUSED(role);
    QString res;
    if (index.row() == 0) {
        res = m_columnNames.at(index.column());
    }
    else {
        res = m_selectedTable.record(index.row() - 1).value(m_selectedTable.record().fieldName(index.column())).toString();
    }

    return QVariant::fromValue(res);

}

bool SelectedTableModel::selectTable(QString tableName)
{
    beginResetModel();

    m_selectedTable.setTable(tableName);
    bool isOpened {m_selectedTable.select()};

    m_columnNames.clear();
    for (int i {0}; i < m_selectedTable.columnCount(); i++) {
        m_columnNames.push_back(m_selectedTable.record().fieldName(i));
    }
    endResetModel();
    return isOpened;
}
