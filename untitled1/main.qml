
import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

Window {
    id: root
    visible: true
    width: 1366
    height: 760
    title: qsTr("Something here")

    Image{
        id: background
        anchors.fill: parent;
        source: "/files/images/giaodienbibi.png"
        states: State {
            name: "fix_opacity"
            PropertyChanges { target: background; opacity: 0.5 }
        }
        transitions: Transition {
            SequentialAnimation {
                PropertyAnimation { property: "opacity"; duration: 1000 }
            }
        }
    }

    Image{
        id: truyen
        x:  250
        y:  520
        source: "/files/images/truyen.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                rainstar.visible = true;
                background.state = "fix_opacity"
                rainstar.state = "moving"
            }
        }
        SequentialAnimation {
            alwaysRunToEnd: true
            loops: Animation.Infinite
            running: true
            NumberAnimation { target: truyen; property: "scale"; from: 1; to: 1.1; duration: 1500}
            NumberAnimation { target: truyen; property: "scale"; from: 1.1; to: 1; duration: 800}
        }
    }
    AnimatedImage{
        id: rainstar
        source: "/files/images/rainstar.gif"
        x: 0
        y: root.height * 0.1
        visible: false
        AnimatedImage{
            id: danceImage
            source: "/files/images/dance2.gif"
            anchors.centerIn: rainstar
            x: 0
            y: root.height * 0.5 - 100

        }
        states: State {
            name: "moving"
            PropertyChanges { target: rainstar; x: 950 }
        }


        transitions: Transition {
            SequentialAnimation {
                PropertyAnimation { property: "x"; duration: 3000 }
            }
        }

    }




}
