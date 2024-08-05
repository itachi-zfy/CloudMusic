import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../basic"
Item{
    objectName: "SkinPage"
    //个性皮肤、头像挂件
    Row{
        id:skinTitleRow
        anchors.top:parent.top
        anchors.topMargin: 20 * BasicConfig.hScale
        anchors.left: parent.left
        anchors.leftMargin: 36 * BasicConfig.wScale
        spacing: 20 * BasicConfig.wScale
        Repeater{
            id:skinTitleRep
            model: 2
            property int selectedIndex: 0
            Item{
                width: 90 * BasicConfig.wScale
                height: 40 * BasicConfig.hScale
                Label{
                    id:loginText
                    text: index?"头像挂件":"个性皮肤"
                    color:index === skinTitleRep.selectedIndex?"white":"#9c9ea3"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: index === skinTitleRep.selectedIndex
                    font.family: "黑体"
                    font.pixelSize: 28
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = ((index === skinTitleRep.selectedIndex)? Qt.ArrowCursor:Qt.PointingHandCursor)
                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            skinTitleRep.selectedIndex = index
                        }
                    }
                }
                Rectangle{
                    height: 4
                    width: loginText.font.pixelSize
                    color: "#e84e58"
                    visible: index === skinTitleRep.selectedIndex
                    anchors.top: loginText.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: loginText.horizontalCenter
                }
            }
        }
    }
    //官方、会员按钮
    Row{
        id:officalRow
        anchors.top:skinTitleRow.bottom
        anchors.topMargin: 18 * BasicConfig.hScale
        anchors.left: skinTitleRow.left
        spacing: 10 * BasicConfig.wScale
        Repeater{
            id:officalRep
            model: 2
            property int selectedIndex: 0
            Rectangle{
                width: 80
                height: 40
                radius: 20
                border.width: 1
                border.color:index === officalRep.selectedIndex ? "#331c1f":BasicConfig.fieldBgBordColor
                color: index === officalRep.selectedIndex ?"#24181c":"transparent"
                Label{
                    text: index?"会员":"官方"
                    color:index === officalRep.selectedIndex ? "#eb4d44":"#e8e8e8"
                    font.family: "黑体"
                    font.pixelSize: 20
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
                        officalRep.selectedIndex = index
                    }
                }
            }
        }
    }
    //VIP自定义换肤按键
    Rectangle{
        id:customChangeSkinBtn
        anchors.verticalCenter: officalRow.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 40
        width: 150
        height: 40
        radius: 8
        color:"#212127"
        border.width: 1
        border.color:"#28282e"
        Image {
            id: jpIcon
            source: "/Resources/skin/hj.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
        }
        Label{
            text: "VIP"
            color:"#988c89"
            font.family: "黑体"
            font.pixelSize: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: jpIcon.right
            anchors.leftMargin: 5
        }
        Label{
            text: "自定义换肤"
            color:"white"
            font.family: BasicConfig.commFont
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
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
        }
    }
    //皮肤页面子栈
    StackView{
        clip: true
        anchors.left: officalRow.left
        anchors.right: parent.right
        anchors.top: officalRow.bottom
        anchors.topMargin: 20
        anchors.bottom: parent.bottom
        initialItem: "/Src/qml/rightPage/stackPages/skinPages/SkinPage.qml"
    }
}
