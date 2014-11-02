import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import "components"

ApplicationWindow {
    visible: true
    width: 360
    height: 150

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#222222"

        Audio {
            id: playAudio
            source: "file:///C:/work/Qt_Quick/QGallery/media/music.mp3"
            volume: 0.5
        }

        Controller {
            anchors.centerIn: parent
            playing: playAudio.playbackState == Audio.PlayingState
            onPlayClicked: playAudio.play()
            onPauseClicked: playAudio.pause()
            onStopClicked: playAudio.stop()
        }
    }
}
