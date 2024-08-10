import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../../basic"
import "../../../commonUI"
ZYYWindow {
    id:popWindow
    width: 520
    height: 550
    bgColor: "#2d2d37"
    //关闭按钮
    Image{
        scale: 1.5
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 20
        anchors.rightMargin: 30
        source: "/Resources/title/close.png"
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
                popWindow.close()
            }
        }
    }
    //标题
    Label{
        id:loginText
        text: "按钮颜色自定义"
        color:"white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 60
        font.bold: true
        font.family: "黑体"
        font.pixelSize: 32
    }
    //常用预设颜色区
    GridLayout{
        id:preColorGrid
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:loginText.bottom
        anchors.leftMargin: 40
        anchors.rightMargin: 40
        anchors.topMargin: 30
        height: 140
        columns: 6
        rows: 2
        columnSpacing: 15
        rowSpacing: 15
        Repeater{
            model: ["black","#e46388","#e87f9b","#7a7df0","#638fe3","#6aaadf",
                "#64b474","#8bcc4c","#d1b23f","#ec9260","#ec9260","#e25d51"]
            Rectangle{
                Layout.fillWidth:true
                Layout.fillHeight: true
                color: modelData
                radius: 10
            }
        }
    }
    //标题
    Label{
        id:cusText
        text: "自定义颜色"
        color:"#ccccce"
        anchors.top:  preColorGrid.bottom
        anchors.left: preColorGrid.left
        anchors.topMargin: 40
        font.family: BasicConfig.commFont
        font.pixelSize: 20
    }
    //颜色拖动条
    Rectangle{
        id:cusColorImgRect
        width: 80
        height: 80
        color: "#b29ef1"
        radius: 10
        anchors.left: cusText.left
        anchors.top: cusText.bottom
        anchors.topMargin: 10
    }
    //渐变颜色条
    Item{
        id:slideA
        anchors.left: cusColorImgRect.right
        anchors.right: preColorGrid.right
        anchors.leftMargin: 20
        height: cusColorImgRect.height
        anchors.verticalCenter:cusColorImgRect.verticalCenter
        Slider{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 20
            height: parent.height/5

            contentItem: Rectangle{
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                radius:parent.height/2
                gradient: Gradient{
                    orientation:Gradient.Horizontal
                    GradientStop{
                        position: 0
                        color: "#e25128"
                    }
                    GradientStop{
                        position: 1/7
                        color: "#f9d548"
                    }
                    GradientStop{
                        position: 2/7
                        color: "#75fc4f"
                    }
                    GradientStop{
                        position: 3/7
                        color: "#71f3f3"
                    }
                    GradientStop{
                        position: 4/7
                        color: "#1408f2"
                    }
                    GradientStop{
                        position: 5/7
                        color: "#c52cd3"
                    }
                    GradientStop{
                        position: 6/7
                        color: "#ea3370"
                    }
                    GradientStop{
                        position: 1
                        color: "#e43324"
                    }
                }
            }
        }
        Slider{
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height/5
            from:0
            to:width
            anchors.top: slideA.bottom
            anchors.topMargin: -30
            contentItem: Rectangle{
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                radius:parent.height/2
                gradient: Gradient{
                    orientation:Gradient.Horizontal
                    GradientStop{
                        position: 0
                        color: "#e25128"
                    }
                    GradientStop{
                        position: 1
                        color: "#f9d548"
                    }
                }
            }

        }
    }
    //使用与取消
    Row{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        Rectangle{
            width: preColorGrid.width/2-10
            height: 50
            radius: width/2
            color: "transparent"
            border.width: 1
            border.color: "#65656c"
            Text {
                text: "取消"
                color:"white"
                anchors.centerIn:parent
                font.family: BasicConfig.commFont
                font.pixelSize: 20
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                    parent.color = BasicConfig.bordColor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                    parent.color = "transparent"
                }
                onClicked: {
                    popWindow.close()
                }
            }
        }
        Rectangle{
            width: preColorGrid.width/2-10
            height: 50
            radius: width/2
            color: "#653743"
            Text {
                text: "立即使用"
                color:"#6a5e65"
                anchors.centerIn:parent
                font.family: BasicConfig.commFont
                font.pixelSize: 20
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                    parent.color = BasicConfig.bordColor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                }
            }
        }
    }

}
