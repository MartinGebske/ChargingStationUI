import QtQuick 2.12

Item{
   id: root

    Image{
        id: idleBackground
        anchors.fill: parent
        source: "/Assets/Img/background_1.png"
    }

    Image {
        id: currentImage
        source: "/Assets/Img/idle_screen_1.png"
        opacity: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        height: 400
        width: 900
    }
    Image {
        id: nextImage
        source: "/Assets/Img/idle_screen_2.png"
        opacity: 0
        anchors.fill: currentImage
    }

    SequentialAnimation{
        id: seqAnim
        loops: Animation.Infinite
        running: true

        // Fade in
        OpacityAnimator{
            target: nextImage
            easing.type: Easing.InOutSine
            from: 1
            to: 0
            duration: 2000
        }
        PauseAnimation {
            duration: 5000
        }

        // Fade out
        OpacityAnimator{
            target: nextImage
            easing.type: Easing.InOutSine
            from: 0
            to: 1
            duration: 2000
        }
        PauseAnimation {
            duration: 5000
        }
    }

    Text {
        id: idleText
        color: "white"
        anchors.top: currentImage.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: currentImage.horizontalCenter
        text: qsTr("Please use your RFID card or App to start the charging process!")
        font.family: "Helvetica"
        font.pointSize: 20
        width: currentImage.width
        leftPadding: 200
        rightPadding: 200
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap

    }

    Rectangle{
        anchors.top: idleText.bottom
        anchors.horizontalCenter: root.horizontalCenter
        Row{
            topPadding: 50
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 60

            IdleInfo{
                source: "/Assets/Img/App_Logo.png"
                description: "App"
            }
            IdleInfo{
                source: "/Assets/Img/QR_Logo.png"
                description: "Ad-Hoc"
            }
            IdleInfo{
                source: "/Assets/Img/RFID_Logo.png"
                description: "RFID Card"
            }
        }
    }
    MouseArea{
        signal changeToPage2
        anchors.fill: parent
        onClicked: {lm.source = "WelcomeScreen.qml"}
    }
    LoadManager{
        id: lm
    }
}
