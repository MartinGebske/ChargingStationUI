import QtQuick 2.15
import QtQuick.Window 2.15
import de.martingebske 1.0


Window {
    width: 1024
    height: 768
    visible: true
    title: qsTr("HPC")
    id: root

    HPC_Manager{
        id: hpcManager
    }


    LoadManager{
    id: lm
    source: "IdleScreen.qml"
    }

}
