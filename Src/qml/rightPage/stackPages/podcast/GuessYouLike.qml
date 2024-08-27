import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"

Item{

    Label{
        id:guessYouLikeLabel
        text:"猜你喜欢"
        font.pixelSize: 24
        font.family: "黑体"
        font.bold: true
        color: "white"
        anchors.left: parent.left
        anchors.top: parent.top
    }
    Flow{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: guessYouLikeLabel.bottom
        anchors.topMargin: 20
        spacing: 20
        Repeater{
            model:12
            Rectangle{
                width: 220*((window.width-1317)/1242*0.5 + 1)
                height: 300*((window.width-1317)/1242*0.38 + 1)
                Image{
                    anchors.fill: parent
                    source: `/Resources/podcast/guessYouLike/pic${index}.png`
                }
            }
        }
    }
}
