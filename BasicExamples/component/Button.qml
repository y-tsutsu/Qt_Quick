import QtQuick 2.0

Rectangle {
    id: root
    width: 100
    height: 62

    color: "LightBlue"

    border.color: "DarkGray"
    border.width: 1

    property alias caption: caption.text

    signal clicked(string caption)

    Text {
        id: caption
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked(caption.text)
        }
    }
}
