import QtQuick 2.0

Rectangle {
    width: 100
    height: 200

    ListView {
        id: list
        anchors.fill: parent
        model: ListModel { id: listModel }

        delegate: Rectangle {
            width: list.width
            height: text.contentHeight * 2
            border.color: "LightGray"
            border.width: 1

            Text {
                id: text
                anchors.centerIn: parent
                font.pointSize: 14
                text: model.value
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        property int counter: 0
        onPressed: {
            if (10 <= list.count) {
                list.model.remove(0)
            }

            listModel.append({ "value": "append" + counter })
            counter++

            mouce.accepted = false
        }
    }
}
