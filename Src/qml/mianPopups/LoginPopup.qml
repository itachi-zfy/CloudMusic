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
            y:30
            scale: 0.25
            source: "/Resources/mianPopups/qrcode.jpg"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    showAnimation.showFlag = true
                    showAnimation.start()
                }
                onExited: {
                    showAnimation.showFlag = false
                    showAnimation.start()
                }
            }
        }
        Label{
            visible: qrcode.scale === 0.25 ||  qrcode.scale === 0.35
            anchors.top: qrcode.bottom
            anchors.topMargin:showAnimation.showFlag? -210:-190
            anchors.horizontalCenter: qrcode.horizontalCenter
            textFormat: Text.RichText
            text: "<span style=\"font-size: 20px;color: #75777f;font-family:'微软雅黑 Light';\">使用</span>
                    <a href=\"https://www.baidu.com\" style=\"text-decoration: none;\">
                        <span style=\"font-size: 20px;color: cornflowerblue;font-family:'微软雅黑 Light';cursor:pointer;\">网易云音乐APP</span>
                    </a>
                    <span style=\"font-size: 20px;color: #75777f;font-family:'微软雅黑 Light';\">扫码登录</span>"
            width: showAnimation.showFlag?200:300
            wrapMode: Text.WrapAnywhere
            horizontalAlignment: Text.AlignHCenter
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    // Qt.openUrlExternally("https://www.baidu.com")
                }
            }
        }


        ParallelAnimation{
            id:showAnimation
            property bool showFlag: true
            NumberAnimation {
                target: pic
                property: "x"
                duration: 500
                from: showAnimation.showFlag?(popRoot.width-pic.implicitWidth)/2:30
                to:showAnimation.showFlag?30:(popRoot.width-pic.implicitWidth)/2
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: pic
                property: "opacity"
                duration: 500
                from: !showAnimation.showFlag
                to:showAnimation.showFlag
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: qrcode
                property: "x"
                duration: 500
                from: showAnimation.showFlag?(popRoot.width-qrcode.implicitWidth*1.8)/2*qrcode.scale:40
                to:showAnimation.showFlag?40:(popRoot.width-qrcode.implicitWidth*1.8)/2*qrcode.scale
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: qrcode
                property: "y"
                duration: 500
                from: showAnimation.showFlag?(popRoot.height-qrcode.implicitHeight):30
                to:showAnimation.showFlag?-30:(popRoot.height-qrcode.implicitHeight)/5
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: qrcode
                property: "scale"
                duration: 500
                from:showAnimation.showFlag? 0.35:0.25
                to:showAnimation.showFlag?0.25:0.35
                easing.type: Easing.Linear
            }
        }
    }
}
