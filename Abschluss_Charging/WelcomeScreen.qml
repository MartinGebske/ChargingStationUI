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
                onClicked: {slotSelected(1);
                    hpcManager.chargerIsOccupied() ?

                                btn1.enabled = false : btn1.enabled = true;}
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




        //            ChargingSlot{
        //                id: ccs1
        //                source: "qrc:/Assets/Img/ccs_logo.png"
        //                kw: "300kW"
        //                onClicked: slotSelected(1)
        //            }
        //            ChargingSlot{
        //                id: ccs2
        //                source: "qrc:/Assets/Img/ccs_logo.png"
        //                kw: "300kW"
        //                onClicked: slotSelected(2)
        //            }
        //            ChargingSlot{
        //                id: ac
        //                source: "qrc:/Assets/Img/ac_logo.png"
        //                itemHeight: 150
        //                itemWidth: 150
        //                kw: "42kW"
        //                textMargin: -120
        //                onClicked: slotSelected(3)
        //            }
        //  }
    }


    Text{
        id: welcomeText
        color: "white"
        anchors.top: chargingBackground.bottom
        anchors.horizontalCenter: chargingBackground.horizontalCenter
        anchors.topMargin: 20
        text: qsTr("Please select your charging pod!")
        property alias infoText: welcomeText.text
        font.pointSize: 20
        font.family: "Helvetica"
    }

    function slotSelected(id)
    {
        if(!hpcManager.chargerIsOccupied())
        {
            hpcManager.setCurrentCharger(id)
            t.running = false
        }
        else
        {
            welcomeText.infoText = "No more parking spaces available!";
            console.log("No more parking spaces available!");
        }
    }


    LoadManager{
        id:l
    }

    Timer{
        id: t
        interval: 5000
        running: true
        onTriggered: lm.source = "IdleScreen.qml"
    }
}
