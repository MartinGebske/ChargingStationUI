import QtQuick
import QtQuick.Controls
import de.martingebske

Item {
    id: wsRoot

    Image{
        id: background
        source: "qrc:/Assets/Img/background_2.png"
        height: 768
        width: 1024
        anchors.fill: parent
    }

    Rectangle{
        id: whiteBack
        color: "white"
        opacity: 0.1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 100
        height: 300
        width: 700
    }
    Rectangle{
        id: footer
        anchors.bottom: wsRoot.bottom
        height: 70
        width: wsRoot.width
        color: "transparent"

        Button{
            id: locaButton
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 50
            text: qsTr("Language")
            width: 80
            height: 50
            onClicked: popLan.open()
        }
    }


    // Charger Selection

    Rectangle {
        id: chargingBackground
        anchors.fill: whiteBack
        color: "transparent"

        Row{
            id: chRow
            anchors.fill: parent
            spacing: 20
            topPadding: 20
            leftPadding: 30


            Button{
                id:btn1
                anchors{
                    top: parent.top
                }
                height: 50

                text: "CCS"
                onClicked: {slotSelected(1);btn1.enabled = false;}

            }

            Button{
                id:btn2
                anchors{
                    top: parent.top
                }
                height: 50

                text: "CCS"
                onClicked: {slotSelected(2); btn2.enabled = false;}
            }
            Button{
                id:btn3
                anchors{


                    top: parent.top
                }
                height: 50

                text: "AC"
                onClicked: {slotSelected(3); btn3.enabled = false;}
            }
        }



        Text{
            id: welcomeText
            color: "white"
            anchors{
                top: chargingBackground.bottom
                horizontalCenter: chargingBackground.horizontalCenter
                topMargin: 20
            }
            text: qsTr("Please select your charging pod!")
            property alias infoText: welcomeText.text
            font.pointSize: 20
            font.family: "Helvetica"
        }




        Popup{
            id: popLan
            anchors.centerIn: parent
            height: 200
            width: 400
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            Row{
                id: selection
                anchors.centerIn: parent
                Button{
                    id: ger
                    text: qsTr("German")

                }
                Button{
                    id: en
                    text: qsTr("English")
                }
            }
            Button{
                id: cls
                text: qsTr("Close")
                anchors.horizontalCenter: selection.horizontalCenter
                anchors.top: selection.bottom
                anchors.topMargin: 20
                onClicked: popLan.close()
            }
        }
    }

    // PUBLIC SPACE HERE!

    LoadManager{
        id:lm
    }

    Timer{
        id: t
        interval: 5000
        running: true
        onTriggered: lm.source = "Screen_Idle.qml"
    }
    function slotSelected(id)
    {
        if(!hpcManager.chargerIsOccupied())
        {
            hpcManager.setCurrentCharger(id)
            t.running = false
            lm.source = "Screen_Charging.qml"

        }
        else
        {
            welcomeText.infoText = "No more parking spaces available!";
            console.log("No more parking spaces available!");
        }
    }
}
