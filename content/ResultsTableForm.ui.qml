

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels
import fizzBuzzModule

Rectangle {
    property alias fizzBuzz: fizzbuzzModel.fizzBuzz

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

        FizzBuzzModel{
            id: fizzbuzzModel
        }

        TableView {
            id: resultsTable
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            model: fizzbuzzModel
            delegate: DelegateChooser{
                role: "tableData"
                DelegateChoice{
                    roleValue: "FizzBuzz"
                    delegate: Rectangle{
                        implicitHeight: 20
                        implicitWidth: 100
                        color: model.row % 2 === 0 ? "#303437" : "#262a2d"
                        Label{
                            anchors.fill: parent
                            font{
                                family: "Roboto"
                                pixelSize: 16
                            }
                            color: "lightBlue"
                            text: model.tableData
                        }
                    }
                }
                DelegateChoice{
                    roleValue: "Fizz"
                    delegate: Rectangle{
                        implicitHeight: 20
                        implicitWidth: 100
                        color: model.row % 2 === 0 ? "#303437" : "#262a2d"
                        Label{
                            anchors.fill: parent
                            font{
                                family: "Roboto"
                                pixelSize: 16
                            }
                            color: "orangered"
                            text: model.tableData
                        }
                    }
                }
                DelegateChoice{
                    roleValue: "Buzz"
                    delegate: Rectangle{
                        implicitHeight: 20
                        implicitWidth: 100
                        color: model.row % 2 === 0 ? "#303437" : "#262a2d"
                        Label{
                            anchors.fill: parent
                            font{
                                family: "Roboto"
                                pixelSize: 16
                            }
                            color: "yellow"
                            text: model.tableData
                        }
                    }
                }
                DelegateChoice{
                    delegate: Rectangle{
                        implicitHeight: 20
                        implicitWidth: 100
                        color: model.row % 2 === 0 ? "#303437" : "#262a2d"
                        Label{
                            anchors.fill: parent
                            font{
                                family: "Roboto"
                                pixelSize: 16
                            }
                            color: "springgreen"
                            text: model.tableData
                        }
                    }
                }
            }
        }
    }
}
