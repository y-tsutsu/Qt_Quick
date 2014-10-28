import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0

ApplicationWindow {
    visible: true
    width: 200
    height: 200    

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#222222"

        Text {
            id: text
            anchors.centerIn: parent
            text: qsTr("Play")
            color: "#dddddd"
        }

        Audio {
            id: playAudio
            source: "file:///C:/work/Qt_Quick/QGallery/media/music.mp3"
            volume: 0.5
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (root.state === "playing") {
                    playAudio.pause()
                } else {
                    playAudio.play()
                }
            }
        }

        states: [
            State {
                name: "playing"
                when: playAudio.playbackState === Audio.PlayingState
                PropertyChanges {
                    target: text
                    text: qsTr("Pause")
                }
            }
        ]
    }
}
