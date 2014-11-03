import QtQuick 2.0
import QtMultimedia 5.0
import Qt.labs.folderlistmodel 1.0

ListView {
    id: root
    clip: true

    property string pathPrefix: "file:///"
    property alias folder: folderlist.folder

    signal selected(string filePath, int type)

    property var suffix2Type: {
        "mp3" : 1, "m4a" : 1, "wma" : 1
    }

    model: FolderListModel {
        id: folderlist
        showDirsFirst: true
        showDotAndDotDot: true
        nameFilters: makeFilter()
        function makeFilter() {
            var ret = []
            for (var suffix in suffix2Type) {
                ret.push("*." + suffix)
            }
            return ret
        }
    }

    highlight: Rectangle {
        color: "#22ffffff"
    }

    delegate: MouseArea {
        id: item
        width: root.width
        height: info.height * 1.1

        property string filePath: model.filePath
        property int type: {
            var extension = getExtension(model.fileName)
            model.fileIsDir ? 0 : suffix2Type[extension]
        }

        function getExtension(fileName) {
            if (!fileName) return ""

            var fileTypes = fileName.split(".")
            var len = fileTypes.length
            if (len === 0 || len === 1) return ""

            return fileTypes[len - 1].toLowerCase()
        }

        onClicked: {
            if (type === 0) {
                currentIndex = -1
                folderlist.folder = pathPrefix + model.filePath
            } else {
                currentIndex = index
                selected(pathPrefix + model.filePath, type)
            }
        }

        Row {
            id: info
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5
            smooth: true

            Image {
                id: icon
                width: 40
                height: 35
                fillMode: Image.PreserveAspectFit
                source: "qrc:/resources/icon_folder.png"
                states: [
                    State {
                        when: type === 1
                        PropertyChanges {
                            target: icon
                            source: "qrc:/resources/icon_music.png"
                        }
                    }
                ]
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    text: model.fileName
                    color: "#ffffff"
                }
            }
        }
    }

    function getNext() {
        var path = ""
        var path_old = currentItem.filePath
        var type_old = currentItem.type
        var index_old = currentIndex

        incrementCurrentIndex()
        for (var i = currentIndex; i < count; i++) {
            currentIndex = 1
            if (currentItem.type === type_old) {
                path = currentItem.filePath
                break
            }
        }

        if (path.length < 1) {
            path = path_old
            currentIndex = index_old
        }

        return path
    }
}
