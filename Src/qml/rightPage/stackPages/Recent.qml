import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../commonUI"
import "../../basic"

Item {

    ZYYUnderLineIndicator{
        id:indeicator
        height: 25
        spacing: 20
        options: ['单曲','播客','有声书',"歌单","专辑"]
        type:2
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: window.width * (36 * BasicConfig.wScale / 1317)
    }
    Row{
        id:buttonRow
        spacing: 10
        anchors.right:parent.right
        anchors.verticalCenter: indeicator.verticalCenter
        anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)
        //播放全部按钮
        Rectangle{
            height: 40
            width: iconLeftImg.implicitWidth + textLabel.implicitWidth + 20
            radius: 10
            color: "#e84f50"
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
                onEntered: parent.opacity = 0.8
                onExited:  parent.opacity = 1
            }
        }
        //收藏全部按钮
        Rectangle{
            height: 40
            width: downloadImg.implicitWidth + downloadLabel.implicitWidth + 20
            radius: 10
            color: "#1a1a20"
            Image {
                id: downloadImg
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: 'qrc:/Resources/recent/collect.png'
            }
            Label{
                id:downloadLabel
                text: '收藏全部'
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
                onEntered: parent.opacity = 0.8
                onExited:  parent.opacity = 1
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
                onEntered: parent.opacity = 0.8
                onExited:  parent.opacity = 1
            }
        }
    }
    ListView{
        anchors.left: indeicator.left
        anchors.right: buttonRow.right
        anchors.top: indeicator.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 30
        header: Item{
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50
            Label{
                id:orderIndexLabel
                text: '#'
                color: "#a1a1a3"
                font.pixelSize: 20
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
            }
            Label{
                id:titleLabel
                text: '标题'
                color: "#a1a1a3"
                font.pixelSize: 20
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: orderIndexLabel.right
                anchors.leftMargin: 40
            }
            Label{
                id:albumLabel
                text: '专辑'
                color: "#a1a1a3"
                font.pixelSize: 20
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: titleLabel.right
                anchors.leftMargin: 400
            }
            Label{
                id:likeLabel
                text: '喜欢'
                color: "#a1a1a3"
                font.pixelSize: 20
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: albumLabel.right
                anchors.leftMargin: 200
            }
            Label{
                id:timeLabel
                text: '播放时间'
                color: "#a1a1a3"
                font.pixelSize: 20
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 30
            }
            ZYYSpliteLine{
                anchors.bottom: parent.bottom
            }
        }
    }

}
