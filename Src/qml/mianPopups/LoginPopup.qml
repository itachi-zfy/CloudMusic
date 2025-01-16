/***************************************************************

*  @ProjName:   %{CurrentProject:MyCloudMusic}
*  @FileName:   LoginPopup.qml
*  @Author:     zfy1362021@163.com
*  @Date:       2024-08-02
*  @Brief:      扫码登录界面
*
*---------------------------------------------------------------
*  ||擅长C++/Qt/Qml/Map/OpenGL/WebGis PC/Andriod端应用程序开发，
*  ||复杂仿真程序开发 (学习交流加群：492954738)
****************************************************************/
import QtQuick 2.15
import QtQuick.Controls 2.15
// import Qt5Compat.GraphicalEffects
import QtGraphicalEffects 1.15
import "../basic"
Popup{
    id:popRoot
    width: 466
    height: 638
    clip:true
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
            y:0
            scale: 0.2
            source: "/Resources/mianPopups/qrcode.jpg"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    showAnimation.showFlag = true
                    if(qrcode.scale === 0.2 ||  qrcode.scale === 0.3){//不中断动画
                        showAnimation.start()
                    }
                }
                onExited: {
                    showAnimation.showFlag = false
                    if(qrcode.scale === 0.2 ||  qrcode.scale === 0.3){//不中断动画
                        showAnimation.start()
                    }
                }
            }
        }
        Label{
            visible: qrcode.scale === 0.2 ||  qrcode.scale === 0.3
            anchors.top: qrcode.bottom
            anchors.topMargin:showAnimation.showFlag? -320:-290
            anchors.horizontalCenter: qrcode.horizontalCenter
            textFormat: Text.RichText
            text: "<span style=\"font-size: 20px;color: #75777f;font-family:'微软雅黑 Light';\">使用</span>
                    <a href=\"https://www.baidu.com\" style=\"text-decoration: none;\">
                        <span style=\"font-size: 20px;color: cornflowerblue;font-family:'微软雅黑 Light';cursor:pointer;\">周易云音乐APP</span>
                    </a>
                    <span style=\"font-size: 20px;color: #75777f;font-family:'微软雅黑 Light';\">扫码登录</span>"
            width: qrcode.scale === 0.2?200:300
            wrapMode: Text.WrapAnywhere
            horizontalAlignment: Text.AlignHCenter
            MouseArea{
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 40
                anchors.rightMargin: 80
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    // Qt.openUrlExternally("https://www.baidu.com")
                }
            }
        }

        Text{
            color: "#75777f"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "选择其他方式登录 >"
            font.pixelSize: 20
            font.family: BasicConfig.commFont
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
                    BasicConfig.openLoginByOtherMeansPopup()
                    BasicConfig.closeLoginPopup()
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
                from: showAnimation.showFlag?(popRoot.width-pic.implicitWidth)/2:10
                to:showAnimation.showFlag?10:(popRoot.width-pic.implicitWidth)/2
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
                from: showAnimation.showFlag?(popRoot.width-qrcode.implicitWidth)/2:-60
                to:showAnimation.showFlag?-60:(popRoot.width-qrcode.implicitWidth)/2
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: qrcode
                property: "y"
                duration: 500
                from: showAnimation.showFlag?(popRoot.height-qrcode.implicitHeight)/2:-130
                to:showAnimation.showFlag?-130:(popRoot.height-qrcode.implicitHeight)/2
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: qrcode
                property: "scale"
                duration: 500
                from:showAnimation.showFlag? 0.3:0.2
                to:showAnimation.showFlag?0.2:0.3
                easing.type: Easing.Linear
            }
        }
    }
}
