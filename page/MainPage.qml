import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.3
import "../components"

Window {
    id: mainWindow
    width: 1280
    height: 680
    color: "#00000000"
    visible: true
    title: qsTr("Testing.......")
    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: winBg
        color: "#1e1e1e"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10

        Rectangle {
            id: leftmenu
            width: 50
            color: "#333333"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        Rectangle {
            id: upperTitleBar
            height: 22
            color: "#323233"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: leftmenu.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            MouseArea {
                id: mouseArea
                anchors.fill: upperTitleBar
                property point lastMousePos: Qt.point(0, 0)
                x: 0
                y: 0
                onPressed: { lastMousePos = Qt.point(mouseX, mouseY); }
                onMouseXChanged: mainWindow.x += (mouseX - lastMousePos.x)
                onMouseYChanged: mainWindow.y += (mouseY - lastMousePos.y)
            }

            Image {
                id: image1
                width: 22
                height: 22
                anchors.top: parent.top
                anchors.topMargin: 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                anchors.left: parent.left
                anchors.leftMargin: -35
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/Images/pngwing.png"
            }
            Row{
                id: rowBtn
                x: 1110
                width: 100
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

                TopUpperBtn {
                    id: minBtn
                    flat: true
                    btnIcon: "../Images/minimize_icon.svg"
                    colorMouseOver: "#4D4D4E"
                    colorMouseDown: "#6F6F6F"
                }

                TopUpperBtn {
                    id: maxBtn
                    anchors.left: minBtn.right
                    flat: true
                    anchors.leftMargin: 5
                    colorMouseOver: "#4D4D4E"
                    colorMouseDown: "#6F6F6F"
                    btnIcon: "../Images/maximize_icon.svg"

                }

                TopUpperBtn {
                    id: closeBtn
                    anchors.left: maxBtn.right
                    flat: true
                    anchors.leftMargin: 5
                    colorMouseOver: "#E60A2B"
                    colorMouseDown: "#A1212F"
                    onClicked: mainWindow.close()
                }
            }

        }

        Rectangle {
            id: rectangle
            color: "#1e1e1e"
            radius: 3
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: leftmenu.right
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: upperTitleBar.bottom
            anchors.topMargin: 0

            Image {
                id: image
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/Images/VisualMainpageLogo.png"
            }
        }

    }


}


