import QtQuick
import QtQuick.Controls

ProgressBar {
    id: control
    value: 0.5
    padding: 2

    property real vlaue: 0

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 6
        color: "#1E1E1E"
        radius: 3
    }

    contentItem: Item {
        id: item1
        implicitWidth: 200
        implicitHeight: 4

        Rectangle {
            width: vlaue
            radius: 2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            color: "#BDBDBD"
        }
    }
}
