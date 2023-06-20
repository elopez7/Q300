

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    color: "#262a2d"

    ColumnLayout {
        id: tableLayout
        anchors.fill: parent

        Label {
            id: tableLabel
            color: "#ffffff"
            text: qsTr("Fizz Buzz Results")
            font.pixelSize: 16
            font.bold: true
            font.family: "Roboto"
            Layout.fillWidth: true
        }

        TableView {
            id: resultsTable
            Layout.fillHeight: true
            Layout.fillWidth: true
            rowSpacing: 1
            columnSpacing: 1
            clip: true
        }
    }
}
