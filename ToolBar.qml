import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Rectangle {
    id: root
    property int buttonWidth: 0
    color: Material.backgroundColor

    ColumnLayout {
        anchors.topMargin: parent.height * 0.1
        anchors.top: parent.top

        Button {
            text: "Add"
            flat : true

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: buttonWidth
            Layout.preferredHeight: 40
        }
        Button {
            text: "Edit"
            flat : true

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: buttonWidth
            Layout.preferredHeight: 40
        }
        Button {
            text: "Rem"
            flat : true

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: buttonWidth
            Layout.preferredHeight: 40
        }
        Button {
            text: "Find"
            flat : true

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: buttonWidth
            Layout.preferredHeight: 40
        }
    }
}
