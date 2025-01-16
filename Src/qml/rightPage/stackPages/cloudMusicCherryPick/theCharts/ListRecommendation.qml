import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"
Item{
    id:outerItem
    clip: true
    width: parent.width
    height: 300*((window.width-1317)/1242*0.48 + 1)
    Label{
        id:listRecomandationLabel
        text:"榜单推荐"
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
        anchors.top: listRecomandationLabel.bottom
        anchors.topMargin: 20
        spacing: 20
        Repeater{
            model:3
            Rectangle{
                width: 250
                height: width
                color:index===0?"#da5c6e":(index===1?"#8c9f73":"#b4a175")
                radius: 10
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            playImg.visible = true
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            playImg.visible = false
                            cursorShape = Qt.ArrowCursor
                        }
                    }
                    Label{
                        id:bigLabel
                        font.family: "黑体"
                        font.pixelSize: 40
                        font.bold: true
                        anchors.centerIn: parent
                        color:"white"
                        text:index===0?"VIP热歌榜":(index===1?"民谣榜":"国风榜")
                    }
                    Label{
                        font.family: "黑体"
                        font.pixelSize: 16
                        font.bold: true
                        color:"white"
                        text:index===0?"每天跟新":"每周五更新"
                        anchors.top: bigLabel.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Image{
                        id:playImg
                        source: "/Resources/cherryPick/officalSing/play.png"
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 20
                        anchors.rightMargin: 20
                        visible: false
                    }
                }

        }
    }
}
