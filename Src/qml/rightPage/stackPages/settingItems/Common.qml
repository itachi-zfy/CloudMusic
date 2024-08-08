import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"

Item {
    anchors.left: parent.left
    anchors.right: parent.right
    height: 400
    Label{
        id: counterTitleLabel
        text: "常规"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }
    Label{
        id: counterDiscriptionLabel
        font.pixelSize: 18
        font.family: BasicConfig.commFont
        anchors.verticalCenter: counterTitleLabel.verticalCenter
        anchors.left: counterTitleLabel.right
        anchors.leftMargin: 100
        color:"#e8e8e8"
        textFormat: Text.RichText
        text: "<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">字体选择</span>
               <span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(如果字体显示不清晰，请在控制面板-字体设置中启动系统Clear Type设置)</span>"
    }
    //字体选择框
    ComboBox{
        id:fontSelectorCbx
        width: 150
        height: 30
        anchors.left: counterDiscriptionLabel.left
        anchors.top: counterDiscriptionLabel.bottom
        anchors.topMargin: 20
        readonly property var fontFamilies:["默认","仿宋","华文中宋","华文仿宋","华文宋体","华文新魏","华文楷体","华文细黑","华文行书"
        ,"华文楷书","宋体","幼圆","微软雅黑","微软雅黑 Light","新宋体","方正姚体","方正舒体"]
        property string text: fontFamilies[0]
        property real indicatorRotation: 90
        model:fontFamilies
        background: Rectangle{
            anchors.fill: parent
            radius: 15
            border.width: 1
            border.color: "#28282e"
            color: "#1a1a20"
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
                    fontSelectorCbx.popup.open()
                }
            }
        }
        indicator: Label{
            text: ">"
            font.pixelSize: 22
            font.bold: true
            font.family: "黑体"
            anchors.right: parent.right
            color:"#e9e9e9"
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            rotation: fontSelectorCbx.indicatorRotation
        }
        contentItem: Text {
            text: fontSelectorCbx.text
            leftPadding: 10
            color: "white"
            font.pixelSize: 16
            font.family: BasicConfig.commFont
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        popup:Popup{
            x:0
            y:parent.height+5
            width: parent.width
            height:300
            onOpened:fontSelectorCbx.indicatorRotation = -90
            onClosed:fontSelectorCbx.indicatorRotation =  90
            background:Rectangle{
                anchors.fill: parent
                radius: 10
                color:"#2d2d37"
                clip:true
                ListView{
                    anchors.fill: parent
                    model: fontSelectorCbx.fontFamilies
                    ScrollBar.vertical: ScrollBar{//自定义ScrollView滚动条，不然访问不到
                        id:cusScrollBar
                        width: 10
                        policy:ScrollBar.AsNeeded
                        contentItem: Rectangle {
                            visible: parent.active
                            color: "#42424b"
                        }
                    }
                    delegate: Rectangle{
                        width: fontSelectorCbx.width-10
                        height: 40
                        color:"transparent"
                        Text {
                            color:"#d6d6d8"
                            text: modelData
                            leftPadding: 10
                            font.pixelSize: 16
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            font.family:  BasicConfig.commFont
                        }
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.color = "#393943"
                                cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                parent.color = "transparent"
                                cursorShape = Qt.ArrowCursor
                            }
                            onClicked: {
                                fontSelectorCbx.text = modelData
                                fontSelectorCbx.popup.close()
                            }
                        }
                    }
                }
            }
        }
    }

    //其他设置
    Column{
        id:commonOtherSettingsColumn
        anchors.left: fontSelectorCbx.left
        anchors.right: parent.right
        anchors.top: fontSelectorCbx.bottom
        anchors.topMargin: 40
        anchors.bottom: parent.bottom
        spacing: 30
        Repeater{
            anchors.fill: parent
            model: ["<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">开机自动运行</span>",
            "<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">将网易云音乐设置为默认播放器</span>",
            "<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">开启GPU加速</span><span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(若软件黑屏，请关闭GPU加速尝试解决)</span>",
            "<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">禁用动画效果</span><span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(减少部分资源占用)</span>",
            "<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">禁用系统缩放比例</span><span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(减少部分资源占用)</span><br><span>*高清屏适配，禁用后建议重启软件</span>"]
            Item{
                anchors.left: parent.left
                anchors.right: parent.right
                height: 25
                // clip: true
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
                        selectRect.selected = !selectRect.selected
                    }
                }
                Row{
                    anchors.left:parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 10
                    Rectangle{
                        id:selectRect
                        width: 20
                        height: width
                        radius: 2
                        border.width: 1
                        border.color: "#7a7a7f"
                        color: selected?"#eb4d44":"transparent"
                        property bool selected: false
                        Label{
                            id:selectedLabel
                            visible: parent.selected
                            color:"white"
                            font.bold: true
                            text: "√"
                            font.pixelSize: 18
                            font.family: BasicConfig.commFont
                            anchors.centerIn: parent
                        }
                    }
                    Label{
                        id:autoLoginLabel
                        color:"#818186"
                        font.bold: true
                        textFormat: Text.RichText
                        text: modelData
                        font.pixelSize: 18
                        font.family: BasicConfig.commFont
                        anchors.top: selectRect.top
                    }
                }
            }
        }
    }
    //分割线
    Rectangle{
        id:cutLine02
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: commonOtherSettingsColumn.bottom
        anchors.topMargin: 15
        anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)*2
        height: 1
        color: "#212127"
    }
}
