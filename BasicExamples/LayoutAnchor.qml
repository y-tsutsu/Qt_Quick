import QtQuick 2.0

Rectangle {
    width: 300
    height: 300

    Rectangle {
        id: rect1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
        color: "lightGray"
        width: 100
        height: 100

        Rectangle {
            id: rect2
            anchors.centerIn: parent
            color: "Gray"
            width: 40
            height: 40
        }
    }

    Rectangle {
        id: rect3
        anchors.top: rect1.bottom
        anchors.left: rect1.right
        color: "lightGray"
        width: 150
        height: 150
    }

    Rectangle {
        id: rect4
        anchors.horizontalCenter: rect3.horizontalCenter
        anchors.verticalCenter: rect3.verticalCenter
        color: "Gray"
        width: 80
        height: 80

        Rectangle {
            id: rect5
            anchors.fill: parent
            color: "Black"
        }
    }
}
