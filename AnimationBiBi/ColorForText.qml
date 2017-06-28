import QtQuick 2.0
import QtQuick.Window 2.0
Rectangle {
    signal clicked()
    property double fx: 0//ended position
    property double tx: 0//begin position
    property int fromRotate: 0
    property int toRotate: 0
    id: color1
    width: Screen.height/15
    height: width
    radius: 10
    x:tx
    y: 450
    MouseArea {
        anchors.fill: parent
        onClicked: {
            color1.clicked()
            textColor = color;
        }
    }
    states: State {
        name: "show";
        PropertyChanges { target: color1; x: fx ; rotation: fromRotate; }
    }
    State {
        name: "hide";
        PropertyChanges { target: color1; x: tx ; rotation: toRotate; }
    }

    transitions: Transition {
        from: "hide"; to: "show"; reversible: true
            NumberAnimation { properties: "x,rotation"; duration: 500; easing.type: Easing.InOutQuad }
    }
}
