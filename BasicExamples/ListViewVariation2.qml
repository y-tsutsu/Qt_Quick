import QtQuick 2.0

Rectangle {
    width: 100
    height: 200

    ListView {
        id: list
        anchors.fill: parent

        model: [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

        delegate: Rectangle {
            width: list.width
            height: text.contentHeight * 2
            border.color: "LightGray"
            border.width: 1

            Text {
                id: text
                anchors.centerIn: parent
                font.pointSize: 14
                text: index + " : " + model.modelData
            }
        }
    }
}
