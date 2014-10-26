import QtQuick 2.0

Rectangle {
    width: 200
    height: 200

    Rectangle {
        id: rect
        width: 50
        height: 50
        color: "Tomato"

        SequentialAnimation {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                id: ani
                target: rect
                property: "x"
                to: 150
                duration: 1000
            }

            ScriptAction {
                script: rect.changeColor()
            }

            ParallelAnimation {
                NumberAnimation {
                    target: rect
                    property: "x"
                    to: 0
                    duration: 1000
                }
                NumberAnimation {
                    target: rect
                    property: "y"
                    to: 150
                    duration: 1000
                }
            }

            ScriptAction {
                script: rect.changeColor()
            }

            NumberAnimation {
                target: rect
                property: "y"
                to: 0
                duration: 1000
            }

            ScriptAction {
                script: rect.changeColor()
            }
        }

        function changeColor() {
            color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
        }
    }
}
