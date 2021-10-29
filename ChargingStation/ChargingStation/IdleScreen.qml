import QtQuick 2.12

Item{
    Rectangle{
        id: rec
        anchors.fill: parent
        color: "#f7b7e1"
    }

    Image{
        id: idleBackground
        anchors.fill: parent
        source: "/Assets/Img/idle_background.jpg"
        opacity: 0.5
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
        loops: Animation.Infinite // kann man pausieren....
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

    Text{
        id: idleText
        anchors.top: currentImage.bottom
        anchors.horizontalCenter: currentImage.horizontalCenter
        anchors.topMargin: 60
        text: qsTr("Please use your RFID card or App\nto start the charging process!")
        font.pointSize: 20
        font.family: "Helvetica"
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
