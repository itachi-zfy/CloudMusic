import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
Item{
    anchors.left: parent.left
    anchors.right: parent.right
    height: 100
    Label{
        id: counterTitleLabel
        text: "账号"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }
    Label{
        id: counterDiscriptionLabel
        text: "登录周易云音乐，手机电脑多端同步，320k高音质无线下载"
        font.pixelSize: 18
        font.family: BasicConfig.commFont
        anchors.verticalCenter: counterTitleLabel.verticalCenter
        anchors.left: counterTitleLabel.right
        anchors.leftMargin: 150
        color:"#e8e8e8"
    }
    Rectangle{
        width: 100
        height: 30
        radius: 15
        anchors.left: counterDiscriptionLabel.left
        anchors.top: counterDiscriptionLabel.bottom
        anchors.topMargin: 20
        color:"#e84d5f"
        Label{
            text: "立即登录"
            font.pixelSize: 18
            font.family: BasicConfig.commFont
            anchors.centerIn: parent
            color:"white"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.opacity = 0.8
                cursorShape = Qt.PointingHandCursor
            }
            onExited: {
                parent.opacity = 1
                cursorShape = Qt.ArrowCursor
            }
        }
    }
}
