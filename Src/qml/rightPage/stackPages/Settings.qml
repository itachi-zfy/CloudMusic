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
            readonly property var moduleHeights: [100,400,200,600,300,800,830,800,180,400]  //各个子模块的高度

            Repeater{
                id:selectorRep
                anchors.fill: parent
                model: settingRoot.types
                property int selectedIndex : 0
                Item{
                    height: 40
                    width: selectorLabel.implicitWidth
                    function setLabelColor(color){selectorLabel.color = color}
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
                            for(let i = 0;i<selectorRep.count;i++)selectorRep.itemAt(i).setLabelColor("#a1a1a3")
                            selectorRep.selectedIndex = index
                            parent.setLabelColor("white")
                            let slideTo = 0
                            for(let i = 0;i<index;i++)slideTo += setingTitleFlow.moduleHeights[i]
                            flick.contentY = slideTo
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
            anchors.topMargin: 20
            anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)*2
            height: 1
            color: "#212127"
        }
        //内容部分
        Flickable{
            id:flick
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: cutLine01.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 10
            contentHeight: 4800
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
            onContentYChanged: {
                let modulePos = contentHeight-400
                for(let i = setingTitleFlow.moduleHeights.length-1;i>0;i--){
                    modulePos -= setingTitleFlow.moduleHeights[i]
                    if( contentY > modulePos){
                        selectorRep.selectedIndex = i
                        break
                    }
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
                //系统
                SystemCfg{}
                //播放
                Play{}
                //消息与隐私
                MessageAndPrivacy{}
                //自定义快捷键
                CustomShotCut{}
                //音质与下载
                ToneQualityAndDownload{}
                //桌面歌词
                DesktopLyrics{}
                //工具
                Tools{}
                //关于周易云音乐
                AboutZYY{}
            }
        }
    }

}
