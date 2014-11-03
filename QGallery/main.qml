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

        Information {
            id: information
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10

            title: toStr(playAudio.metaData.title)
            artist: toStr(playAudio.metaData.author)
            album: toStr(playAudio.metaData.albumTitle)

            position: playAudio.position
            duration: playAudio.duration

            onPositionRequested: {
                if (playAudio.playbackState === Audio.PlayingState) {
                    playAudio.seek(position)
                }
            }
        }

        Controller {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: information.bottom
            anchors.margins: 10
            playing: playAudio.playbackState === Audio.PlayingState
            onPlayClicked: playAudio.play()
            onPauseClicked: playAudio.pause()
            onStopClicked: playAudio.stop()
        }
    }
}
