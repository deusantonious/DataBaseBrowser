import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12


TextField {
    id: root

    placeholderTextColor: Material.secondaryTextColor

    color: Material.primaryTextColor

    implicitHeight: 50
    implicitWidth: 300

    background: Rectangle {
        anchors.fill: parent

        color: Material.backgroundColor
        border.color: Material.frameColor
    }
}
