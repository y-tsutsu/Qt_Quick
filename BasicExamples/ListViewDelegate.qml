import QtQuick 2.0

Rectangle {
    width: 100
    height: text.contentHeight * 2
    border.color: "LightGray"
    border.width: 1
    color: mouse.pressed ? "Tomato" : "White"
    property string value: ""

    Text {
        id: text
        anchors.centerIn: parent
        font.pointSize: 14
        text: value
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            text.text = index + ":" + value
        }
    }
}
