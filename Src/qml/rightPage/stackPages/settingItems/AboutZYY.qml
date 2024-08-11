import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../../basic"
import "../../../commonUI"

Item {
    id:aboutRoot
    anchors.left: parent.left
    anchors.right: parent.right
    height: 400
    Label{
        id: aboutLabel
        text: "关于周易云音乐"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }
    ExclusiveGroup{id:group}
    Column{
        anchors.left: aboutLabel.left
        anchors.right: parent.right
        anchors.top: aboutLabel.bottom
        anchors.leftMargin: 150
        spacing: 30
        //当前版本
        Row{
            spacing: 20
            Label{
                text: "(当前版本3.0.1)(64位)(Build:123456)Patch:123456"
                font.pixelSize: 20
                color:"#DDD"
                font.family: BasicConfig.commFont
                height: 25
                width: implicitWidth
            }
            Repeater{
                model: ["检查更新","意见反馈","版本记录"]
                Rectangle{
                    width: 120
                    height: 30
                    border.width: 1
                    border.color: "#28282e"
                    color: "#1a1a20"
                    radius: 15
                    Label{
                        text: modelData
                        font.pixelSize: 20
                        anchors.centerIn:parent
                        color:"#DDD"
                        font.family: BasicConfig.commFont
                        height: 25
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = BasicConfig.commGray
                            cursorShape = index?Qt.PointingHandCursor:Qt.ForbiddenCursor
                        }
                        onExited: {
                            parent.color = "transparent"
                            cursorShape = Qt.ArrowCursor
                        }
                    }
                }
            }
        }
        //自动更新
        Row{
            spacing: 40
            Repeater{
                model: ["自动更新","有版本时提醒我"]
                ZYYRadioButton{
                    contentText: modelData
                    checked: !index
                }
            }
        }
        //下载客户端
        Row{
            spacing: 30
            Label{
                id: delegateLabel
                text: "下载移动客户端"
                font.pixelSize: 20
                font.bold: true
                font.family: "黑体"
                verticalAlignment: Text.AlignVCenter
                color:"#DDD"
                height: 25
                width:implicitWidth
            }

            Repeater{
                model: ListModel{
                    ListElement{icon:"/Resources/setting/iphone.png";txt:"iPhone版"}
                    ListElement{icon:"/Resources/setting/iphone.png";txt:"iPad版"}
                    ListElement{icon:"/Resources/setting/andriod.png";txt:"Andriod版"}
                    ListElement{icon:"/Resources/setting/windows.png";txt:"WP版"}
                }
                Rectangle{
                    id:sureBtn
                    height: 40
                    width: 140
                    anchors.topMargin: 50
                    radius:height/2
                    gradient: Gradient{
                        orientation: Gradient.Horizontal
                        GradientStop{
                            color: "#e93b63"
                            position: 0
                        }
                        GradientStop{
                            color: "#e84f50"
                            position: 1
                        }
                    }
                    Item{
                        anchors.centerIn: parent
                        width: iconImg.implicitWidth + imgLabel.implicitWidth
                        height: 25
                        Image {
                            id: iconImg
                            source: icon
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                        }
                        Label{
                            id:imgLabel
                            color:"white"
                            text: txt
                            font.pixelSize: 20
                            font.bold: true
                            font.family: BasicConfig.commFont
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            sureBtn.opacity = 0.8
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            sureBtn.opacity = 1
                            cursorShape = Qt.ArrowCursor
                        }
                    }

                }
            }
        }
        Row{
            spacing: 30
            Repeater{
                model: ["《周易云音乐官网》","《周易云音乐社区管理细则》","《服务条款》","《隐私政策》","《儿童隐私政策》"]
                Label{
                    color:"white"
                    text: modelData
                    font.pixelSize: 16
                    font.bold: true
                    font.family: BasicConfig.commFont
                    font.underline: true
                    anchors.verticalCenter: parent.verticalCenter
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                        }
                    }
                }
            }
        }
    }
}
