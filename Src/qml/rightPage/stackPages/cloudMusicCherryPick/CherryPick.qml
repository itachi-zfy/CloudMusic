import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"
import "./cherryPick"
Flickable{
    id:flick
    contentHeight: 2800
    clip: true
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
    Column{
        anchors.fill: parent
        anchors.topMargin: 30
        spacing: 30
        //轮播图
        CarouselImage{}

        //官方歌单
        Item{
            anchors.left: parent.left
            anchors.right: parent.right
            height: 300
            Label{
                id:titleLabel
                text:"官方歌单>"
                font.bold: true
                color: "white"
                font.family: "黑体"
                font.pixelSize: 24
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: -20
                anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
            }
            Item{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: titleLabel.bottom
                anchors.topMargin: 10
                Image {
                    id:leftIniImg
                    visible: false
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "/Resources/cherryPick/leftArrow.png"
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            leftIniImg.visible = true
                            rigtIniImg.visible = true
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            leftIniImg.visible = false
                            rigtIniImg.visible = false
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                        }
                    }
                }
                Image {
                    id:rigtIniImg
                    mirror: true
                    visible: false
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: "/Resources/cherryPick/leftArrow.png"
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            leftIniImg.visible = true
                            rigtIniImg.visible = true
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            leftIniImg.visible = false
                            rigtIniImg.visible = false
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                        }
                    }
                }
                Rectangle{
                    anchors.left: leftIniImg.right
                    anchors.right: rigtIniImg.left

                    height: 250
                }
            }
        }
    }
}

