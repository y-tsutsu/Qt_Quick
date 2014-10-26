import QtQuick 2.0

Rectangle {
    width: 200
    height: 200

    Rectangle {
        id: circle
        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2
        radius: width / 2
        antialiasing: true
        color: "LightGray"
        border.color: "DarkGray"
        border.width: 3

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            hoverEnabled: true

            onClicked: {
                switch (checkState.state) {
                case "red":
                    checkState.state = "blue"
                    console.debug("red -> blue")
                    break
                case "blue":
                    checkState.state = ""
                    console.debug("blue -> nene")
                    break
                case "":
                    checkState.state = "red"
                    console.debug("none -> red")
                    break
                default:
                    break
                }
            }
        }

        StateGroup {
            states: [
                State {
                    when: mouseArea.pressed
                    PropertyChanges {
                        target: circle
                        border.color: "DarkRed"
                    }
                },
                State {
                    when: mouseArea.containsMouse
                    PropertyChanges {
                        target: circle
                        border.color: "MidnightBlue"
                    }
                }
            ]
        }

        StateGroup {
            id: checkState
            states: [
                State {
                    name: "red"
                    PropertyChanges {
                        target: circle
                        border.color: "MistyRose"
                    }
                },
                State {
                    name: "blue"
                    PropertyChanges {
                        target: circle
                        border.color: "AliceBlue"
                    }
                }
            ]
        }
    }
}
