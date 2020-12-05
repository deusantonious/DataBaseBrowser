import QtQuick 2.15
import SelectedTableModel 1.0
import QtQuick.Controls.Material 2.12
import QtLocation 5.15


Item {
    id: root

    property string tableName: ""

    function selectTable(tableName) {
        selectedTableModel.selectTable(tableName);
        root.tableName = tableName;
    }

    ToolBar {
        id: toolBar

        buttonWidth: 50

        width: 50
        height: parent.height
    }

    Rectangle {
        id: topBar

        width: root.width - toolBar.width
        height: root.height  * 0.1

        anchors.left: toolBar.right
        anchors.leftMargin: 10

        color: Material.backgroundColor

        TextInput {
            text: qsTr(tableName)
            font.bold: true
            font.pointSize: 32

            color: Material.primaryTextColor
            enabled: false

            anchors.verticalCenter: parent.verticalCenter
        }
    }

    TableView {
        width: root.width - toolBar.width
        height: root.height  * 0.9

        anchors.top: topBar.bottom
        anchors.left: toolBar.right
        anchors.leftMargin: 10

        clip: true

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
