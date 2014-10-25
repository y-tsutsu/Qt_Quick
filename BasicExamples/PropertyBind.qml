import QtQuick 2.0

Rectangle {
    id: root

    width: 100
    height: 62

    Rectangle {
        id: rect

        anchors.centerIn: parent

        width: text.contentWidth * 1.1
        height: text.contentHeight * 1.1

        color: "red"

        Text {
            id: text

            anchors.centerIn: parent
            text: "Hello World"

            font.pixelSize: root.height * 0.3
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            text.font.pixelSize = 20
        }
    }
}
