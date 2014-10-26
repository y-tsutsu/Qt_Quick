import QtQuick 2.0
import "component"

Rectangle {
    id: root
    width: buttons.width
    height: 200

    Row {
        id: buttons

        Button {
            caption: "complete"
            onClicked: anim.complete()
        }
        Button {
            caption: "pause"
            onClicked: anim.pause()
        }
        Button {
            caption: "restart"
            onClicked: anim.restart()
        }
        Button {
            caption: "resume"
            onClicked: anim.resume()
        }
        Button {
            caption: "start"
            onClicked: anim.start()
        }
        Button {
            caption: "stop"
            onClicked: anim.stop()
        }
    }

    Text {
        anchors.top: buttons.bottom
        text: "running : %1, paused : %2".arg(anim.running).arg(anim.paused)
    }

    Rectangle {
        id: rect
        anchors.verticalCenter: parent.verticalCenter

        width: root.width * 0.1
        height: root.height * 0.1
        color: "Tomato"

        NumberAnimation {
            id: anim
            target: rect
            property: "x"
            from: 0
            to: root.width * 0.9
            loops: Animation.Infinite
            duration: 2000

            onRunningChanged: console.debug("Running:" + running)
            onPausedChanged: console.debug("Paused:" + paused)
        }
    }
}
