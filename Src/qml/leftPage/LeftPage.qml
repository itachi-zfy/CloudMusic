import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../basic"
Rectangle{
    color:BasicConfig.leftBgColor
    width: parent.width * BasicConfig.leftWScale
    Item{
        width: 255
        height: 80
        anchors.left: parent.left
        anchors.top: parent.top
        Row{
            spacing: 10
            anchors.centerIn: parent
            Image{
                source: "/Resources/title/logo.png"
            }
            Label{
                color:"white"
                text: "网易云音乐"
                font.bold: true
                font.pixelSize: 26
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

}
