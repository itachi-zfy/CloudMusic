import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../commonUI"
import "../../basic"
Item {
    Label{
        id:followLabel
        text: '本地音乐'
        font.pixelSize: 32
        font.bold: true
        font.family: '黑体'
        color:"white"
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: window.width * (36 * BasicConfig.wScale / 1317)
    }
    Label{
        id:numberLabel
        text: '共0首'
        font.pixelSize: 15
        font.bold: true
        font.family: "黑体"
        anchors.bottom:followLabel.bottom
        anchors.left: followLabel.right
        anchors.leftMargin: 1
        color: "#a1a1a3"
    }
    Row{
        id:buttonRow
        spacing: 10
        anchors.left:followLabel.left
        anchors.top:followLabel.bottom
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
        //刷新按钮
        Rectangle{
            height: 40
            width: refreshImg.implicitWidth + 20
            radius: 10
            color: "#1a1a20"
            Image {
                id: refreshImg
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: 'qrc:/Resources/local/refresh.png'
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
        id:optionsRect
        anchors.right: parent.right
        anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)
        color:"#212127"
        border.width: 1
        height: 40
        width: 300
        radius: height/2
        anchors.verticalCenter: buttonRow.verticalCenter
        RowLayout{
            id:optionsLayout
            anchors.fill: parent
            property int selectIndex: 0
            Repeater{
                model:["默认","歌手","专辑","文件夹"]
                Rectangle{
                    height: parent.height-4
                    radius: height/2
                    Layout.fillWidth: true
                    color: optionsLayout.selectIndex===index?"#2e2e34":"transparent"
                    Label{
                        id:optionLabel
                        text: modelData
                        color: optionsLayout.selectIndex===index?"white":"#7a7a7d"
                        font.pixelSize: 18
                        font.family: BasicConfig.commFont
                        anchors.centerIn:parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = Qt.PointingHandCursor

                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            optionsLayout.selectIndex = index
                        }
                    }
                }
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
        anchors.right: optionsRect.left
        anchors.rightMargin: 20
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
        anchors.top: optionsRect.bottom
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        source: "/Resources/like/empty.png"
    }
}
