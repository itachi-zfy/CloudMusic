import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../../basic"
import "../../../commonUI"

Item {
    id:toolsCutRoot
    anchors.left: parent.left
    anchors.right: parent.right
    height: 180
    Label{
        id: toolLabel
        text: "工具"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }
    //http代理
    ExclusiveGroup{id:group}
    Row{
        id:row1
        anchors.left: toolLabel.left
        anchors.right: parent.right
        anchors.top: toolLabel.top
        anchors.leftMargin: 150
        spacing: 25
        Label{
            id: fontLabel
            text: "http代理"
            font.pixelSize: 20
            font.bold: true
            font.family: "黑体"
            anchors.top: parent.top
            color:"#DDD"
            height: 25
        }
        Repeater{
            model: ["不适用代理","使用IE代理设置","自定义代理"]
            ZYYRadioButton{
                contentText: modelData
                checked: !index
            }
        }
        Repeater{
            model: ["测试","确定"]
            Rectangle{
                width: 80
                height: 30
                border.width: 1
                border.color: "#28282e"
                color: "#1a1a20"
                opacity: index?0.8:1
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
                        parent.opacity = 0.8
                        cursorShape = index?Qt.PointingHandCursor:Qt.ForbiddenCursor
                    }
                    onExited: {
                        parent.opacity = 1
                        cursorShape = Qt.ArrowCursor
                    }
                }
            }
        }
    }
    //音乐云盘设置
    Item{
        anchors.left: row1.left
        anchors.right: row1.right
        anchors.top: row1.bottom
        anchors.bottom: parent.bottom
        Label{
            id: cloudDiskSetting
            text: "音乐云盘设置"
            font.pixelSize: 20
            font.bold: true
            font.family: "黑体"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 30
            color:"#DDD"
            height: 25
        }
        ZYYCheckBox{
            anchors.left: cloudDiskSetting.left
            anchors.right: parent.right
            anchors.top:cloudDiskSetting.bottom
            anchors.topMargin: 10
            checked: true
            text: "本地音乐添加到歌单后，将文件上传至云盘，可多端同步歌单，播放下载"
        }
    }
    //分割线
    ZYYSpliteLine{}
}
