import QtQuick 2.0
import QtQuick.Window 2.0

Item {
    id: textLb
    property bool isChosen : false
    //text va cac thong so can luu
    property string text
    property double angl
    property bool isBold
    property bool isItalic
    property bool isUnderline
    property int fontSize: Screen.width/30
    property bool iscall : false // this variable check if the initilize function of colorITem has been called
    // cac mang su dung cho viec luu lai gia tri cua truong
    property color textColor: "green"
    property int xtransilation: color1.width
    property int xanimation_format: 0
    property int scaleanimation_format: 0
    property int opacity_format: 0
    x: Screen.width/3.8
    y: Screen.height/5
    z: 2808
    width: (textLb.text.length*fontSize/2.15> Screen.width/1.55) ?Screen.width/1.5 :textLb.text.length*fontSize/1.75
    visible: true
    enabled: true



    Text {
        id:tex
        color: textColor
        font.pixelSize: fontSize
        width:  (textLb.text.length*fontSize/2.15> Screen.width/1.55) ?Screen.width/1.5 :textLb.text.length*fontSize/1.75
        wrapMode: Text.WordWrap
        visible: textLb.visible
        text: textLb.text
        font.bold: isBold
        font.italic: isItalic
        font.underline: isUnderline
        transform:[
            Rotation {
                id: rot
                origin.x: tex.width/2
                origin.y: tex.height/2
                axis { x: 0; y: 0; z: 1 }
                angle: angl
            }
        ]

        Rectangle{
            //thanh mau xanh hien ra khi duoc chon de thao tac
            x: tex.x
            y: tex.y
            z: -1

            id:statusBar
            radius: 10
            opacity: 0.3
            visible:  (isChosen && tex.visible )?true:false
            height:tex.contentHeight
            width: tex.contentWidth
            color:"blue"
        }
        MouseArea{
            anchors.fill: parent
            drag.target: textLb
            drag.axis: Drag.XAndYAxis
            onClicked: {
                //xu ly chon
                isChosen = (isChosen)?false:true;

                if(format.visible){
                    format.visible = false;

                }else{
                    format.visible = true;

                }
//                if(format.state == "hide_format"){
//                    format.state = "show_format";
//                }else{
//                    format.state = "hide_format";
//                }
            }
        }
    }

    Column {
        //khung dinh dang van ban trong Text
        id: format
        width: Screen.width/20
        height: Screen.height/2.5
        spacing: Screen.height/90
        x: -textLb.x
        y: - textLb.y + Screen.height/20
       visible: false
//        state:"hide_format"
//        states: State {
//            name: "show_format";
//            PropertyChanges { target: format; x: -textLb.x; opacity: 1; scale:1;}
//        }
//        State {
//            name: "hide_format";
//            PropertyChanges { target: format; x: 0; opacity: 0; scale: 0; }
//        }
//        transitions: Transition {
//            from: "*"; to: "*";
//                NumberAnimation { properties: "x,opacity,scale"; duration: 500; easing.type: Easing.InOutQuad }
//        }
        Image {
            width: Screen.height/12
            height: width
            id:rotateClockwise
            source: "/files/images/rotClockwise.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    angl += 5;
                    if(angl > 180){
                        angl -= 360;
                    }
                }
                onPressAndHold: {
                    angl += 5;
                    if(angl > 180){
                        angl -= 360;
                    }
                }
            }
        }
        Image {
            width: Screen.height/12
            height: width
            id: rotateUnclockwise
            source: "/files/images/rotUnclockwise.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    angl -= 5
                    if(angl < -180){
                        angl += 360;
                    }
                }
                onPressAndHold: {
                    angl -= 5
                    if(angl < -180){
                        angl += 360;
                    }
                }
            }
        }

        Image {
            width: Screen.height/12
            height: width
            id: zoomIn
            source: "/files/images/zoomIn.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    fontSize++
                }
                onPressAndHold: {
                    fontSize++
                }
            }
        }
        Image {
            width: Screen.height/12
            height: width
            id: zoomOut
            source: "/files/images/zoomOut.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    fontSize--
                }
                onPressAndHold: {
                    fontSize--
                }
                drag.target: textLb
                drag.axis: Drag.XAndYAxis
            }
        }

        Image{
            width: Screen.height/12
            height: width
            id: addsoundsbutton
            source: "/files/images/not-nhac.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    currentPage = "Listen"
                }
            }
        }
        Row{
            Image{
                id: buiButton
                width: Screen.height/12
                height: width
                source: "/files/images/bui.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        buiRow.visible = !buiRow.visible;
                        colorPick.visible = false
                    }
                }
            }
            Row{
                id:buiRow
                visible: false
                enabled: visible
                Image{
                    width: Screen.height/12
                    height: width
                    id: boldButton
                    source: "/files/images/bold.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            isBold = !isBold;
                        }
                    }
                    Rectangle{
                        width:parent.width
                        height: width
                        color: "red"
                        visible: isBold
                        radius: 10
                        opacity: 0.3
                        z:-1
                    }
                }
                Image{
                    width: Screen.height/12
                    height: width
                    id: italicButton
                    source: "/files/images/italic.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            isItalic = !isItalic;
                        }
                    }
                    Rectangle{
                        width:parent.width
                        height: width
                        color: "red"
                        visible: isItalic
                        radius: 10
                        opacity: 0.3
                        z:-1
                    }
                }
                Image{
                    width: Screen.height/12
                    height: width
                    id: underlineButton
                    source: "/files/images/underline.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            isUnderline = !isUnderline;
                        }
                    }
                    Rectangle{
                        width:parent.width
                        height: width
                        color: "red"
                        visible: isUnderline
                        radius: 10
                        opacity: 0.3
                        z:-1
                    }
                }
            }
        }

        Rectangle{
            id: wrapperReg
            x : 0

        Image {
        //chon mau cho Text
            id: colorPickBut
            width: color1.width
            height: width
            y: 450
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


}


