import QtQuick 2.0

Item {
    Image{
        id: backgroundImage
        anchors.fill: parent
        source: "qrc:/Assets/Img/background.jpg"

    }

    Rectangle {
        id: chargingBackground
        color: "white"
        opacity: 0.5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 100
        height: 300
        width: 700


        Image {
            id: ccs1
            source: "qrc:/Assets/Img/ccs_logo.png"
            height: 200
            width: 200
            anchors.left: chargingBackground.left
            anchors.verticalCenter: chargingBackground.verticalCenter
            anchors.verticalCenterOffset: -30
            anchors.leftMargin: 30

        }
        MouseArea{
            anchors.fill: ccs1
            onClicked: {console.debug("ccs 1 clicked"); t.running = false}
        }
        Text{
            anchors.bottom: chargingBackground.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: ccs1.horizontalCenter
            text: "300kW"
            font.pointSize: 20
            font.family: "Helvetica"
        }


        Image {
            id: ccs2
            source: "qrc:/Assets/Img/ccs_logo.png"
            height: 200
            width: 200
            anchors.verticalCenter: chargingBackground.verticalCenter
            anchors.verticalCenterOffset: -30
            anchors.left: ccs1.right
            anchors.leftMargin: 30
        }
        MouseArea{
            anchors.fill: ccs2
            onClicked: {console.debug("ccs 2 clicked"); t.running = false}
        }

        Text{
            anchors.bottom: chargingBackground.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: ccs2.horizontalCenter
            text: "300kW"
            font.pointSize: 20
            font.family: "Helvetica"
        }

        Image {
            id: ac1
            source: "qrc:/Assets/Img/ac_logo.png"
            height: 150
            width: 150
            anchors.verticalCenter: chargingBackground.verticalCenter
            anchors.verticalCenterOffset: -30
            anchors.left: ccs2.right
            anchors.leftMargin: 55
        }
        MouseArea{
            anchors.fill: ac1
            onClicked: {console.debug("ac clicked"); t.running = false}
        }
        Text{
            anchors.bottom: chargingBackground.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: ac1.horizontalCenter
            text: "42kW"
            font.pointSize: 20
            font.family: "Helvetica"
        }


        Text{
            id: welcomeText
            anchors.top: chargingBackground.bottom
            anchors.horizontalCenter: chargingBackground.horizontalCenter
            anchors.topMargin: 20
            text: qsTr("Please select your charging pod.")
            font.pointSize: 20
            font.family: "Helvetica"
        }
    }

    LoadManager{
        id:l
    }

    Timer{
        id: t
        interval: 1000
        running: true
        onTriggered: lm.source = "IdleScreen.qml"
    }
}
