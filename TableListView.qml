import QtQuick 2.0
import TableListModel 1.0
import QtQuick.Controls.Material 2.12
import SelectedTableModel 1.0

Item {
    id: root

    signal tableSelected(string tableName)

    ListView {
        id: view

        anchors.fill: root

        model: TableListModel {
            id: tableListModel
        }

        delegate: TableListDelegate {
            id: tableListDelegate

            currentTableName: tableName
            width: root.width
            height: 40

            onClicked: {
                tableSelected(tableName);
            }
        }
    }
}
