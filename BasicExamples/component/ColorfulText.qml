import QtQuick 2.0

Rectangle {
    width: text.contentWidth * 1.1
    height: text.contentHeight * 1.1
    antialiasing: true

    property string text: ""
    property alias foreColor: text.color
    property alias font: text.font

    Text {
        id: text
        anchors.centerIn: parent
        text: parent.text
    }

    function lighter() {
        color = Qt.lighter(color)
    }
}
