import QtQuick 2.0

Rectangle {
    width: 100
    height: 200

    ListView {
        id: list
        anchors.fill: parent
        model: ListViewModel {}
        delegate: ListViewDelegate {
            width: list.width
            value: model.value
        }
    }
}
