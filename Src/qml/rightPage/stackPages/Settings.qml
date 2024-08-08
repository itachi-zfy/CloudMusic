import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../basic"
import "./settingItems"
Item{
    id:settingRoot
    objectName: "Settings"
    readonly property var types: ["账号","常规","系统","播放","消息与隐私","快捷键","音质与下载","桌面歌词","工具","关于周易云音乐"]

    Item{
        anchors.fill: parent
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: 24 * BasicConfig.wScale
        Label{
            id:setingMainTitle
            color:"white"
            font.bold: true
            text: "设置"
            font.pixelSize: 32
            font.family: BasicConfig.commFont
            anchors.left: parent.left
            anchors.top: parent.top
        }

        //标题中的选择器
        Flow{
            id:setingTitleFlow
            anchors.left: setingMainTitle.left
            anchors.top: setingMainTitle.bottom
            anchors.topMargin: 25
            height: 25
            spacing: 20
            Repeater{
                id:selectorRep
                anchors.fill: parent
                model: settingRoot.types
                property int selectedIndex : 0
                Item{
                    height: 40
                    width: selectorLabel.implicitWidth
                    Label{
                        id: selectorLabel
                        text: modelData
                        font.pixelSize: 20
                        font.bold: true
                        font.family: "黑体"
                        anchors.centerIn: parent
                        color:selectorRep.selectedIndex === index ? "white" :  "#a1a1a3"
                    }
                    Rectangle{
                        visible: selectorRep.selectedIndex === index
                        anchors.left: selectorLabel.left
                        anchors.right: selectorLabel.right
                        anchors.top: selectorLabel.bottom
                        anchors.leftMargin: selectorLabel.implicitWidth/selectorLabel.font.pixelSize * 2
                        anchors.rightMargin: selectorLabel.implicitWidth/selectorLabel.font.pixelSize * 2
                        anchors.topMargin: 3
                        height: 3
                        color:"#eb4d44"
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            if(selectorRep.selectedIndex === index){
                                selectorLabel.color = "white"
                            }else{
                                selectorLabel.color = "#b9b9ba"
                            }
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            if(selectorRep.selectedIndex === index){
                                selectorLabel.color = "white"
                            }else{
                                selectorLabel.color = "#a1a1a3"
                            }
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            selectorRep.selectedIndex = index
                            // flick.contentY = index*flick.itemHeight + 32*(index-1)//32是title字体大小
                        }
                    }
                }
            }
        }

        //分割线
        Rectangle{
            id:cutLine01
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: setingTitleFlow.bottom
            anchors.topMargin: 15
            anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)*2
            height: 1
            color: "#212127"
        }
        //内容部分
        Flickable{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: cutLine01.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 10
            contentHeight: 2000
            clip: true
            ScrollBar.vertical: ScrollBar{//自定义ScrollView滚动条，不然访问不到
                id:cusScrollBar
                anchors.right: parent.right
                anchors.rightMargin: 5
                width: 10
                policy:ScrollBar.AsNeeded
                contentItem: Rectangle {
                    visible: parent.active
                    implicitWidth: 10
                    implicitHeight: 10
                    radius: 4
                    color: "#42424b"
                }
            }
            Column{
                anchors.fill: parent
                anchors.topMargin: 30
                spacing: 30
                //账户
                Counter{}
                //常规
                Common{}
            }
        }
    }
}
