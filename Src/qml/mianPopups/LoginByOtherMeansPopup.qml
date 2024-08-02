import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../basic"
Popup{
    id:popRoot
    width: 466
    height: 638
    clip: true
    closePolicy:Popup.NoAutoClose                               //不允许自动关闭
    background: Rectangle{
        anchors.fill: parent
        color:"#1b1b23"
        radius: 10
        border.width: 1
        border.color: "#75777f"
        Image{
            id:topBgImg
            scale: 0.2
            anchors.left: parent.left
            anchors.top: parent.top
            fillMode: Image.PreserveAspectCrop
            anchors.leftMargin: -320
            anchors.topMargin: -330
            source: "/Resources/mianPopups/qrcode.jpg"
        }
        //绘制一个蒙版遮挡部分二维码
        Canvas {
            id: canvas
            anchors.fill: parent
            onPaint: {
                var ctx = canvas.getContext("2d");
                ctx.beginPath();
                ctx.moveTo(100, 1);
                ctx.lineTo(parent.width-1, 1);
                ctx.lineTo(parent.width-1, 180);
                ctx.lineTo(1,180);
                ctx.lineTo(1,100);
                ctx.moveTo(100, 1);
                ctx.fillStyle = "#1b1b23";
                ctx.fill();
            }
        }
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
        Row{
            spacing: 10
            anchors.topMargin: 100
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            Image{
                source: "/Resources/title/logo.png"
            }
            Label{
                color:"white"
                font.bold: true
                text: "周易云音乐"
                font.pixelSize: 32
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
            }
        }

    }

}
