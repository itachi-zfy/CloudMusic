import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../../basic"
import "../../../commonUI"
Item {
    id:messageAndPrivacyRoot
    anchors.left: parent.left
    anchors.right: parent.right
    height: 300

    Label{
        id: meaprTitleLabel
        text: "消息与隐私"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        anchors.top: parent.top
        color:"white"
    }
    //单选框互斥组
    ExclusiveGroup{id:privateLettleExclusiveGroup}
    ExclusiveGroup{id:singRankExclusiveGroup}
    ExclusiveGroup{id:personalizationExclusiveGroup}
    //启动时候播放到平衡音量
    Column{
        id:col1
        anchors.left: meaprTitleLabel.right
        anchors.top: meaprTitleLabel.top
        anchors.right: messageAndPrivacyRoot.right
        anchors.leftMargin: 88
        height: 25
        spacing: 30
        //私信
        Item{
            id:privateLettleItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: 25
            Label{
                id:privateLettleLabel
                text: "私信"
                width:1
                height: parent.height
                font.pixelSize: 20
                font.bold: true
                font.family: "黑体"
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                color:"white"
            }
            Row{
                spacing: 40
                width: 100
                anchors.left: privateLettleLabel.right
                anchors.leftMargin: privateLettleLabel.implicitWidth + 40
                anchors.verticalCenter: privateLettleLabel.verticalCenter
                ZYYRadioButton{
                    checked: true
                    enabledState: false
                    contentText: "所有人"
                    exclusiveGroup: privateLettleExclusiveGroup
                }
                ZYYRadioButton{
                    enabledState: false
                    contentText: "我关注的人"
                    exclusiveGroup: privateLettleExclusiveGroup
                }
            }
        }
        //我的听歌排行榜
        Item{
            id:singRankItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: 25
            Label{
                id:singRankLabel
                text: "我的听歌排行榜"
                width:1
                height: parent.height
                font.pixelSize: 20
                font.bold: true
                font.family: "黑体"
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                color:"white"
            }
            Row{
                spacing: 40
                width: 100
                anchors.left: singRankLabel.right
                anchors.leftMargin: singRankLabel.implicitWidth + 40
                anchors.verticalCenter: singRankLabel.verticalCenter
                ZYYRadioButton{
                    checked: true
                    enabledState: false
                    contentText: "所有人可见"
                    exclusiveGroup: personalizationExclusiveGroup
                }
                ZYYRadioButton{
                    enabledState: false
                    contentText: "我关注的人可见"
                    exclusiveGroup: personalizationExclusiveGroup
                }
                ZYYRadioButton{
                    enabledState: false
                    contentText: "仅自己可见"
                    exclusiveGroup: personalizationExclusiveGroup
                }
            }
        }
        //个性化服务
        Item{
            id:personalizationItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: 25
            Label{
                id:personalizationLabel
                text: "个性化服务"
                width:1
                height: parent.height
                font.pixelSize: 20
                font.bold: true
                font.family: "黑体"
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                color:"white"
            }
            Row{
                spacing: 40
                width: 100
                anchors.left: personalizationLabel.right
                anchors.leftMargin: personalizationLabel.implicitWidth + 40
                anchors.verticalCenter: personalizationLabel.verticalCenter
                ZYYRadioButton{
                    checked: true
                    enabledState: false
                    contentText: "开启"
                    exclusiveGroup: personalizationExclusiveGroup
                }
                ZYYRadioButton{
                    enabledState: false
                    contentText: "关闭(关闭后，即不会使用你的个性化信息提供个性化服务)"
                    exclusiveGroup: personalizationExclusiveGroup
                }
            }
        }
        //通知
        Item{
            id:noticeItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: 25
            Label{
                id:noticeLabel
                text: "通知"
                width:1
                height: parent.height
                font.pixelSize: 20
                font.bold: true
                font.family: "黑体"
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                color:"white"
            }
            Flow{
                spacing: 40
                anchors.right: parent.right
                anchors.left: noticeLabel.right
                anchors.leftMargin: noticeLabel.implicitWidth + 40
                anchors.verticalCenter: noticeLabel.verticalCenter
                ZYYCheckBox{
                    text: "歌单被收藏"
                    checked: true
                    enabledState: false
                }
                ZYYCheckBox{
                    text: "收到赞"
                    checked: true
                    enabledState: false
                }
                ZYYCheckBox{
                    text: "新粉丝"
                    checked: true
                    enabledState: false
                }
                ZYYCheckBox{
                    text: "每日推荐"
                    checked: true
                }
            }
        }
        //黑名单设置
        Item{
            id:blackListItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: 25
            Label{
                id:blackListLabel
                text: "通知"
                width:1
                height: parent.height
                font.pixelSize: 20
                font.bold: true
                font.family: "黑体"
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
                color:"white"
            }
            Row{
                spacing: 40
                width: 100
                anchors.left: blackListLabel.right
                anchors.leftMargin: blackListLabel.implicitWidth + 40
                anchors.verticalCenter: blackListLabel.verticalCenter
                Label{
                    color:"#ddd"
                    font.bold: true
                    text: "我的黑名单"
                    font.pixelSize: 18
                    height: 25
                    font.family: BasicConfig.commFont
                    verticalAlignment: Text.AlignVCenter
                }
                Rectangle{
                    height: 30
                    width: 60
                    radius: 20
                    opacity: 0.5
                    color:"transparent"
                    border.width: 1
                    border.color: BasicConfig.fieldBgBordColor
                    anchors.verticalCenter: parent.verticalCenter
                    Label{
                        color:"#ddd"
                        font.bold: true
                        text: "查看"
                        font.pixelSize: 18
                        font.family: BasicConfig.commFont
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = Qt.ForbiddenCursor
                            parent.opacity = 0.7
                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                            parent.opacity = 0.5
                        }
                    }
                }
            }
        }
    }

    //分割线
    ZYYSpliteLine{}
}
