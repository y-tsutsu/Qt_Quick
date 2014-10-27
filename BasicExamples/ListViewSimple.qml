import QtQuick 2.0

Rectangle {
    width: 100
    height: 200

    ListView {
        id: list
        anchors.fill: parent

        model: ListModel {
            ListElement { value: "Item1" }
            ListElement { value: "Item2" }
            ListElement { value: "Item3" }
            ListElement { value: "Item4" }
            ListElement { value: "Item5" }
            ListElement { value: "Item6" }
            ListElement { value: "Item7-1\nItem7-2" }
            ListElement { value: "Item8" }
            ListElement { value: "Item9" }
        }

        delegate: Rectangle {
            width: list.width
            height: text.contentHeight * 2
            border.color: "LightGray"
            border.width: 1
            Text {
                id: text
                anchors.centerIn: parent
                text: model.value
                font.pointSize: 14
            }
        }
    }
}
