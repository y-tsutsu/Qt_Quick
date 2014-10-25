import QtQuick 2.0
import "component"

Rectangle {
    width: 200
    height: 200

    Column {
        anchors.centerIn: parent
        spacing: 10

        Button {
            id: button1
            caption: "Button1"
            onClicked: {
                console.debug("click " + caption)
            }
        }

        Button {
            id: button2
            caption: "Button2"
            onClicked: {
                console.debug("click " + caption)
            }
        }
    }
}
