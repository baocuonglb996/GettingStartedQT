import QtQuick 2.0
import QtQuick.Window 2.0
Rectangle {
    x: 0
    y: 0
    id: color1
    property int yMovetoButton: 100
    width: Screen.height/15
    height: width
    radius: 10
//                state:"hide_format"
//                states: State {
//                            name: "show_format";
//                            PropertyChanges{ target: color1; x: 500; y: 100; opacity:0.1; scale:0}
//                        }
//                        State {
//                            name: "hide_format";
//                            PropertyChanges{ target: color1; x: 0; }
//                        }
//                        transitions: Transition {
//                            from: "*"; to: "*"; reversible: true
//                                NumberAnimation{ properties: "x,y,scale"; duration: 500; }
//                                PropertyAnimation{ properties: "opacity"; duration: 500}
//                        }



//    states: State {
//        name: "show";
//        PropertyChanges { target: color1; x: endedPosition ; rotation: showRotation; }
//    }
//    State {
//        name: "hide";
//        PropertyChanges { target: color1; x: startedPosition ; rotation: hideRotation; }
//    }

//    transitions: Transition {
//        from: "hide"; to: "show"; reversible: true
//            NumberAnimation { properties: "x,rotation"; duration: 500; easing.type: Easing.InOutQuad }
//    }
//    Transition{
//        from: "show"; to:"hide"
//        NumberAnimation {properties: "x,rotation"; duration: 500; easing.type: Easing.InOutQuad }
//    }
}
