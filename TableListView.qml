import QtQuick 2.0
import TableListModel 1.0
import QtQuick.Controls.Material 2.12

ListView {
    id: root

    model: TableListModel {
        id: tableListModel
    }

    delegate: TableListDelegate {
        id: tableListDelegate

        currentTableName: tableName
        width: root.width
        height: 40
    }
}
