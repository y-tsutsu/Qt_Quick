import QtQuick 2.0

Rectangle {
    width: 200
    height: 200

    MouseArea {
        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        onClicked: {
            console.debug("click under element")
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2
        radius: 10
        antialiasing: true

        color: mouseArea.containsMouse ? "RoyalBlue" : "LightSkyBlue"

        border.color: mouseArea.pressed ? "Red" : "DarkGray"
        border.width: 3

        MouseArea {
            id: mouseArea
            anchors.fill: parent

            acceptedButtons: Qt.LeftButton | Qt.RightButton

            hoverEnabled: true

            onCanceled: console.debug("canceled")
            onClicked: console.debug("click(" + mouse.x + "," + mouse.y + ")")
            onDoubleClicked: console.debug("double click")
            onEntered: console.debug("entered")
            onExited: console.debug("exited")
            onPositionChanged: console.debug("position changed(" + mouse.x + "," + mouse.y + ")")
            onPressAndHold: console.debug("press and hold")
            onPressed: console.debug("pressed")
            onReleased: console.debug("released")
            onWheel: console.debug("wheel")
        }
    }

    Column {
        Text { text: "containsMouse = " + mouseArea.containsMouse }
        Text { text: "pressed = " + mouseArea.pressed }
        Text { text: "pressedButtons = " + mouseArea.pressedButtons }
    }
}
