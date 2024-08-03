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
                anchors.left:parent.left
                anchors.top: parent.top
                width: 200
                height: 200
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                }
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
        //登录选项
        Column{
            id:loginColumnItems
            spacing: 20
            anchors.top: titleRowItems.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            //账号输入框
            TextField{
                id:telNumberTextField
                width: 400
                height: 40
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
                        id:countryTelTextItem
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
                                telDatasPop.open()
                            }
                        }
                    }
                    //国家手机号开头
                    Popup{
                        id:telDatasPop
                        parent: countryTelTextItem
                        y:countryTelTextItem.height+5
                        width: telNumberTextField.width
                        height: 370
                        background: Rectangle{
                            anchors.fill: parent
                            radius: 10
                            color:"#2d2d37"
                            clip: true
                            ListView{
                                id:listview
                                anchors.fill: parent
                                anchors.topMargin: 15
                                model: nationFlagsModel
                                ScrollBar.vertical: ScrollBar {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 3
                                    height: listview.contentHeight
                                    width: 10
                                    policy:ScrollBar.AsNeeded
                                    contentItem: Rectangle {
                                        visible: parent.active
                                        implicitWidth: 10
                                        implicitHeight: 10
                                        radius: 4
                                        color: "#42424b"
                                    }
                                }
                                delegate: Rectangle{
                                    height: 50
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.rightMargin: 12
                                    color:"transparent"
                                    Image {
                                        id: nationFlagImg
                                        source: src
                                        anchors.leftMargin: 20
                                        anchors.left: parent.left
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: nationFlagRange.implicitWidth
                                        height: nationFlagRange.implicitHeight
                                    }
                                    Text {
                                        text: country
                                        color:"#b7b7ba"
                                        font.bold: true
                                        font.pixelSize: 20
                                        font.family: BasicConfig.commFont
                                        anchors.left: nationFlagImg.right
                                        anchors.leftMargin: 8
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                    Text {
                                        text: tel
                                        color:"#b7b7ba"
                                        font.bold: true
                                        font.pixelSize: 20
                                        font.family: BasicConfig.commFont
                                        anchors.right: parent.right
                                        anchors.rightMargin: 50
                                        anchors.verticalCenter: parent.verticalCenter
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
                                            countryTelNumText.text = tel
                                            telDatasPop.close()
                                        }
                                    }
                                }
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
            //密码输入框
            TextField{
                id:pwdTextField
                width: 400
                height: 40
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
            //登录选项
            Item{
                id:loginItems
                height: 25
                anchors.left: pwdTextField.left
                anchors.right: pwdTextField.right
                //自动登录
                Item{
                    width: 100
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
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
                            autoLoginRect.selected = !autoLoginRect.selected
                        }
                    }
                    Row{
                        anchors.left:parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10
                        Rectangle{
                            id:autoLoginRect
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
                            text: "自动登录"
                            font.pixelSize: 18
                            font.family: BasicConfig.commFont
                            anchors.verticalCenter: autoLoginRect.verticalCenter
                        }
                    }
                }
                //忘记密码与验证码登录
                Row{
                    width: 210
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 10
                    Label{
                        id:forgetPwdLabel
                        color:"#818186"
                        text: "忘记密码"
                        font.pixelSize: 20
                        font.family: BasicConfig.commFont
                        anchors.verticalCenter: parent.verticalCenter
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                cursorShape = Qt.ArrowCursor
                            }
                        }
                    }
                    Rectangle{
                        width: 1
                        height: 20
                        color:"#818186"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Label{
                        id:checkCodeLoginLabel
                        color:"#818186"
                        text: "验证码登录"
                        font.pixelSize: 20
                        font.family: BasicConfig.commFont
                        anchors.verticalCenter: parent.verticalCenter
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                cursorShape = Qt.ArrowCursor
                            }
                        }
                    }
                }
            }
        }
        //登录按键
        Rectangle{
            id:loginBtn
            height: 50
            width: 400
            anchors.top: loginColumnItems.bottom
            anchors.topMargin: 30
            radius:height/2
            anchors.horizontalCenter:loginColumnItems.horizontalCenter
            gradient: Gradient{
                orientation: Gradient.Horizontal
                GradientStop{
                    color: "#e93b63"
                    position: 0
                }
                GradientStop{
                    color: "#e84f50"
                    position: 1
                }
            }
            Label{
                color:"white"
                text: "登录"
                font.pixelSize: 24
                font.family: BasicConfig.commFont
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    loginBtn.opacity = 0.8
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    loginBtn.opacity = 1
                    cursorShape = Qt.ArrowCursor
                }
            }

        }
        //注册按键
        Label{
            id:registBtn
            color:"#818186"
            text: "注册"
            font.pixelSize: 20
            font.family: BasicConfig.commFont
            anchors.top: loginBtn.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: loginBtn.horizontalCenter
        }
        //其他方式登录
        Row{
            id:otherMothodRow
            anchors.top: registBtn.bottom
            anchors.topMargin: 40
            spacing: 30
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater{
                model: 4
                Rectangle {
                    width: 40
                    height: width
                    radius: width/2
                    color: "transparent"
                    border.width: 1
                    border.color: BasicConfig.fieldBgBordColor
                    Image{
                        id:loginMethodIcon
                        scale: index===3?0.6:1
                        anchors.centerIn: parent
                        source: if(index === 0){
                                "/Resources/mianPopups/wx_normal.png"
                                }else if(index === 1){
                                "/Resources/mianPopups/QQ_normal.png"
                                }else if(index === 2){
                                "/Resources/mianPopups/sina_normal.png"
                                }else if(index === 3){
                                "/Resources/mianPopups/wy_normal.png"
                                }
                        layer.enabled: false
                        layer.effect: ColorOverlay{
                            source: loginMethodIcon
                            color:if(index === 0){
                                      "#629b4a"
                                      }else if(index === 1){
                                      "#4e8ac0"
                                      }else if(index === 2){
                                      "#9f2c31"
                                      }else if(index === 3){
                                      "#9f2c31"
                                      }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = Qt.PointingHandCursor
                            loginMethodIcon.layer.enabled = true
                            if(index === 0){
                                parent.color = "#252d28"
                                parent.border.color = "#2d3a2b"
                            }else if(index === 1){
                                parent.color = "#222a38"
                                parent.border.color = "#263346"
                            }else if(index === 2){
                                parent.color = "#251c24"
                                parent.border.color = "#321e26"
                            }else if(index === 3){
                                parent.color = "#251c24"
                                parent.border.color = "#321e26"
                            }
                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                            loginMethodIcon.layer.enabled = false
                            parent.color = "transparent"
                            parent.border.color = BasicConfig.fieldBgBordColor
                        }
                    }
                }
            }
        }
        //同意条款
        Item{
            anchors.top: otherMothodRow.bottom
            anchors.topMargin: 30
            anchors.left: loginBtn.left
            anchors.right: loginBtn.right
            height: 25
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                }
            }

            Row{
                anchors.fill: parent
                spacing:0
                Rectangle{
                    width: 24
                    height: width
                    radius: width/2
                    border.width: 1
                    color: selected?"#eb4d44":"transparent"
                    border.color: selected?"#eb4d44":BasicConfig.fieldBgBordColor
                    property bool selected: false
                    Label{
                        visible: parent.selected
                        color:"white"
                        font.bold: true
                        text: "√"
                        font.pixelSize: 18
                        font.family: BasicConfig.commFont
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: parent.selected = !parent.selected
                    }
                }
                Repeater{
                    model: 4
                    Label{
                        font.bold: true
                        text: if(index===0)" 同意"
                        else if(index === 1)"《服务条款》"
                        else if(index === 2)"《隐私政策》"
                        else if(index === 3)"《儿童隐私政策》"
                        color: index > 0?"#5d72aa":"#8e8e92"
                        font.pixelSize: 18
                        font.family: BasicConfig.commFont
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                cursorShape = Qt.PointingHandCursor
                                parent.opacity = 0.8
                            }
                            onExited: {
                                parent.opacity = 1
                                cursorShape = Qt.ArrowCursor
                            }
                        }
                    }
                }
            }
        }

    }
    //不显示，仅仅用来统一图标高度和宽度
    Image{
        id:nationFlagRange
        visible: false
        source: "/Resources/mianPopups/nationFlags/amarican.png"
    }
    ListModel{
        id:nationFlagsModel
        ListElement{src:"/Resources/mianPopups/nationFlags/china.png";country:"中国";tel:"+86"}
        ListElement{src:"/Resources/mianPopups/nationFlags/hk.png";country:"中国香港";tel:"+852"}
        ListElement{src:"/Resources/mianPopups/nationFlags/am.png";country:"中国澳门";tel:"+853"}
        ListElement{src:"/Resources/mianPopups/nationFlags/kor.png";country:"韩国";tel:"+82"}
        ListElement{src:"/Resources/mianPopups/nationFlags/amarican.png";country:"美国";tel:"+1"}
        ListElement{src:"/Resources/mianPopups/nationFlags/Germany.png";country:"德国";tel:"+49"}
        ListElement{src:"/Resources/mianPopups/nationFlags/canada.png";country:"加拿大";tel:"+1"}
        ListElement{src:"/Resources/mianPopups/nationFlags/ita.png";country:"意大利";tel:"+39"}
        ListElement{src:"/Resources/mianPopups/nationFlags/Netherland.png";country:"荷兰";tel:"+31"}
        ListElement{src:"/Resources/mianPopups/nationFlags/england.png";country:"英国";tel:"+44"}
    }
}
