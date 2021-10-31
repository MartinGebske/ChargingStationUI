import QtQuick 2.0
import de.martingebske

Rectangle{
    id: root
    height: 200
    width: 200
    color: "transparent"

    property string kw: ""
    property string source: ""
    property double itemHeight: 200
    property double itemWidth: 200
    property double textMargin: -70

    signal clicked()

    Image {
        id: img
        source: root.source
        height: root.itemHeight
        width: root.itemWidth

        Text{
            id: txt
            color: "white"
            anchors.bottom: img.bottom
            anchors.horizontalCenter: img.horizontalCenter
            anchors.bottomMargin: root.textMargin
            text: root.kw
            font.pointSize: 20
            font.family: "Helvetica"
        }

        MouseArea{
            id: ma
            anchors.fill: img
            enabled: true
            onClicked: {
                if(!hpcManager.chargerIsOccupied()){
                    root.clicked()
                    img.opacity = 0.2;
                    txt.opacity = 0.6;
                    ma.enabled = false
                }
                else
                    console.log("No more parking spaces available!")
            }
        }
    }
}
