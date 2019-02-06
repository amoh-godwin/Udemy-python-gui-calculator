import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.4
import "customs"

ApplicationWindow {
    visible: true
    width: 320
    height: 580

    property string screenProblem: "0"
    property string bg_problem: ""
    property string evaluation: "784"
    property color func_color: "#f1f1f1"
    property color mem_color: "#50000000"
    property bool computed: false


    signal btn_click(string no)

    signal mem_click(string mem_str)

    signal uniClick(string code, string repl)

    signal deleteText(string code)

    onBtn_click: {
        var stat;
        stat = no

        if(computed) {
            screenProblem = "0"
            bg_problem = "0"
            evaluation = ""
            computed = false
        }

        if(screenProblem != "0") {
            screenProblem += stat
            bg_problem += stat
        } else {
            screenProblem = stat
            bg_problem = stat
        }
    }

    onUniClick: {

        if(computed) {
            screenProblem = "0"
            bg_problem = "0"
            evaluation = ""
            computed = false
        }

        var stat = "<span style='font-family: Segoe MDL2 Assets; font-size: 18px;' > " + code + " </span>"
        if(screenProblem != "0") {
            screenProblem += stat
            bg_problem += repl
        } else {
            screenProblem = stat
            bg_problem = repl
        }
    }

    onDeleteText: {
        //
    }

    RowLayout {
        anchors.fill: parent

        Rectangle {
            Layout.preferredWidth: 320
            Layout.preferredHeight: 580
            color: "lightgrey"

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.alignment: Qt.AlignCenter
                    id: answer_sheet
                    Layout.fillWidth: true
                    Layout.preferredHeight: width > 300 ? 128 : 48
                    Layout.maximumWidth: 480
                    color: "white"

                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: "lightgrey"
                    }

                    ColumnLayout {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter

                        Label {
                            text: screenProblem
                            textFormat: Text.RichText
                            font.family: "Segoe UI Semilight"
                            font.pixelSize: 42
                            font.bold: true
                        }

                        Label {
                            Layout.alignment: Qt.AlignRight
                            text: evaluation
                            font.family: "Segoe UI Semilight"
                            font.pixelSize: 24
                            font.bold: true
                            color: mem_color
                        }


                    }

                }

                Rectangle {
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.maximumWidth: 480
                    color: "#ccc"

                    GridLayout {
                        anchors.fill: parent
                        columns: 4
                        rowSpacing: 1
                        columnSpacing: 1

                        CalcButton {
                            text: "mc"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: mem_color
                            bg_color: func_color

                            onClicked: mem_click(this.text)

                        }

                        CalcButton {
                            text: "m+"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: mem_color
                            bg_color: func_color

                            onClicked: mem_click(this.text)

                        }

                        CalcButton {
                            text: "m-"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: mem_color
                            bg_color: func_color

                            onClicked: mem_click(this.text)

                        }

                        CalcButton {
                            text: "mr"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: mem_color
                            bg_color: func_color

                            onClicked: mem_click(this.text)

                        }

                        CalcButton {
                            text: "C"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: "dodgerblue"
                            bg_color: func_color

                            onClicked: screenProblem = "0"

                        }

                        CalcButton {
                            text: "\uE94A"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: "dodgerblue"
                            bg_color: func_color

                            onClicked: uniClick(this.text, '/')

                        }

                        CalcButton {
                            text: "\uE947"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: "dodgerblue"
                            bg_color: func_color

                            onClicked: uniClick(this.text, '*')

                        }

                        CalcButton {
                            text: "\uE94F"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: "dodgerblue"
                            bg_color: func_color

                            onClicked: deleteText(this.text)

                        }

                        CalcButton {
                            text: "7"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "8"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "9"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "\uE949"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: "dodgerblue"
                            bg_color: func_color

                            onClicked: uniClick(this.text, '-')

                        }


                        CalcButton {
                            text: "4"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "5"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "6"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "\uE948"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1
                            txt_color: "dodgerblue"
                            bg_color: func_color

                            onClicked: uniClick(this.text, '+')

                        }

                        CalcButton {
                            text: "1"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "2"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }


                        CalcButton {
                            text: "3"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "\uE94E"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 2
                            Layout.columnSpan: 1
                            txt_color: "white"
                            bg_color: "dodgerblue"

                            onClicked: {
                                computed = true
                                Calculator.compute(bg_problem)
                            }

                        }

                        CalcButton {
                            text: "\uE94C"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: uniClick(this.text, '%')

                        }

                        CalcButton {
                            text: "0"
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }

                        CalcButton {
                            text: "."
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rowSpan: 1
                            Layout.columnSpan: 1

                            onClicked: btn_click(this.text)

                        }



                    }

                }


            }

        }

    }

    Connections {
        target: Calculator

        onEvaluated: {
            var result = evaluate
            evaluation = result
        }

    }

}
