import QtQuick 2.0
import "component"

Rectangle {
    width: 200
    height: 100

    ColorfulText {
        id: text
        anchors.centerIn: parent

        text: "Qt Green"

        foreColor: "#ffffff"
        color: "#74b928"

        font.pointSize: 32
        radius: 5
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            text.lighter()
        }
    }
}
