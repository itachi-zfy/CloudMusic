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
            width: 240 * BasicConfig.wScale
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

    //用户与基础设置
    Row{
        id:othersRow
        spacing: 5 * BasicConfig.wScale
        anchors.verticalCenter: searchRow.verticalCenter
        anchors.left: searchRow.right
        anchors.leftMargin: 60 * BasicConfig.wScale
        //登录与会员
        Item{
            id:userItem
            width: 140 * BasicConfig.wScale
            height: 30 * BasicConfig.wScale
            anchors.verticalCenter: parent.verticalCenter
            Row{
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8 * BasicConfig.wScale
                Rectangle{
                    id:userIconRect
                    width: 25 * BasicConfig.wScale
                    height: width
                    radius: width/2
                    color: BasicConfig.commGray
                    Image{
                        scale: 0.7
                        source: "/Resources/title/user.png"
                        anchors.centerIn:parent
                    }
                }
                Text{
                    id:loadStateText
                    text: "未登录"
                    color:"white"
                    font.pixelSize: 14 * BasicConfig.wScale
                    font.family: BasicConfig.commFont
                    anchors.verticalCenter: userIconRect.verticalCenter
                }
                Item{
                    id:vipItem
                    height: userIconRect.height
                    width: loadStateText.implicitWidth * 1.2
                    anchors.verticalCenter: parent.verticalCenter
                    Rectangle{
                        id:vipRect
                        radius: 8 * BasicConfig.wScale
                        width: parent.width - vipRect.radius
                        height:14 * BasicConfig.wScale
                        color: "#dadada"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        Label{
                            text: "VIP开通"
                            anchors.left: parent.left
                            anchors.leftMargin: parent.radius + 4
                            color:"#f8f9f9"
                            font.pixelSize: parent.height/2
                            font.family: BasicConfig.commFont
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    //背景色边框矩形
                    Rectangle{
                        id:bgBordRect
                        width: vipRect.height + 4
                        height: width
                        radius: width/2
                        color: BasicConfig.mainBgColor
                        anchors.verticalCenter: parent.verticalCenter
                        Rectangle{
                            id:r1
                            anchors.fill: parent
                            anchors.margins: 1
                            radius: width/2
                            color: "#dadada"
                            anchors.centerIn: parent
                            Rectangle{
                                id:r2
                                anchors.fill: parent
                                anchors.margins: 4 * BasicConfig.wScale
                                radius: width/2
                                color: "#cecece"
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }
        }
        //登录下拉
        Image{
            id:loginImg
            anchors.verticalCenter: parent.verticalCenter
            source: "/Resources/title/arrow.png"
            rotation: -90
            layer.enabled: true
            layer.effect: ColorOverlay{
                source: loginImg
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    parent.layer.enabled = false
                }
                onEntered: {
                    parent.layer.enabled = true
                }
                onClicked: {

                }
            }
        }

        //消息中心
        Image{
            id:messageImg
            anchors.verticalCenter: parent.verticalCenter
            source: "/Resources/title/message.png"
            layer.enabled: true
            scale: 0.7
            layer.effect: ColorOverlay{
                source: messageImg
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    parent.layer.enabled = false
                }
                onEntered: {
                    parent.layer.enabled = true
                }
                onClicked: {

                }
            }
        }
        //设置
        Image{
            id:settingImg
            anchors.verticalCenter: parent.verticalCenter
            source: "/Resources/title/setting.png"
            layer.enabled: true
            scale: 0.7
            layer.effect: ColorOverlay{
                source: settingImg
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    parent.layer.enabled = false
                }
                onEntered: {
                    parent.layer.enabled = true
                }
                onClicked: {

                }
            }
        }
        //换肤
        Image{
            id:skinImg
            anchors.verticalCenter: parent.verticalCenter
            source: "/Resources/title/skin.png"
            layer.enabled: true
            scale: 0.7
            layer.effect: ColorOverlay{
                source: skinImg
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    parent.layer.enabled = false
                }
                onEntered: {
                    parent.layer.enabled = true
                }
                onClicked: {

                }
            }
        }
        Rectangle{
            height: 24 * BasicConfig.hScale
            width: 1
            color:BasicConfig.commGray
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    //最小化
    Row{
        id:miniRow
        spacing: 15 * BasicConfig.wScale
        anchors.verticalCenter: othersRow.verticalCenter
        anchors.left: othersRow.right
        anchors.leftMargin: 5 * BasicConfig.wScale
        //MINI
        Image{
            id:miniImg
            anchors.verticalCenter: parent.verticalCenter
            source: "/Resources/title/mini.png"
            layer.enabled: false
            property bool effectEnabled : false
            layer.effect: ColorOverlay{
                source: miniImg
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    parent.layer.enabled = false
                }
                onEntered: {
                    parent.layer.enabled = true
                }
                onClicked: {

                }
            }
        }
        //最小化
        Rectangle{
            height: 2
            width: 20
            color:BasicConfig.commGray
            anchors.verticalCenter: parent.verticalCenter
        }
        //最大化
        Rectangle{
            width: 20
            height: width
            radius: 2
            color:BasicConfig.commGray
            anchors.verticalCenter: parent.verticalCenter
        }
        //关闭
        Label{
            text: "X"
            font.pixelSize: 20
            color:BasicConfig.commGray
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
