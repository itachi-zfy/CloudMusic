import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import Qt5Compat.GraphicalEffects

import "./../basic"
import "./../commonUI"
Rectangle{
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 100
    color:"#2d2d37"
    property string musicName: '记忆中神圣的你（神圣）'
    property string singerName: 'Takuau'
    signal openMusicPage()
    Image{
        id:smallRecordImg
        source: "qrc:/Resources/playMusic/smallRecord.png"
        anchors.left:parent.left
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        MouseArea{
            anchors.fill: parent
            onClicked:openMusicPage()
        }
    }
    Item {
        id: nameItem
        anchors.top: smallRecordImg.top
        anchors.bottom: smallRecordImg.bottom
        anchors.left: smallRecordImg.right

        //音乐名称
        Label{
            id:musicNameLabel
            text: musicName
            color: "white"
            font.pixelSize: 20
            font.family: '黑体'
            anchors.left: parent.left
            anchors.leftMargin: 3
            anchors.top: parent.top
            anchors.topMargin: 10
        }
        //歌手名称
        Label{
            id:singerNameLabel
            text: `-${singerName}`
            color: "white"
            font.pixelSize: 20
            font.family: '黑体'
            anchors.left: musicNameLabel.right
            anchors.verticalCenter: musicNameLabel.verticalCenter
        }
        //收藏、评论、转发、下载
        Row{
            spacing: 20
            anchors.bottom: parent.bottom
            anchors.left: musicNameLabel.left
            anchors.bottomMargin: 10
            Repeater{
                model:[
                    "/Resources/recent/collect.png",
                    "/Resources/playMusic/comment.png",
                    "/Resources/playMusic/fenxiang.png",
                    "/Resources/recent/download.png"
                ]
                Item {
                    width: ccsdImg.implicitWidth
                    height: ccsdImg.implicitHeight
                    Image{
                        id: ccsdImg
                        source: modelData
                    }
                    Rectangle{
                        clip: true
                        color:"#2d2d37"
                        visible: index===1
                        anchors.top: ccsdImg.top
                        anchors.right: ccsdImg.right
                        anchors.rightMargin: -10
                        width: playNumberLabel.implicitWidth
                        height: playNumberLabel.implicitHeight
                        Label{
                            id:playNumberLabel
                            text: "999+"
                            color: "white"
                            font.pixelSize: 10
                            font.family: '黑体'
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }

    //中间部分
    Item{
        id:middlePartItem
        anchors.centerIn: parent
        width: progressSlider.width
        height: parent.height
        Row{
            spacing: 20
            anchors.bottomMargin: 20
            anchors.bottom: progressSlider.top
            anchors.horizontalCenter: progressSlider.horizontalCenter
            Repeater{
                model:[
                    '/Resources/playMusic/like.png',
                    "/Resources/playMusic/pre.png",
                    "/Resources/like/play.png",
                    "/Resources/playMusic/next.png",
                    "/Resources/playMusic/recycle.png"
                ]
                Item {
                    width: playImg.implicitWidth
                    height: playImg.implicitHeight
                    Rectangle{
                        visible: index===2
                        anchors.centerIn: playImg
                        width: playImg.implicitWidth + 20
                        height: width
                        radius: height/2
                        color: "#e84f50"
                    }
                    Image {
                        id: playImg
                        source: modelData
                    }
                }
            }
        }
        //自定义进度条
        ZZYPlaySlider{
            id:progressSlider
            width: 400
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
        }
    }

    //右边部分
    Row{
        spacing: 20
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        Rectangle{
            height: 20
            width: 50
            color: "transparent"
            border.width: 1
            border.color: "#ababaf"
            radius: 3
            Label{
                text: '极高'
                color: "white"
                font.pixelSize: 15
                font.family: '黑体'
                anchors.centerIn: parent
            }
        }
        Label{
            id:currentTimeLabel
            text: '词'
            color: "white"
            font.pixelSize: 20
            font.family: '幼圆'
        }
        Repeater{
            model:[
                "qrc:/Resources/playMusic/whale.png",
                "qrc:/Resources/playMusic/together.png",
                "qrc:/Resources/playMusic/volumn.png",
                "qrc:/Resources/playMusic/playList.png"
            ]
            Image{
                source: modelData
            }
        }
    }
}
