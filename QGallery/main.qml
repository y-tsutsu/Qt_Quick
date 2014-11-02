import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import "components"

ApplicationWindow {
    visible: true
    width: 200
    height: 200    

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#222222"

        Audio {
            id: playAudio
            source: "file:///C:/work/Qt_Quick/QGallery/media/music.mp3"
            volume: 0.5
        }

        Row {
            anchors.centerIn: parent
            spacing: 5

            ImageButton {
                id: buttonPlay
                width: 70
                height: 50
                backImage: "qrc:/resources/button_border.png"
                foreImage: "qrc:/resources/button_play.png"
                onClicked: {
                    if (root.state == "playing") {
                        playAudio.pause()
                    }
                    else {
                        playAudio.play()
                    }
                }
            }

            ImageButton {
                id: buttonStop
                width: 70
                height: 50
                backImage: "qrc:/resources/button_border.png"
                foreImage: "qrc:/resources/button_stop.png"
                onClicked: playAudio.stop()
            }
        }

        states: [
            State {
                name: "playing"
                when: playAudio.playbackState == Audio.PlayingState
                PropertyChanges {
                    target: buttonPlay
                    foreImage: "qrc:/resources/button_pause.png"
                }
            }
        ]
    }
}
