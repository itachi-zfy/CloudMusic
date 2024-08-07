import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../../../basic"
Item{
    id:pendantRoot
    objectName: "Pendant"
    property bool isActived:false
    StackView.onActivated: isActived = true
    StackView.onDeactivated: isActived = false
    readonly property var types: ["推荐","世界名画","十二星座","MBTI","黑胶联名","网易游戏","学生专享","云村定制",
        "黑胶尊享","音乐热词","节日专属","趣味萌宠","影视","明星专属","城市"]
    Flow{
        id:selectorFlow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 30
        height: 80
        spacing: 10
        Repeater{
            id:selectorRep
            anchors.fill: parent
            model: pendantRoot.types
            property int selectedIndex : 0
            Rectangle{
                height: 40
                width: selectorLabel.implicitWidth + 30
                radius: 18
                border.width: 1
                color:selectorRep.selectedIndex === index ? "#24181c" : "transparent"
                border.color:selectorRep.selectedIndex === index ? "#331c1f" :  BasicConfig.fieldBgBordColor
                Label{
                    id: selectorLabel
                    text: modelData
                    font.pixelSize: 18
                    font.bold: true
                    font.family: BasicConfig.commFont
                    anchors.centerIn: parent
                    color:selectorRep.selectedIndex === index ? "#eb4d44" :  "white"
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
                        flick.contentY = index*flick.itemHeight + 32*(index-1)//32是title字体大小
                    }
                }
            }
        }
    }
    //具体头像
    Flickable{
        id:flick
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: selectorFlow.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 30
        clip: true
        property real itemHeight: flick.height/2
        contentHeight: (types.length + 1) * itemHeight + itemHeight
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
        //只渲染可视部分的gif
        onContentYChanged: {
            for(let i = 0;i<pendantRoot.types.length;i++){
                pendantRep.itemAt(i).globalY = Math.abs(pendantRep.itemAt(i).mapToItem(flick,0,0).y)
            }
        }
        Column{
            anchors.fill: parent
            spacing: 30
            Repeater{
                id:pendantRep
                model: pendantRoot.types
                anchors.fill: parent
                Item{
                    id:pendantItem
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: flick.itemHeight
                    property int globalY: 0
                    Label{
                        id:subTitleLabel
                        color:"white"
                        font.bold: true
                        text: modelData
                        font.pixelSize: 32
                        font.family: BasicConfig.commFont
                        anchors.left: parent.left
                        anchors.top: parent.top
                    }
                    GridLayout{
                        anchors.top:subTitleLabel.bottom
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        columns: 4
                        rows: 2
                        columnSpacing: 15
                        rowSpacing: 15
                        Repeater{
                            model: ["头像一","头像二","头像三","头像四"]
                            Rectangle{
                                id:vipInnerRect
                                clip: true
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                color: "transparent"
                                property bool hovered: false
                                //动效区域
                                Item{
                                    id:imgAreaItem
                                    anchors.top: parent.top
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 100
                                }
                                //文字区域
                                Item{
                                    id:textAreaItem
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.bottom: parent.bottom
                                    anchors.top: imgAreaItem.bottom
                                }
                                Item{
                                    anchors.fill: textAreaItem
                                    anchors.bottomMargin: textAreaItem.height/5
                                    Label{
                                        text: modelData
                                        color:"white"
                                        font.family: "黑体"
                                        font.pixelSize: 22
                                        font.bold: true
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 5
                                    }
                                }
                                Item{
                                    anchors.fill: textAreaItem
                                    anchors.topMargin: textAreaItem.height/2

                                    Image {
                                        id: subJpIcon
                                        source: "/Resources/skin/hj.png"
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                    }
                                    Label{
                                        text: "VIP专享"
                                        color:"#988c89"
                                        font.family: "黑体"
                                        font.pixelSize: 10
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: subJpIcon.right
                                        anchors.leftMargin: 5
                                    }
                                }
                                AnimatedImage {
                                    anchors.centerIn: imgAreaItem
                                    scale: window.height/933 * 0.3
                                    cache: false
                                    opacity: 0.99
                                    paused: !(globalY >=0 &&  globalY < flick.itemHeight*2) || !pendantRoot.isActived
                                    source: `/Resources/skin/gifs/giphy${index+1}.gif`
                                }
                                Item{
                                    anchors.centerIn: imgAreaItem
                                    anchors.margins: 30
                                    Column{
                                        spacing: 10
                                        anchors.centerIn: parent
                                        Rectangle{
                                            height: 40
                                            width: 120
                                            color: "transparent"
                                            radius: height/2
                                            border.width: 1
                                            visible: vipInnerRect.hovered
                                            border.color: BasicConfig.fieldBgBordColor
                                            Text {
                                                text: "预览"
                                                color:"white"
                                                font.pixelSize: 20
                                                font.bold: true
                                                font.family: BasicConfig.commFont
                                                anchors.centerIn: parent
                                            }
                                        }
                                        Rectangle{
                                            height: 40
                                            width: 120
                                            color: "transparent"
                                            border.width: 1
                                            radius: height/2
                                            border.color: BasicConfig.fieldBgBordColor
                                            visible: vipInnerRect.hovered
                                            Text {
                                                text: "立即使用"
                                                color:"white"
                                                font.pixelSize: 20
                                                font.bold: true
                                                font.family: BasicConfig.commFont
                                                anchors.centerIn: parent
                                            }
                                        }
                                    }
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        cursorShape = Qt.PointingHandCursor
                                        parent.hovered = true
                                    }
                                    onExited: {
                                        cursorShape = Qt.ArrowCursor
                                        parent.hovered = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
