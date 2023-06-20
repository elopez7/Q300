

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

    Label {
        id: resultsLabel
        color: "#1d5888"
        text: qsTr("Results")
        verticalAlignment: Text.AlignBottom
        Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
        Layout.fillWidth: true

        font {
            pixelSize: 24
            family: "Roboto"
            bold: true
        }
    }
    Rectangle {
        id: separator
        color: "#a1a1a1"
        Layout.maximumHeight: 8
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
