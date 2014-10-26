import QtQuick 2.0

Rectangle {
    width: 200
    height: 200

    focus: true

    Keys.onReturnPressed: {
        outputlog("return pressed", event)
        event.accepted = false
    }

    Keys.onPressed: outputlog("pressed", event)
    Keys.onReleased: outputlog("released", event)

    function outputlog(text, event) {
        var modifiers = []

        if (event.modifiers & Qt.ShiftModifier) {
            modifiers.push("shift")
        }

        if (event.modifiers & Qt.ControlModifier) {
            modifiers.push("ctrl")
        }

        if (event.modifiers & Qt.AltModifier) {
            modifiers.push("alt")
        }

        if (event.modifiers & Qt.MetaModifier) {
            modifiers.push("meta")
        }

        if (event.modifiers & Qt.KeypadModifier) {
            modifiers.push("keypad")
        }

        console.debug("%1, %2, %3, %4".arg(text).arg(event.key).arg(event.text).arg(modifiers.join(", ")))
    }
}
