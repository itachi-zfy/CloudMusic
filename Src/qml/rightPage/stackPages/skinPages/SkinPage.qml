import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../../basic"
Item{
    objectName: "Skin"

    //将当前ScrollView的位置切换到普通皮肤的位置
    function jumpToCommon(){cusScrollBar.position=0}
    //将当前ScrollView的位置切换到VIP皮肤的位置
    function jumpToVIP(){cusScrollBar.position=vipText.y/scrollView.contentHeight}

    //官方、会员按钮
    Row{
        id:officalRow
        anchors.top:parent.top
        anchors.topMargin: 25 * BasicConfig.hScale
        anchors.left: parent.left
        spacing: 10 * BasicConfig.wScale
        Repeater{
            id:officalRep
            model: 2
            property int selectedIndex: 0
            Rectangle{
                width: 80
                height: 40
                radius: 20
                border.width: 1
                border.color:index === officalRep.selectedIndex ? "#331c1f":BasicConfig.fieldBgBordColor
                color: index === officalRep.selectedIndex ?"#24181c":"transparent"
                Label{
                    text: index?"会员":"官方"
                    color:index === officalRep.selectedIndex ? "#eb4d44":"#e8e8e8"
                    font.family: "黑体"
                    font.pixelSize: 20
                    anchors.centerIn:parent
                }
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
                        if(index === 0){
                            skinStackView.currentItem.jumpToCommon()
                        }else if(index === 1){
                            skinStackView.currentItem.jumpToVIP()
                        }
                    }
                }
            }
        }
    }
    //VIP自定义换肤按键
    Rectangle{
        id:customChangeSkinBtn
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.verticalCenter: officalRow.verticalCenter
        width: 150
        height: 40
        radius: 8
        color:"#212127"
        border.width: 1
        border.color:"#28282e"
        Image {
            id: jpIcon
            source: "/Resources/skin/hj.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
        }
        Label{
            text: "VIP"
            color:"#988c89"
            font.family: "黑体"
            font.pixelSize: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: jpIcon.right
            anchors.leftMargin: 5
        }
        Label{
            text: "自定义换肤"
            color:"white"
            font.family: BasicConfig.commFont
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
        }
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
    ScrollView{
        id:scrollView
        anchors.top: customChangeSkinBtn.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 50
        anchors.bottom: parent.bottom
        contentWidth: availableWidth
        // 此处用(parent.height-50)而不直接用height是为了防止报错：
        // QML ScrollView: Binding loop detected for property "implicitHeight"
        contentHeight: (parent.height-50)*1.2 + 200

        clip: true
        //////////////////////////////////////////////////////////////////////////////
        ///Qt5.15.2/root/5.15.2/msvc2019_64/qml/QtQuick/Controls.2/ScrollView.qml   //
        //此处要将qml源码中的                                                        //
        // ScrollBar.vertical: ScrollBar {                                          //
        //     parent: control                                                      //
        //     x: control.mirrored ? 0 : control.width - width                      //
        //     y: control.topPadding                                                //
        //     height: control.availableHeight                                      //
        //     active: control.ScrollBar.horizontal.active                          //
        // }                                                                        //
        //这一部分给注掉，不然就会出现一个小的没用的滚动条                              //
        //////////////////////////////////////////////////////////////////////////////
        ScrollBar.vertical: ScrollBar{//自定义ScrollView滚动条，不然访问不到
            id:cusScrollBar
            anchors.right: parent.right
            anchors.rightMargin: 10
            height: scrollView.availableHeight
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
        //自定义颜色选择器
        ColorSelectPopup{
            id:colorSelector
        }
        //RowLayout 需要被填充才会显示（我也不知道为什么）
        Item{
            anchors.fill: skinRowLayout
        }
        //官方主题
        RowLayout{
            id:skinRowLayout
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.top: parent.top
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
        //会员
        Label{
            id:vipText
            text: "会员"
            color:"white"
            anchors.top: skinRowLayout.bottom
            anchors.topMargin: 40
            font.bold: true
            font.family: "黑体"
            font.pixelSize: 32
        }
        //会员主题
        GridLayout{
            anchors.left: skinRowLayout.left
            anchors.right: skinRowLayout.right
            anchors.top: vipText.bottom
            anchors.topMargin: 20
            Layout.fillHeight: true
            Layout.fillWidth: true
            height: window.height/1.8
            columns: 4
            rows:2
            columnSpacing: 20
            rowSpacing: 20
            Repeater{
                id:vipRep
                model: vipThemeModel
                Rectangle{
                    id:vipItemRect
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "transparent"
                    radius: 10
                    clip: true
                    property bool hovered: false
                    Rectangle{
                        id:vipInnerRect
                        clip: true
                        anchors.fill: parent
                        anchors.bottomMargin: 80
                        color: "transparent"
                        Image {
                            anchors.fill: vipInnerRect
                            source: src
                        }
                    }
                    Item{
                        anchors.centerIn: vipInnerRect
                        anchors.margins: 30
                        Column{
                            spacing: 10
                            anchors.centerIn: parent
                            Rectangle{
                                height: vipInnerRect.height*0.3
                                width: vipInnerRect.width*0.6
                                color: "transparent"
                                radius: height/2
                                border.width: 1
                                visible: vipItemRect.hovered
                                border.color: BasicConfig.fieldBgBordColor
                                Text {
                                    text: "预览"
                                    color:"white"
                                    font.pixelSize: 20
                                    font.bold: true
                                    font.family: BasicConfig.commFont
                                    anchors.centerIn: parent
                                }
                            }
                            Rectangle{
                                height: vipInnerRect.height*0.3
                                width: vipInnerRect.width*0.6
                                color: "transparent"
                                border.width: 1
                                radius: height/2
                                border.color: BasicConfig.fieldBgBordColor
                                visible: vipItemRect.hovered
                                Text {
                                    text: "立即使用"
                                    color:"white"
                                    font.pixelSize: 20
                                    font.bold: true
                                    font.family: BasicConfig.commFont
                                    anchors.centerIn: parent
                                }
                            }
                        }
                    }
                    Item{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: vipInnerRect.bottom
                        anchors.bottom:parent.bottom
                        Column{
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            spacing: 10
                            Label{
                                id:conText
                                text: txt
                                color:"white"
                                font.pixelSize: 16
                                font.family: BasicConfig.commFont
                            }

                            Item{
                                width: 1
                                height:conText.height
                                Image {
                                    id: subJpIcon
                                    source: "/Resources/skin/hj.png"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                }
                                Label{
                                    text: "VIP专享"
                                    color:"#988c89"
                                    font.family: "黑体"
                                    font.pixelSize: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: subJpIcon.right
                                    anchors.leftMargin: 5
                                }
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = Qt.PointingHandCursor
                            parent.color = BasicConfig.bordColor
                            vipInnerRect.color = BasicConfig.bordColor
                            vipInnerRect.opacity = 0.6
                            parent.hovered = true
                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                            parent.color = "transparent"
                            vipInnerRect.color = "transparent"
                            vipInnerRect.opacity = 1
                            parent.hovered = false
                        }
                        onClicked: {
                        }
                    }
                }
            }
        }
    }
    ListModel{
        id:vipThemeModel
        ListElement{src:"/Resources/skin/vipTheme/tg.png";txt:"糖果"}
        ListElement{src:"/Resources/skin/vipTheme/lssl.png";txt:"绿色森林"}
        ListElement{src:"/Resources/skin/vipTheme/ljsy.png";txt:"流金岁月"}
        ListElement{src:"/Resources/skin/vipTheme/wlhy.png";txt:"蔚蓝海洋"}
        ListElement{src:"/Resources/skin/vipTheme/mt.png";txt:"麦田"}
        ListElement{src:"/Resources/skin/vipTheme/livehouse.png";txt:"livehouse"}
        ListElement{src:"/Resources/skin/vipTheme/hjg.png";txt:"黑胶馆"}
    }
}
