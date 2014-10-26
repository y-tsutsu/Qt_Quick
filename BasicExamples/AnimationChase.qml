import QtQuick 2.0

Rectangle {
    width: 360
    height: 360
    color: "#000000"

    Rectangle {
        id: rect
        x: 50
        y: 50
        width: 50
        height: 50
        radius: 10
        antialiasing: true
        color: "RoyalBlue"

        Behavior on x {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutBounce
            }
        }

        Behavior on y {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutBounce
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.x = mouse.x - rect.width / 2
            rect.y = mouse.y - rect.height / 2
        }
    }
}
