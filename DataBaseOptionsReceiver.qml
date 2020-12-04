import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import Qt.example.qobjectSingleton 1.0

Item {
    id: root

    signal mySignal

    ColumnLayout {

        width: parent.width
        anchors.centerIn: parent
        spacing: 5

        TextFieldBase {
            id: dataBaseName

            enabled: !errorMessage.active
            placeholderText: "Database name"
            Layout.alignment: Qt.AlignCenter
        }

        TextFieldBase {
            id: hostName

            enabled: !errorMessage.active
            placeholderText: "Host name"
            Layout.alignment: Qt.AlignCenter
        }

        TextFieldBase {
            id: userName

            enabled: !errorMessage.active
            placeholderText: "User name"
            Layout.alignment: Qt.AlignCenter
        }

        TextFieldBase {
            id: password

            enabled: !errorMessage.active
            placeholderText: "Password"
            echoMode: TextInput.Password
            Layout.alignment: Qt.AlignCenter
        }

        TextFieldBase {
            id: port

            enabled: !errorMessage.active
            placeholderText: "Port"
            Layout.alignment: Qt.AlignCenter
        }

        Button {
            text: "Open"
            flat : true

            enabled: !errorMessage.active

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 300
            Layout.preferredHeight: 40

            onClicked: {
                if (MyApi.initialize("postgres","postgres","monopoli@2020","localhost",5432)) {
                    //if (MyApi.initialize(dataBaseName.text,userName.text,password.text,hostName.text,port.text)) {
                    root.mySignal();
                }
                else {
                    errorMessage.active = true;
                }
            }
        }
    }
    Loader {
        id: errorMessage

        width: 200
        height: 100

        active: false
        anchors.centerIn: parent

        sourceComponent: Rectangle {
            color: Material.dialogColor

            ColumnLayout {
                anchors.centerIn: parent

                Text {
                    text: "Connection failed"

                    color: Material.primaryTextColor
                    Layout.alignment: Qt.AlignCenter
                }

                Text {
                    text: "try again"

                    color: Material.secondaryTextColor
                    Layout.alignment: Qt.AlignCenter
                }

                Button {
                    text: "ok"
                    flat: true

                    Layout.preferredWidth: parent.width
                    Layout.alignment: Qt.AlignCenter

                    onClicked: {
                        errorMessage.active = false;
                    }
                }
            }
        }
    }
}
