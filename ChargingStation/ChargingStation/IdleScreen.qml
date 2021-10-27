import QtQuick 2.0

Item {
    Image {
        id: background
        source: "/images/idle_screen_1.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        height: 700
        width: 1600
    }

    Text{
        id: idleText
        anchors.top: background.bottom
        anchors.horizontalCenter: background.horizontalCenter
        anchors.topMargin: 60
        text: qsTr("Please use your RFID card or App\nto start the charging process!")
        font.pointSize: 20
        font.family: "Helvetica"
    }
}
