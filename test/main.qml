import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 800
    height: 600
    property int widthColor: color1.height
    property bool iscall: false
    title: qsTr("Hello World")
    Column{

        id: regFortext
        ColorForText{
            id: color1
            color: "red"
            x: 0
        }
        ColorForText{
            id: color2
            color: "yellow"
            x: 0
            y: widthColor
        }
        ColorForText{
            id: color3
            color: "green"
            x: 0
            y: widthColor*2
        }
        ColorForText{
            id: color4
            color:"red"
            x: 0
            y: widthColor*3
        }
        state:"hide_format"
        states: State {
                    name: "show_format";
                    PropertyChanges{ target: regFortext; x: 500; y: 100; opacity:0.1; scale:0}
                }
                State {
                    name: "hide_format";
                    PropertyChanges{ target: regFortext; x: 0; }
                }
                transitions: Transition {
                    from: "*"; to: "*"; reversible: true
                        NumberAnimation{ properties: "x,y,scale"; duration: 500; }
                        PropertyAnimation{ properties: "opacity"; duration: 500}
                }
}

    Button{
        id: btnShow
        text: "try!"
        onClicked: {
//            console.info(color4.state)
//            color4.state ="show_format";
//              console.info(btnShow.y);
//            if(color4.state == "hide_format"){
//                color1.state ="show_format";
//                color2.state ="show_format";
//                color3.state ="show_format";
//                color4.state ="show_format";
//            }else{
//                color1.state ="hide_format";
//                color2.state ="hide_format";
//                color3.state ="hide_format";
//                color4.state ="hide_format";
//            }
            if(regFortext.state == "hide_format"){
                    regFortext.state = "show_format";
            }else{
                    regFortext.state = "hide_format";
            }
        }
        x: 500
        y: 200
    }
//    Button{
//        id: btnhide
//        text: "Hide!"
//        onClicked:{
//            color1.state = "hide"
//            color2.state = "hide"
//            color3.state = "hide"
//        }
//        x: 300
//        y: 300
//    }
    }

