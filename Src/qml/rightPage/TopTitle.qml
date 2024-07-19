import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../basic"
Item {
    Row{
        spacing: 8 * BasicConfig.wScale
        anchors.left: parent.left
        anchors.leftMargin: 36 * BasicConfig.wScale
        anchors.verticalCenter: parent.verticalCenter
        //页面回退到上一步
        Item{
            id:backForwardItem
            width: 36 * BasicConfig.wScale
            height: 42 * BasicConfig.hScale
            Rectangle{
                id:backForwardRect
                radius: 4 * BasicConfig.wScale
                color: "transparent"
                border.color: BasicConfig.bordColor
                border.width: 1
                anchors.fill: parent
                property bool effectEnabled: false
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onExited: {
                        backForwardRect.color = "transparent"
                        backForwardRect.effectEnabled = false
                    }
                    onEntered: {
                        backForwardRect.color = BasicConfig.leftBgColor
                        backForwardRect.effectEnabled = true
                    }
                    onClicked:{
                        console.log("页面返回上一级")
                    }
                }
            }
            Image{
                scale: BasicConfig.wScale
                anchors.centerIn: backForwardRect
                source: "/Resources/title/arrow.png"
                layer.enabled: true
                layer.effect: ColorOverlay{
                    enabled: backForwardRect.effectEnabled
                    source: parent
                    color: "white"
                }
            }
        }
        //搜索框
        TextField{
            id:searchTextField
            height: backForwardItem.height
            width: 320 * BasicConfig.wScale
            background: Item{
                anchors.fill: parent
                //边框渐变
                Rectangle{
                    id:searchBoxBordLine
                    anchors.fill: parent
                    gradient:Gradient{
                        orientation:Gradient.Horizontal             //.pro文件中要加上QT += qml,否则没有这个属性
                        GradientStop{color: "#1a1d29";position:0}
                        GradientStop{color: "#382635";position:1}
                    }
                }
                Rectangle{
                    id:searchBox
                    anchors.fill: parent
                    anchors.margins: 1
                    gradient:Gradient{
                        orientation:Gradient.Horizontal             //.pro文件中要加上QT += qml,否则没有这个属性
                        GradientStop{color: "#1a1d29";position:0}
                        GradientStop{color: "#382635";position:1}
                    }
                    Image{
                        id:searchIcon
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 24 * BasicConfig.wScale
                        source: "/Resources/title/search.png"
                    }
                }
            }
        }
    }
}
