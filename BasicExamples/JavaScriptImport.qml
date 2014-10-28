import QtQuick 2.0
import "JavaScriptExternal.js" as Js

Rectangle {
    width: 100
    height: 62
    border.color: "LightGray"
    border.width: 1

    Text {
        id: text
        anchors.centerIn: parent
        text: "count"

        function update() {
            text.text = "count" + Js.getCounter()
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: text.update()
    }
}
