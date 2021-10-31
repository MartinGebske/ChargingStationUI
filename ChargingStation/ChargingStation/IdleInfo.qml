import QtQuick 2.0

Rectangle{
    id: idleInfo
    width: 80
    height: 80
    color: "transparent"

    property string source: ""
    property string description: ""


    Image{
        id: img
        width: 80
        height: 80
        source: idleInfo.source

        Text{
            id: txt
            color: "white"
            anchors.horizontalCenter: img.horizontalCenter
            anchors.top: img.bottom
            anchors.topMargin: 10
            text: qsTr(description)
        }
    }
}
