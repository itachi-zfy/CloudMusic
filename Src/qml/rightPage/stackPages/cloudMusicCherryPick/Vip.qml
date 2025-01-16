import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"
import "./vip"

Flickable{
    id:flick
    contentHeight: 1700
    clip: true
    objectName: "Vip"
    ScrollBar.vertical: ScrollBar{//自定义ScrollView滚动条，不然访问不到
        id:cusScrollBar
        anchors.right: parent.right
        anchors.rightMargin: 5
        width: 10
        policy:ScrollBar.AsNeeded
        contentItem: Rectangle {
            visible: parent.active
            implicitWidth: 10
            implicitHeight: 10
            radius: 4
            color: "#42424b"
        }
    }
    TopImg{
        anchors.left: parent.left
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
    }
}
