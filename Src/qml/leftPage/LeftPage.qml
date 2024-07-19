import QtQuick 2.15
import QtQuick.Controls 2.15
import "../basic"
Rectangle{
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
                font.bold: true
                text: "网易云音乐"
                font.pixelSize: 26
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

}
