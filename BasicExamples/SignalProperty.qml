import QtQuick 2.0

Rectangle {
    width: 200
    height: 100

    property real area : width * height

    onAreaChanged: {
        console.debug("area = " + area)
    }

    onWidthChanged: {
        console.debug("width = " + width)
    }

    onHeightChanged: {
        console.debug("height = " + height)
    }
}
