import QtQuick 2.15
import SelectedTableModel 1.0
import QtQuick.Controls.Material 2.12

Item {
    id: root

    function selectTable(tableName) {
        selectedTableModel.selectTable(tableName);
    }

    TableView {

        anchors.fill:parent

        columnSpacing: 0
        rowSpacing: 0

        model: SelectedTableModel {
            id: selectedTableModel
        }

        delegate: TableDataDelegate {

            isHeader: row === 0
            implicitWidth: 100
            implicitHeight: 50
        }
    }

}
