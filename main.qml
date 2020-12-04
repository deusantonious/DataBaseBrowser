import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Material.theme: Material.Dark
    Material.accent: Material.Teal

    Loader {
        id: tableListViewLoader

        source: "TableListView.qml"

        anchors.fill: parent
        active: false

        Connections {
            target: tableListViewLoader.item
            function onTableSelected(tableName) {
                selectedTableViewLoader.active = true;
                tableListViewLoader.active = false;
                selectedTableViewLoader.item.selectTable(tableName);
            }
        }
    }

    Loader {
        id: selectedTableViewLoader

        source: "SelectedTableView.qml"

        anchors.fill: parent
        active: false
    }

    Loader {
        id: dataBaseOptionsReceiverLoader
        height: parent.height
        width: parent.width

        source: "DataBaseOptionsReceiver.qml"

        Connections {
            target: dataBaseOptionsReceiverLoader.item
            function onMySignal() {
                dataBaseOptionsReceiverLoader.active = false;
                tableListViewLoader.active = true;
            }
        }
    }
}
