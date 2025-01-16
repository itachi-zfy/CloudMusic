import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../commonUI"
import "../../basic"

Item {
    ZYYUnderLineIndicator{
        id:indeicator
        height: 25
        spacing: 20
        options: ['已下载单曲','已下载声音','已下载MV',"正在下载"]
        type:3
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: window.width * (36 * BasicConfig.wScale / 1317)
    }
    Row{
        id:buttonRow
        spacing: 10
        anchors.left: indeicator.left
        anchors.top:indeicator.bottom
        anchors.topMargin: 50
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

    Rectangle{
        color:"#212127"
        border.width: 1
        height: 40
        width: searchImg.implicitWidth + searchLabel.implicitWidth + 20
        radius: height/2
        border.color: "#2e2e33"
        anchors.right: parent.right
        anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.verticalCenter: buttonRow.verticalCenter
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
        anchors.top: buttonRow.bottom
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        source: "/Resources/like/empty.png"
    }

}
