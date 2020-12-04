import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Button {
    id: root

    property string currentTableName: ""

    flat: true

    contentItem: Text {
        text: currentTableName

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10

        color: Material.primaryTextColor
    }
}

