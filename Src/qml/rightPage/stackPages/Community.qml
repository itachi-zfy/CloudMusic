import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../commonUI"
import "../../basic"
Item {

    Label{
        id:followLabel
        text: '关注'
        font.pixelSize: 32
        font.bold: true
        font.family: '黑体'
        color:"white"
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: window.width * (36 * BasicConfig.wScale / 1317)
    }
    //发布按钮
    Rectangle{
        id:btnRoot
        height: 40
        width: 100
        radius: 10
        color: "#e84f50"
        anchors.verticalCenter: followLabel.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)
        Image {
            id: iconLeftImg
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            source: '/Resources/community/publish.png'
        }
        Label{
            id:textLabel
            text: '发布'
            color: "white"
            font.pixelSize: 20
            font.family: BasicConfig.commFont
            anchors.left: iconLeftImg.right
            anchors.leftMargin: 3
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.opacity = 0.8
            onExited:  parent.opacity = 1
        }
    }
    //空空如也
    Image{
        anchors.centerIn: parent
        source: '/Resources/community/pic.png'
    }
}
