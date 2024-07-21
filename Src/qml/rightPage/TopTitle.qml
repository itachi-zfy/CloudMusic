import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../basic"
Item {
    //搜索 searchRow
    Row{
        id:searchRow
        spacing: 8 * BasicConfig.wScale
        anchors.left: parent.left
        anchors.leftMargin: 36 * BasicConfig.wScale
        anchors.verticalCenter: parent.verticalCenter
        //页面回退到上一步 backForwardItem
        Item{
            id:backForwardItem
            width: 24 * BasicConfig.wScale
            height: 35 * BasicConfig.hScale
            Rectangle{
                id:backForwardRect
                radius: 4 * BasicConfig.wScale
                color: "transparent"
                border.color: BasicConfig.bordColor
                border.width: 1
                anchors.fill: parent
                property bool effectEnabled: false
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onExited: {
                        backForwardRect.color = "transparent"
                        backForwardRect.effectEnabled = false
                    }
                    onEntered: {
                        backForwardRect.color = BasicConfig.leftBgColor
                        backForwardRect.effectEnabled = true
                    }
                    onClicked:{
                        console.log("页面返回上一级")
                    }
                }
            }
            Image{
                id:backForwardIcon
                scale: BasicConfig.wScale
                anchors.centerIn: backForwardRect
                source: "/Resources/title/arrow.png"
                layer.enabled: true
                layer.effect: ColorOverlay{
                    enabled: backForwardRect.effectEnabled
                    source: backForwardIcon
                    color: "white"

                }
            }
        }
        //搜索框 searchTextField
        TextField{
            id:searchTextField
            z:window.z + 1
            height: backForwardItem.height
            width: 250 * BasicConfig.wScale
            leftPadding:40 * BasicConfig.wScale
            color:"white"
            placeholderText:"晴天"
            font.pixelSize: 16 * BasicConfig.wScale
            font.family: BasicConfig.commFont
            placeholderTextColor:BasicConfig.commGray
            background: Item{
                anchors.fill: parent
                //边框渐变
                Rectangle{
                    id:searchBoxBordLine
                    anchors.fill: parent
                    radius:8
                    property real gradientStopPos: 1                //渐变终点位置
                    gradient:Gradient{
                        orientation:Gradient.Horizontal             //.pro文件中要加上QT += qml,否则没有这个属性
                        GradientStop{color: "#21283d";position:0}
                        GradientStop{color: "#382635";position:searchBoxBordLine.gradientStopPos}
                    }
                }

                //框体渐变
                Rectangle{
                    id:searchBox
                    anchors.fill: parent
                    anchors.margins: 1
                    radius:8
                    property real gradientStopPos: 1                //渐变终点位置
                    gradient:Gradient{
                        orientation:Gradient.Horizontal             //.pro文件中要加上QT += qml,否则没有这个属性
                        GradientStop{color: "#1a1d29";position:0}
                        GradientStop{color: "#241c26";position:searchBox.gradientStopPos}
                    }
                    Image{
                        id:searchIcon
                        scale:0.7
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 16 * BasicConfig.wScale * scale
                        source: "/Resources/title/search.png"
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        searchBox.gradientStopPos = 0
                        mouse.accepted = false
                    }
                    onFocusChanged: {
                        if(!focus)searchBox.gradientStopPos = 1
                    }
                }
            }
            //TODO 弹出一个Popup
        }
        //听歌识曲
        Item{
            id:soundHoundItem
            height: searchTextField.height
            width: height
            Rectangle{
                id:soundHoundRect
                radius: 8 * BasicConfig.wScale
                color: "#241c26"
                border.color: "#36262f"
                border.width: 1
                anchors.fill: parent
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onExited: {
                        soundHoundRect.color = "#241c26"
                    }
                    onEntered: {
                        soundHoundRect.color = "#312231"
                    }
                    onClicked:{
                        console.log("听歌识曲")
                    }
                }
            }
            Image{
                id:soundHoundIcon
                anchors.centerIn: soundHoundItem
                source: "/Resources/title/record.png"

            }
        }
    }

    Row{
        id:othersRow
        spacing: 10
        anchors.verticalCenter: searchRow.verticalCenter
        anchors.left: searchRow.right
        anchors.leftMargin: 100
        //登录与会员
        Item{
            id:userItem
            Row{
                anchors.verticalCenter: parent.verticalCenter
                Rectangle{
                    id:userIconRect
                    width: 30 * BasicConfig.wScale
                    height: width
                    radius: width/2
                    color: BasicConfig.commGray
                    Image{
                        scale: 0.7
                        source: "/Resources/title/user.png"
                        anchors.centerIn:parent
                    }
                }
            }
        }
    }
}
