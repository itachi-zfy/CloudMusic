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
        //帮助使得textField控件失去焦点
        MouseArea{
            anchors.fill: parent
            onClicked: {
                telNumberTextField.focus = false
                pwdTextField.focus = false
            }
        }
        Image{
            id:topBgImg
            scale: 0.2
            anchors.left: parent.left
            anchors.top: parent.top
            fillMode: Image.PreserveAspectCrop
            anchors.leftMargin: -320
            anchors.topMargin: -330
            source: "/Resources/mianPopups/qrcode.jpg"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    window.openLoginPopup()
                    window.closeLoginByOtherMeansPopup()
                }
            }
        }
        //绘制一个蒙版遮挡部分二维码
        Canvas {
            id: canvas
            anchors.fill: parent
            onPaint: {
                var ctx = canvas.getContext("2d");
                ctx.beginPath();
                ctx.moveTo(100, 1);
                ctx.lineTo(parent.width-10, 1);
                ctx.lineTo(parent.width-10, 180);
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
        //标题
        Row{
            id:titleRowItems
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

        //登录
        Column{
            id:loginColumnItems
            spacing: 20
            anchors.top: titleRowItems.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            TextField{
                id:telNumberTextField
                width: 400
                height: 50
                font.pixelSize: 20
                color: BasicConfig.fieldTextColor
                font.family: BasicConfig.commFont
                placeholderTextColor: BasicConfig.defaultFontNormalColor
                placeholderText: "请输入手机号"
                leftPadding: 100
                verticalAlignment: Text.AlignVCenter
                background: Rectangle{
                    anchors.fill: parent
                    radius: telNumberTextField.height/2
                    color: BasicConfig.fieldBgColor
                    border.width: 1
                    border.color: telNumberTextField.focus?BasicConfig.fieldBgColor:BasicConfig.fieldBgBordColor
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: mouse.accepted =false
                        onEntered:{
                            parent.border.color = BasicConfig.fieldBgColor
                            if(mouseX > telNumberTextField.leftPadding && telNumberTextField.text !== ""){
                                clearTelImg.visible = true
                            }
                        }
                        onExited:{
                            parent.border.color = telNumberTextField.focus?BasicConfig.fieldBgColor:BasicConfig.fieldBgBordColor
                        }
                    }
                    //国家手机号表示
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        width: telNumberTextField.leftPadding
                        Row{
                            anchors.centerIn: parent
                            spacing: 10
                            Text {
                                id: countryTelNumText
                                text: "+86"
                                color: "white"
                                font.bold: true
                                font.pixelSize: 20
                                font.family: BasicConfig.commFont
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Label{
                                id:arrowLabel
                                text: ">"
                                color: "white"
                                rotation: 90
                                font.bold: true
                                font.pixelSize: 20
                                font.family: BasicConfig.commFont
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        MouseArea{
                            anchors.fill:parent
                            hoverEnabled: true
                            onEntered: {
                                cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                cursorShape = Qt.ArrowCursor
                            }
                            onClicked: {

                            }
                        }
                    }
                    //清空输入框按钮
                    Image{
                        id:clearTelImg
                        visible: telNumberTextField.text !== ""
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        source: "/Resources/mianPopups/clear.png"
                        layer.enabled: false
                        layer.effect: ColorOverlay{
                            source: clearTelImg
                            color: "#bebec0"
                        }
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                clearTelImg.layer.enabled = true
                                cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                clearTelImg.layer.enabled = false
                                cursorShape = Qt.ArrowCursor
                            }
                            onClicked: {
                                telNumberTextField.text = ""
                            }
                        }
                    }

                }
            }
            TextField{
                id:pwdTextField
                width: 400
                height: 50
                font.pixelSize: 20
                color: BasicConfig.fieldTextColor
                font.family: BasicConfig.commFont
                placeholderTextColor: BasicConfig.defaultFontNormalColor
                placeholderText: "请输入密码"
                verticalAlignment: Text.AlignVCenter
                echoMode: TextInput.Password
                background: Rectangle{
                    anchors.fill: parent
                    radius: pwdTextField.height/2
                    color: BasicConfig.fieldBgColor
                    border.width: 1
                    border.color: pwdTextField.focus?BasicConfig.fieldBgColor:BasicConfig.fieldBgBordColor
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: mouse.accepted = false
                        onEntered: parent.border.color = BasicConfig.fieldBgColor
                        onExited: parent.border.color = pwdTextField.focus?BasicConfig.fieldBgColor:BasicConfig.fieldBgBordColor
                    }
                    //可见与不可见
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        width: clearPwdImg.visible?70:40
                        Row{
                            anchors.centerIn: parent
                            spacing: 0
                            //清空输入框按钮
                            Image{
                                id:clearPwdImg
                                visible: pwdTextField.text !== ""
                                anchors.verticalCenter: parent.verticalCenter
                                source: "/Resources/mianPopups/clear.png"
                                layer.enabled: false
                                layer.effect: ColorOverlay{
                                    source: clearPwdImg
                                    color: "#bebec0"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        clearPwdImg.layer.enabled = true
                                        cursorShape = Qt.PointingHandCursor
                                    }
                                    onExited: {
                                        clearPwdImg.layer.enabled = false
                                        cursorShape = Qt.ArrowCursor
                                    }
                                    onClicked: {
                                        pwdTextField.text = ""
                                    }
                                }
                            }
                            Image{
                                id:seeEnabledImg
                                source: seeEnabled?"/Resources/mianPopups/see.png":"/Resources/mianPopups/nosee.png"
                                anchors.verticalCenter: parent.verticalCenter
                                property bool seeEnabled: false
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
                                        seeEnabledImg.seeEnabled = !seeEnabledImg.seeEnabled
                                        pwdTextField.echoMode = seeEnabledImg.seeEnabled?TextInput.Normal:TextInput.Password
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
