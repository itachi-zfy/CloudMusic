import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../../basic"
import "../../../commonUI"
Item {
    anchors.left: parent.left
    anchors.right: parent.right
    height: 600
    Label{
        id: playTitleLabel
        text: "播放"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }

    //启动时候播放到平衡音量
    Column{
        id:col1
        anchors.top : playTitleLabel.top
        anchors.left: playTitleLabel.right
        anchors.right: parent.right
        anchors.leftMargin: 150
        spacing:30
        ZYYCheckBox{
            width: 1
            height: 25
            text: "程序启动时自动播放"
        }
        ZYYCheckBox{
            textFormat: Text.RichText
            text: "<span style=\"font-size: 20px;color: #ddd;font-family:'微软雅黑 Light';\">首次进入播客时自动播放</span><span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(不播歌时)</span>"
        }
        ZYYCheckBox{
            checked: true
            text: "程序启动时记住上一次播放进度"
        }
        ZYYCheckBox{
            checked: true
            text: "开启音乐淡入淡出"
        }
        ZYYCheckBox{
            text: "平衡不同音频之间的音量大小"
        }
    }
    //输出设备
    Column{
        id:col2
        anchors.left: col1.left
        anchors.right: parent.right
        anchors.top: col1.bottom
        anchors.topMargin: 30
        spacing: 10
        Label{
            id: outputDeviceLabel
            text: "输出设备"
            font.pixelSize: 20
            font.bold: true
            font.family: "黑体"
            anchors.left: parent.left
            color:"white"
        }
        ZYYComboBox{
            width: 300
            height: 40
            text: "DirectSound:主声音驱动程序"
            model: ["DirectSound:主声音驱动程序",
                    "DirectSound:扬声器(Realtek(R)Audio)",
                    "其他"]
        }
    }
    ExclusiveGroup{id:exclusiveGroup}
    //播放列表
    Column{
        id:col3
        anchors.left: col2.left
        anchors.right: parent.right
        anchors.top: col2.bottom
        anchors.topMargin: 30
        spacing: 10
        Label{
            id: playListLabel
            text: "播放列表"
            font.pixelSize: 20
            font.bold: true
            font.family: "黑体"
            anchors.left: parent.left
            color:"white"
        }
        ZYYRadioButton{
            checked: true
            exclusiveGroup: exclusiveGroup
            contentText: "双击播放单曲时，用当前单曲所在的歌曲列表替换播放列表"
        }
        ZYYRadioButton{
            checked: false
            exclusiveGroup: exclusiveGroup
            contentText: "双击播放单曲时，仅把当前单曲添加到播放列表中"
        }
    }
    //最近播放记录
    Column{
        id:col4
        anchors.left: col3.left
        anchors.right: parent.right
        anchors.top: col3.bottom
        anchors.topMargin: 30
        spacing: 10
        Label{
            id: recentLabel
            text: "最近播放记录"
            font.pixelSize: 20
            font.bold: true
            font.family: "黑体"
            anchors.left: parent.left
            color:"white"
        }
        ZYYCheckBox{
            text: "开启后，同步当前账号所在设备名称的最近播放记录"
        }
    }
    //分割线
    ZYYSpliteLine{}
}
