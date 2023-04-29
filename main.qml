                    import QtQuick 2.15
                    import QtQuick.Window 2.15
                    import QtQuick.Controls 2.15
                    import QtQuick.Layouts 1.15
                    import "components"
                    import "page"
                    import Qt5Compat.GraphicalEffects
                    import QtQuick.Controls.Material 2.3
                    //import QtQuick.Timeline 1.0
                    //import "components"
                    //import QtGraphicalEffects 1.0
                    import QtQuick.Timeline 1.0


Window {
    id: splashScreenWindow
    width: 760
    height: 450
    visible: true
    title: qsTr("Login page!")
    color: "#00000000"
    // REMOVE TITLE BAR  flags: Qt.WA_TranslucentBackground | Qt.FramelessWindowHint
    //flags: Qt.Window | Qt.FramelessWindowHint
    flags: Qt.ToolTip | Qt.FramelessWindowHint | Qt.WA_TranslucentBackground
    modality: Qt.ApplicationModal


    // timer property
    property int timeoutInterval: 1000

    Timer{
        id: timer
        interval: timeoutInterval
        running: false
        repeat: false
        onTriggered: {
            progressBarComp.visible = true
            var component = Qt.createComponent("qrc:/page/MainPage.qml");
            var window = component.createObject()
            window.show()
            visible = false
            //splashScreenWindow.timeout()
        }
    }

    //Function
    QtObject{
        id: internal
        function checkLogin(){
            if(passwordField.text == ""){
                passdLabel.visible = true
                passdLabel.text = "Password can't be empty!"
                passwordField.borderColor = "#a1212f"
            }
            else if(passwordField.text == "123456"){
                passdLabel.visible = false
                passwordField.borderColor = "#7FC241"
                timer.running = true
            }
            else if(passwordField.text != "123456"){
                passdLabel.visible = true
                passdLabel.text = "incerrect password!"
                passwordField.borderColor = "#a1212f"
            }
        }

        //text reset function
        function loginTextReset(){
            passdLabel.visible = false
        }
    }

    Rectangle {
        id: rectangle
        color: "#232323"
        radius: 4
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 150
        anchors.topMargin: 100
        anchors.bottomMargin: 100
        anchors.rightMargin: 0

        SearchTextField {
            id: userNmae
            x: 612
            y: 274
            anchors.right: parent.right
            anchors.bottom: passwordField.top
            anchors.bottomMargin: 7
            maximumLength: 6
            placeholderText: "User name"
            CustomToolTIpL {
                text: "Please enter your user name"
                inverted: false
            }
            borderColor: "#191919"
            anchors.rightMargin: 5
        }


        SearchTextField{
            id: passwordField
            x: 460
            y: 207
            borderColor: "#191919"
            placeholderText: "Your password"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 19
            anchors.rightMargin: 5
            echoMode: TextInput.Password
            maximumLength: 6
            Keys.onEnterPressed: internal.checkLogin()
            Keys.onReturnPressed: internal.checkLogin()
            Keys.onPressed: internal.loginTextReset()

            //Tool ToolTip
            CustomToolTIpL{
                text: "Please enter your password"
                inverted: true
            }

        }

        Text {
            id: passwordLabText
            x: 384
            y: 208
            width: 70
            height: 24
            opacity: 1
            color: "#dadada"
            text: qsTr("Password:")
            anchors.right: passwordField.left
            anchors.bottom: parent.bottom
            font.pixelSize: 12
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 19
            anchors.rightMargin: 6
        }


        Text {
            id: userLabText
            x: 224
            y: 0
            width: 70
            height: 24
            opacity: 1
            color: "#dadada"
            text: qsTr("User name:")
            anchors.right: userNmae.left
            anchors.bottom: passwordLabText.top
            font.pixelSize: 13
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 7
            anchors.rightMargin: 4
        }


        Label{
            id:passdLabel
            y: 230
            color: "#a1212f"
            font.pointSize: 10
            font.family: "Segoe UI"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.right: passwordField.right
            anchors.rightMargin: 0
            anchors.left: passwordField.left
            anchors.leftMargin: 0
            visible: false
            antialiasing: false
        }

        TopBarButton{
            id: closeButton
            x: 567
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8
            btnColorDefault: "#1F1F1F"
            btnColorMouseOver: "#E60A2B"
            btnColorClicked: "#A1212F"
            btnIconSource: "qrc:/Images/close_icon.svg"
            onClicked: splashScreenWindow.close()
            CustomToolTIpL{
                text: "Close!"
                inverted: true
            }

        }

        Rectangle {
            id: iconLoad
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: -148
            anchors.bottomMargin: 101
            anchors.topMargin: -99

            Text {
                id: versionText
                x: 255
                y: 325
                width: 174
                height: 23
                opacity: 0.6
                color: "#dadada"
                text: qsTr("Version 0.0.1 Copyright © 2023 Rahul")
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: -102
            }

            Image {
                id: image
                x: 147
                y: 258
                width: 197
                height: 76
                opacity: 0.5
                anchors.bottom: parent.bottom
                source: "qrc:/icons/Images/logo.png"
                anchors.bottomMargin: -89
                fillMode: Image.PreserveAspectFit
            }
        }

        Text {
            id: loadingText
            x: 97
            y: 208
            width: 174
            height: 23
            color: "#dadada"
            text: qsTr("Loading document...")
            anchors.bottom: parent.bottom
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            opacity: 0.6
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 15
        }

        Image {
            id: backImage
            x: -148
            y: -99
            opacity: 0.1
            anchors.fill: parent
            source:  "qrc:/icons/Images/logo.png"
            anchors.rightMargin: -20
            anchors.leftMargin: -20
            rotation: 25
            fillMode: Image.PreserveAspectFit


        }

        Rectangle {
            id: winDrag
            x: 16
            y: 8
            width: 545
            height: 35
            color: "#00000000"
            border.width: 0
            MouseArea {
                id: mouseArea
                anchors.fill: winDrag
                property point lastMousePos: Qt.point(0, 0)
                x: 0
                y: 0
                onPressed: { lastMousePos = Qt.point(mouseX, mouseY); }
                onMouseXChanged: splashScreenWindow.x += (mouseX - lastMousePos.x)
                onMouseYChanged: splashScreenWindow.y += (mouseY - lastMousePos.y)
            }
        }

        ProgressBarComp {
            id: progressBarComp
            x: 317
            y: 237
            width: 285
            height: 8
            visible: true
            vlaue: 0
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 8
            rotation: 0
            anchors.bottomMargin: 6
        }
    }

    DropShadow{
        id: dropShadow
        anchors.fill: rectangle
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        // samples: 17
        color: "#40000000"
        source: rectangle
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                duration: 1000
                loops: 1
                to: 5000
                from: 0
            }
        ]
        endFrame: 5000
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: image
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 3000
                value: 0.85
            }
        }

        KeyframeGroup {
            target: passwordField
            property: "placeholderText"
            Keyframe {
                frame: 0
                value: ""
            }

            Keyframe {
                frame: 250
                value: "Y"
            }

            Keyframe {
                frame: 500
                value: "Yo"
            }

            Keyframe {
                frame: 750
                value: "You"
            }

            Keyframe {
                frame: 1000
                value: "Your"
            }

            Keyframe {
                frame: 1250
                value: "Your p"
            }

            Keyframe {
                frame: 1550
                value: "Your pa"
            }

            Keyframe {
                frame: 1750
                value: "Your pas"
            }

            Keyframe {
                frame: 2000
                value: "Your pass"
            }

            Keyframe {
                frame: 2250
                value: "Your passw"
            }

            Keyframe {
                frame: 2500
                value: "Your passwo"
            }

            Keyframe {
                frame: 2750
                value: "Your passwor"
            }

            Keyframe {
                frame: 3000
                value: "Your password"
            }
        }

        KeyframeGroup {
            target: backImage
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0.02
            }

            Keyframe {
                frame: 500
                value: 0.03
            }

            Keyframe {
                frame: 1000
                value: 0.04
            }

            Keyframe {
                frame: 1500
                value: 0.05
            }

            Keyframe {
                frame: 2000
                value: 0.06
            }

            Keyframe {
                frame: 2500
                value: 0.07
            }

            Keyframe {
                frame: 3000
                value: 0.08
            }
        }

        KeyframeGroup {
            target: userNmae
            property: "placeholderText"
            Keyframe {
                frame: 0
                value: ""
            }

            Keyframe {
                frame: 250
                value: "U"
            }

            Keyframe {
                frame: 500
                value: "Us"
            }

            Keyframe {
                frame: 750
                value: "Use"
            }

            Keyframe {
                frame: 1000
                value: "User"
            }

            Keyframe {
                frame: 1250
                value: "User "
            }

            Keyframe {
                frame: 1550
                value: "User n"
            }

            Keyframe {
                frame: 1750
                value: "User na"
            }

            Keyframe {
                frame: 2000
                value: "User nam"
            }

            Keyframe {
                frame: 2250
                value: "User name"
            }
        }

        KeyframeGroup {
            target: progressBarComp
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 994
                value: 1
            }

        }

        KeyframeGroup {
            target: progressBarComp
            property: "vlaue"
            Keyframe {
                frame: 500
                value: 0
            }

            Keyframe {
                frame: 5000
                value: 285
            }

        }
    }

}




