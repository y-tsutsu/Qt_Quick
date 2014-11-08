import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import "components"

ApplicationWindow {
    visible: true
    width: 360
    height: 400

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#222222"

        Audio {
            id: playAudio
            volume: 0.5
            autoPlay: true
        }

        Information {
            id: information
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10

            title: toStr(controller.player.metaData.title)
            artist: toStr(controller.player.metaData.author)
            album: toStr(controller.player.metaData.albumTitle)

            position: controller.player.position
            duration: controller.player.duration

            onPositionRequested: {
                if (controller.player.playbackState === Audio.PlayingState && controller.player.seekable) {
                    controller.player.seek(position)
                }
            }
        }

        Controller {
            id: controller
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: information.bottom
            anchors.margins: 10

            property var player: playAudio

            playing: player.playbackState === Audio.PlayingState

            onPlayClicked: player.play()
            onPauseClicked: player.pause()
            onStopClicked: player.stop()
            onPreviousClicked: player.source = contentsList.getPrevious()
            onNextClicked: player.source = contentsList.getNext()
        }

        ContentsList {
            id: contentsList
            anchors.top: controller.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10

            onSelected: {
                setContent(filePath, type)
            }

            Component.onCompleted: {
                folder = "file:///m:/"
            }

            function setContent(path, type) {
                playAudio.stop()
                playVideo.stop()

                if (type === 1) {
                    controller.player = playAudio
                    playAudio.source = path
                }
                else if (type === 2) {
                    controller.player = playVideo
                    playVideo.source = path
                }
            }
        }

        VideoView {
            id: playVideo
            anchors.top: controller.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10
            visible: false
        }
    }
}
