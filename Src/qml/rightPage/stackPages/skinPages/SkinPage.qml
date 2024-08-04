import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../../basic"
Item{
    ScrollView{
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 50
        height: 1000
        ColorSelectPopup{
            id:colorSelector
        }
        //RowLayout 需要被填充才会显示（我也不知道为什么）
        Item{
            anchors.fill: skinRowLayout
        }
        RowLayout{
            id:skinRowLayout
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            width: parent.width
            height: window.height/4
            spacing: 20
            Repeater{
                id:skinRep
                model: 4
                Rectangle{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "transparent"
                    radius: 10
                    Rectangle{
                        id:innerRect
                        anchors.fill: parent
                        anchors.bottomMargin: 40
                        color: if(index === 0)"white"
                        else if(index === 1)"#eb4d44"
                        else if(index === 2)"#1a1a22"
                        else if(index === 3)"#b29ef1"
                        radius: 10
                        Image{
                            id:img
                            visible: index < 3
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: 10
                            anchors.bottomMargin:10
                            source: "/Resources/skin/wyy.png"
                            opacity: 0.5
                            layer.enabled:true
                            layer.effect:ColorOverlay{
                                source: img
                                color: if(index === 0)"#f7cfce"
                                       else if(index === 1)"#ef8f8c"
                                       else if(index === 2)"#36363d"
                                       else if(index === 3)"#36363d"
                            }
                        }
                    }
                    Item{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: innerRect.bottom
                        anchors.bottom:parent.bottom
                        Label{
                            text: if(index === 0)"默认"
                            else if(index === 1)"经典红"
                            else if(index === 2)"炫酷黑"
                            else if(index === 3)"按钮颜色自定义"
                            color:"white"
                            font.pixelSize: 14 * BasicConfig.wScale
                            font.family: BasicConfig.commFont
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                        }
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
                            if(index === 3){
                                colorSelector.show()
                                colorSelector.raise()
                            }
                        }
                    }
                }
            }
        }
    }
}
