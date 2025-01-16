import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../commonUI"
import "../../basic"
Item {
    Image {
        id: topImg
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: window.width * (36 * BasicConfig.wScale / 1317)
        source: "/Resources/like/likeImg.png"
    }
    Item {
        id: topItem
        anchors.left: topImg.right
        anchors.top: topImg.top
        anchors.bottom: topImg.bottom
        anchors.right: parent.right
        anchors.leftMargin: 20
        Label{
            id:followLabel
            text: '我喜欢的音乐'
            font.pixelSize: 32
            font.bold: true
            font.family: '黑体'
            color:"white"
            anchors.left:parent.left
            anchors.top:parent.top
        }
        Label{
            text: '2024-07-07创建'
            font.pixelSize: 20
            font.bold: true
            font.family: '黑体'
            color:BasicConfig.commGray
            anchors.left:followLabel.left
            anchors.top:followLabel.bottom
            anchors.topMargin: 20
        }
        Row{
            spacing: 10
            anchors.left: followLabel.left
            anchors.bottom:parent.bottom
            //播放全部按钮
            Rectangle{
                height: 40
                width: iconLeftImg.implicitWidth + textLabel.implicitWidth + 20
                radius: 10
                color: "#e84f50"
                opacity: 0.5
                Image {
                    id: iconLeftImg
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    source: 'qrc:/Resources/like/play.png'
                }
                Label{
                    id:textLabel
                    text: '播放全部'
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
                    onEntered: parent.opacity = 0.4
                    onExited:  parent.opacity = 0.5
                }
            }
            //下载按钮
            Rectangle{
                height: 40
                width: downloadImg.implicitWidth + downloadLabel.implicitWidth + 20
                radius: 10
                color: "#1a1a20"
                opacity: 0.9
                Image {
                    id: downloadImg
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    source: 'qrc:/Resources/like/download.png'
                }
                Label{
                    id:downloadLabel
                    text: '下载'
                    color: "white"
                    font.pixelSize: 20
                    font.family: BasicConfig.commFont
                    anchors.left: downloadImg.right
                    anchors.leftMargin: 3
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.opacity = 1
                    onExited:  parent.opacity = 0.9
                }
            }
            //更多按钮
            Rectangle{
                height: 40
                width: moreLabel.implicitWidth + 20
                radius: 10
                color: "#1a1a20"
                opacity: 0.9
                Label{
                    id:moreLabel
                    text: '···'
                    color: "white"
                    font.pixelSize: 20
                    font.family: BasicConfig.commFont
                    anchors.centerIn: parent
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.opacity = 1
                    onExited:  parent.opacity = 0.9
                }
            }
        }

    }
    Item{
        anchors.left: topImg.left
        anchors.right: parent.right
        anchors.top: topItem.bottom
        anchors.bottom: parent.bottom
        ZYYUnderLineIndicator{
            id:indicator
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 20
            height: 25
            spacing: 20
            options: ['歌曲','评论','收藏者']
            type:1
        }
        Rectangle{
            color:"#212127"
            border.width: 1
            height: 40
            width: searchImg.implicitWidth + searchLabel.implicitWidth + 20
            radius: height/2
            border.color: "#2e2e33"
            anchors.right: parent.right
            anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)
            anchors.verticalCenter: indicator.verticalCenter
            Image {
                id: searchImg
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: '/Resources/title/search.png'
            }
            Label{
                id:searchLabel
                text: '搜索'
                color: "white"
                font.pixelSize: 20
                font.family: BasicConfig.commFont
                anchors.left: searchImg.right
                anchors.leftMargin: 3
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Image{
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter
            source: "/Resources/like/empty.png"
        }
    }
}
