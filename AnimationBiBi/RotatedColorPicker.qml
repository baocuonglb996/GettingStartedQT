import QtQuick 2.0
import QtQuick.Window 2.0

Item {
    Rectangle{
        id: wrapperReg
        x : 0

    Image {
    //chon mau cho Text
        id: colorPickBut
        width: color1.width
        height: width
        y: 470
        z: color9.z + 1
        source: "/files/images/color.png"
    //                defaultImageSource: "/files/images/color.png"
    //                pressImageSource: "/files/images/color.png"
        state: "rotated"
        states: State {
                name: "rotated"
                PropertyChanges { target: colorPickBut ; rotation: 180 }
            }
                State {
                name: "unrotated"
                PropertyChanges { target: colorPickBut ; rotation: -180 }
            }
            transitions: Transition {
                RotationAnimation { duration: 500; }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(colorPickBut.state == "rotated"){
                        colorPickBut.state = "unrotated"
                        color1.state = "show"
                        color2.state = "show"
                        color3.state = "show"
                        color4.state = "show"
                        color5.state = "show"
                        color6.state = "show"
                        color7.state = "show"
                        color8.state = "show"
                        color9.state = "show"
                    }else {
                        colorPickBut.state = "rotated"
                        color1.state = "hide"
                        color2.state = "hide"
                        color3.state = "hide"
                        color4.state = "hide"
                        color5.state = "hide"
                        color6.state = "hide"
                        color7.state = "hide"
                        color8.state = "hide"
                        color9.state = "hide"
                    }
                    buiRow.visible = false
                }
            }


        }
        ColorForText{
            id: color1
            color: "red"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: 180
        }
        ColorForText{
            id: color2
            color: "orange"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: 2*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color1.rotation + 180
        }
        ColorForText{
            id: color3
            color: "yellow"

            state: "hide"
            onClicked: {
                textColor = color
            }
            fx: 3*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color2.rotation + 180
        }
        ColorForText{
            id: color4
            color: "green"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: 4*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color3.rotation + 180
        }
        ColorForText{
            id: color5
            color: "blue"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: 5*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color4.rotation + 180
        }
        ColorForText{
            id: color6
            color: "blueviolet"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: 6*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color5.rotation + 180
        }
        ColorForText{
            id: color7
            color: "purple"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: 7*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color6.rotation + 180
        }
        ColorForText{
            id: color8
            color: "black"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: 8*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color7.rotation + 180
        }
        ColorForText{
            id: color9
            color: "white"
            state: "hide"
            onClicked: {
                textColor = color
            }
              fx: 9*xtransilation
    //                    tx: colorPickBut.x
            fromRotate: 180
    //                    toRotate: color8.rotation + 180
        }
       }



}
