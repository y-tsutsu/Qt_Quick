import QtQuick 2.0
import QtMultimedia 5.0

Video {
    id: root
    volume: 0.5
    autoPlay: true
    source: ""

    onSourceChanged: {
            visible = (0 < source.toString().length) ? true : false
    }

    Rectangle {
        anchors.fill: parent
        z: -1
        color: "#000000"
        opacity: 0.8

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
            onWheel: wheel.accepted = true
            onClicked: {
                if (mouse.button === Qt.RightButton) {
                    root.source = ""
                }
            }
        }
    }
}
