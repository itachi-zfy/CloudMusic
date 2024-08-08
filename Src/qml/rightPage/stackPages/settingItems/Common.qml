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
    ComboBox{
        width: 100
        height: 30
        anchors.left: counterDiscriptionLabel.left
        anchors.top: counterDiscriptionLabel.bottom
        anchors.topMargin: 20
        readonly property var fontFamilies:["默认","仿宋","华文中宋","华文仿宋","华文宋体","华文新魏","华文楷体","华文细黑","华文行书"
        ,"华文楷书","宋体","幼圆","微软雅黑","微软雅黑 Light","新宋体","方正姚体","方正舒体"]
        model:fontFamilies
        background: Rectangle{
            anchors.fill: parent
            radius: 15
            border.width: 1
            border.color: "#28282e"
            color: "#1a1a20"
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
            rotation: 90
        }
    }
}
