import QtQuick 2.0

Rectangle {
    width: 200
    height: 200

    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2
        radius: 10
        antialiasing: true
        color: "LightSkyBlue"
        border.color: "DarkGray"
        border.width: 3

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }

        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed
                PropertyChanges {
                    target: rect
                    color: "Crimson"
                    border.color: "DarkRed"
                }
            },
            State {
                name: "hover"
                when: mouseArea.containsMouse
                PropertyChanges {
                    target: rect
                    color: "RoyalBlue"
                    border.color: "MidnightBlue"
                }
            }
        ]

        transitions: [
            Transition {
                from: "hover"
                to: "pressed"
                ColorAnimation {
                    target: rect
                    property: "color"
                    duration: 200
                }
            }
        ]
    }
}
