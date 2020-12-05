import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Rectangle {
    id: root

    property bool isHeader: false

    color: Material.backgroundColor

    border.color: Material.frameColor
    border.width: 1

    TextInput {
        anchors.centerIn: parent

        text: display

        font.bold: isHeader
        font.pointSize: isHeader ? 18 : 12

        color: isHeader ? Material.secondaryTextColor : Material.primaryTextColor
        enabled: false
    }
}
