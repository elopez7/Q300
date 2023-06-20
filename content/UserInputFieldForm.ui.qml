

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    id: root

    property alias labelText: inputFieldLabel.text
    property alias inputFieldText: inputField.text

    Label {
        id: inputFieldLabel
        text: qsTr("Input Field")
        verticalAlignment: Text.AlignBottom
        Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
        Layout.fillWidth: true
        font {
            pixelSize: 16
            family: "Roboto"
        }
    }
    TextField {
        id: inputField
        Layout.fillWidth: true
        placeholderText: qsTr("Enter a number")
        validator: IntValidator {
            bottom: 0
        }
        font {
            pixelSize: 16
            family: "Roboto"
        }
    }
}
