import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Material 2.3
//import QtGraphicalEffects 1.0

Button{
    id: btnTopBar
    property url btnIconSource: "qrc:/Images/close_icon.svg"
    property color btnColorDefault: "#00000000"
    property color btnColorMouseOver: "#00000000"
    property color btnColorClicked: "#00000000"
    property int btnRadius: 16

    QtObject{
        id: internal
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault

                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    width: 35
    height: 35
    flat: true
    //clip: true

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        radius: btnRadius
        anchors.fill: parent
        anchors.margins: 3

        Image {
            id: iconBtn
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            source:  "qrc:/Images/close_icon.svg"
            width: 16
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#CCCCCC"
            antialiasing: false
            opacity: 1
        }
    }
}


