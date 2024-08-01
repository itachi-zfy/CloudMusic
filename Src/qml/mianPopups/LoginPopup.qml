import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../basic"
Popup{
    id:popRoot
    width: 466
    height: 638
    closePolicy:Popup.NoAutoClose           //不允许自动关闭
    onOpened:showAnimation.start()
    background: Rectangle{
        anchors.fill: parent
        color:"#1b1b23"
        radius: 10
        border.width: 1
        border.color: "#75777f"
        //关闭按钮
        Image{
            scale: 2
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 30
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
                    popRoot.close()
                }
            }
        }
        //标题
        Label{
            id:loginText
            text: "扫码登录"
            color:"white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 100
            font.bold: true
            font.family: "黑体"
            font.pixelSize: 32
        }

        Image {
            id: pic
            x:30
            y:150
            scale: 0.8
            source: "/Resources/mianPopups/ele_001.png"
        }
        Image{
            id:qrcode
            x:50
            y:40
            scale: 0.25
            source: "/Resources/mianPopups/qrcode.jpg"
        }

        ParallelAnimation{
            id:showAnimation

            NumberAnimation {
                target: pic
                property: "x"
                duration: 500
                from: (popRoot.width-pic.implicitWidth)/2
                to:30
                // easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: pic
                property: "opacity"
                duration: 500
                from: 0
                to:1
                // easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: qrcode
                property: "x"
                duration: 500
                from: (popRoot.width-qrcode.implicitWidth)/2*qrcode.scale
                to:40
                // easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: qrcode
                property: "y"
                duration: 500
                from: (popRoot.width-qrcode.implicitHeight)/2*qrcode.scale
                to:30
                // easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: qrcode
                property: "scale"
                duration: 500
                from: 0.35
                to:0.25
                // easing.type: Easing.InOutQuad
            }
        }
    }
}
