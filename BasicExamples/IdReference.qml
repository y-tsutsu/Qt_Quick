import QtQuick 2.0

Rectangle {
    id: lv1
    x: lv2.x
    y: lv3.y
    width: 200
    height: 200
    color: "Tomato"

    Rectangle {
        id: lv2
        x: 50
        y: lv3.y
        width: 50
        height: 50
        color: "Plum"
    }

    Rectangle {
        id: lv3
        x: lv2.x
        y: 50
        width: 25
        height: 25
        color: "Lime"
    }
}
