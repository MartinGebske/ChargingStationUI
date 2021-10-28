import QtQuick 2.0

Rectangle{
    id: rec
    anchors.fill: parent
    color: "white"
    property int currentIndex: 1
    property int nextIndex: 2
    property bool allowBehaviour: true
    Component.onCompleted: {
        currentImage.opacity = 1;
        nextImage.opacity = 0;
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
        Behavior on opacity {
            enabled: allowBehaviour
            NumberAnimation { easing.type: Easing.InOutQuad; duration: 1500 }
        }
    }
    Image {
        id: nextImage
        source: "/Assets/Img/idle_screen_2.png"
        opacity: 0
        anchors.fill: currentImage
        Behavior on opacity {
            enabled: allowBehaviour
            NumberAnimation { easing.type: Easing.InOutQuad; duration: 1500 }
        }

    }
    Timer {
        interval: 3000
        repeat: true
        running: true
        onTriggered: {
            // [6] Block the Behaviour animation.
            allowBehaviour = false;
            // [7] Advance the indices.
            currentIndex = nextIndex;
            ++nextIndex;
            // [8] This is key, set the current
            // image to visible and the next
            // image to invisible. This happens
            // instantly as the Behaviour is off.
            currentImage.opacity = 1;
            nextImage.opacity = 0;

            nextIndex = currentIndex;
            --nextIndex
            // [9] Turn the behaviour so the
            // opacity change at [10] will
            // cause an animation.
            allowBehaviour = true;
            // [10] Like [3] set the current
            // image to fade out and the
            // next image to fade in.
            currentImage.opacity = 0;
            nextImage.opacity = 1;
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
