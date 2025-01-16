import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"
Item{
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: Math.max(leftImg.height,rightImg.height) + leftImg.implicitHeight*scaleOffset
    property real scaleOffset: (window.width-1317)/1242
    Image {
        id: leftImg
        anchors.left: parent.left
        anchors.top: parent.top
        scale: 1+scaleOffset
        anchors.topMargin: leftImg.implicitHeight*scaleOffset
        anchors.leftMargin: leftImg.implicitWidth/2*scaleOffset
        source: "/Resources/cherryPick/vip/topImg/pic0.png"
    }
    Image {
        id: rightImg
        anchors.left: leftImg.right
        anchors.top:leftImg.top
        anchors.leftMargin: 20 + leftImg.implicitWidth*scaleOffset
        scale: 1+scaleOffset
        source: "/Resources/cherryPick/vip/topImg/pic1.png"
    }

}
