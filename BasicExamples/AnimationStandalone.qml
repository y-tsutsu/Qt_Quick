import QtQuick 2.0

Rectangle {
    width: 200
    height: 200

    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: 50
        height: 50
        antialiasing: true
        color: "RoyalBlue"

        NumberAnimation {
            target: rect
            property: "rotation"
            from: 0
            to: 360
            duration: 5000
            running: true
            loops: Animation.Infinite
        }

//        NumberAnimation on rotation {
//            from: 0
//            to: 360
//            duration: 5000
//            loops: Animation.Infinite
//        }
    }
}
