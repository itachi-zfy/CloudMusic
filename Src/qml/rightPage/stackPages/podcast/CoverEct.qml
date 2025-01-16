import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"
Column {
    id:coverEct
    spacing: 40
    Repeater{
        model: ["创作翻唱 >","电音 >","音乐推荐 >","亲子 >"]
        anchors.fill: parent
        Item{
            id:outerItem
            clip: true
            width: parent.width
            height: 340*((window.width-1317)/1242*0.48 + 1)
            property real outIndex: index
            Label{
                id:coverEctLabel
                text:modelData
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
                anchors.top: coverEctLabel.bottom
                anchors.topMargin: 20
                spacing: 20
                Repeater{
                    model:6
                    Rectangle{
                        width: 220*((window.width-1317)/1242*0.5 + 1)
                        height: 300*((window.width-1317)/1242*0.38 + 1)
                        Image{
                            anchors.fill: parent
                            source: `/Resources/podcast/cover/pic${outerItem.outIndex}_${index}.png`
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
                            Image{
                                id:playImg
                                source: "/Resources/cherryPick/officalSing/play.png"
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 80
                                anchors.rightMargin: 20
                                visible: false
                            }
                        }
                    }
                }
            }
        }

    }
}
