import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "./../basic"
import "./../commonUI"

Row{
    id:othersRow
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        BasicConfig.openLoginPopup()
                    }
                }
            }
            Text{
                id:loadStateText
                text: "未登录"
                color:"#75777f"
                font.pixelSize: 14 * BasicConfig.wScale
                font.family: BasicConfig.commFont
                anchors.verticalCenter: userIconRect.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onExited: {
                        parent.color = "#75777f"
                    }
                    onEntered: {
                        parent.color = "white"
                    }
                    onClicked: {
                        BasicConfig.openLoginPopup()
                    }
                }
            }
            ZYYVipIconItem{
                id:vipItem
                height: userIconRect.height
                width: loadStateText.implicitWidth * 1.2
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    //登录下拉
    Image{
        id:loginImg
        anchors.verticalCenter: parent.verticalCenter
        source: "/Resources/title/arrow.png"
        rotation: -90
        layer.enabled: false
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
                BasicConfig.openLoginPopup()
            }
        }
    }

    //消息中心
    Image{
        id:messageImg
        anchors.verticalCenter: parent.verticalCenter
        source: "/Resources/title/message.png"
        layer.enabled: false
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
        layer.enabled: false
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
                titleRoot.typeClicked(1)
            }
        }
    }
    //换肤
    Image{
        id:skinImg
        anchors.verticalCenter: parent.verticalCenter
        source: "/Resources/title/skin.png"
        layer.enabled: false
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
                titleRoot.typeClicked(0)
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
