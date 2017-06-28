import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.0
Window {
    visible: true
    width: Screen.width
    height: Screen.height

    Image{
        id: backgroud
        source: "files/images/createbackground.png"
        anchors.fill: parent
    }

    ContentText{
        id: textLb
        text: "Input story content for this page"

    }
//    RotatedColorPicker{
//        id: rotatedCP
//    }


}
