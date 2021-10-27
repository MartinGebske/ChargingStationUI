import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("HPC")
    id: root

    Loader{
        id: pageLoader
        anchors.fill: parent
        source: "IdleScreen.qml"

    }
}
