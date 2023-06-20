

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import The300Counter

ColumnLayout {
    id: root
    width: Constants.width
    height: Constants.height

    ColumnLayout {
        id: inputsLayout
        Layout.fillHeight: true

        Label {
            id: instructionLabel
            color: "#1d5888"
            text: qsTr("Enter Numbers")
            Layout.fillWidth: true

            font {
                pixelSize: 24
                family: "Roboto"
                bold: true
            }
        }

        UserInputField {
            id: fizzInputField
            labelText: qsTr("Fizz Value")
        }

        UserInputField {
            id: buzzInputField
            labelText: qsTr("Buzz Value")
        }
        Button {
            id: submitButton
            text: "Submit"
            font.family: "Roboto"
        }
    }

    Separator {
        id: separator
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    ResultsTable {
        id: results
        Layout.fillHeight: true
        Layout.fillWidth: true
        visible: false
    }

    Item {
        id: placeHolder
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    Connections {
        target: submitButton
        function onClicked() {
            results.visible = true
            placeHolder.visible = false
        }
    }
}
