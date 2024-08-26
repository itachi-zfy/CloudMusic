import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../basic"
import "../../commonUI"

ScrollView {
    id:podcastRoot
    contentWidth: availableWidth
    // 此处用(parent.height-50)而不直接用height是为了防止报错：
    // QML ScrollView: Binding loop detected for property "implicitHeight"
    contentHeight: 4000
    ScrollBar.vertical: ScrollBar{//自定义ScrollView滚动条，不然访问不到
        id:cusScrollBar
        anchors.right: parent.right
        anchors.rightMargin: 5
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
    Row{
        id:topItemsRow
        spacing: 20
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.right: parent.right
        anchors.leftMargin : margin
        anchors.rightMargin: margin
        anchors.topMargin: 50
        clip: true
        property real margin: window.width * (36 * BasicConfig.wScale / 1317)
        property real fixedWidth
        function refeshWidth(){
            if(width > fixedWidth*3){
                fixedWidth = width/3-20
            }else{
                fixedWidth = width/2-10
            }
        }
        Component.onCompleted: {fixedWidth = width/2-10;refeshWidth();}
        onWidthChanged: refeshWidth()
        Rectangle{
            id:rootRect
            width: parent.fixedWidth
            height: width/2

            radius: 10
            clip: true
            ListModel{
                id:fmModel
                ListElement{flag:0;itemName:"听见好书";src:"/Resources/podcast/topLeftRectArea/pic0.png";bgColor:"#65b18e";titleText:"江边说《哈利波特》33:哈4开启，最年轻的三强争霸赛勇士（上）";playMenu:"江边精讲《哈利波特》";playNum:"75.1万"}
                ListElement{flag:1;itemName:" 长知识 ";src:"/Resources/podcast/topLeftRectArea/pic1.png";bgColor:"#ae9753";titleText:"这4件事真的会让你离钱越来越远，很多人没意识到!";playMenu:"MakeVoice——生活杂志";playNum:"57.5万"}
                ListElement{flag:2;itemName:"英语美文";src:"/Resources/podcast/topLeftRectArea/pic2.png";bgColor:"#a64ea8";titleText:"面对ChatGPT,选择做你自己·永清";playMenu:"为你读英语美文";playNum:"34万"}
                ListElement{flag:3;itemName:"真实故事";src:"/Resources/podcast/topLeftRectArea/pic3.png";bgColor:"#a7594c";titleText:"震撼心灵:在上海国际电影节开启纪录片观影模式 凹凸TOALL第94期";playMenu:"凹凸TOALL";playNum:"5903"}
                ListElement{flag:4;itemName:"新闻资讯";src:"/Resources/podcast/topLeftRectArea/pic4.png";bgColor:"#a64e57";titleText:"重庆通报一中学副校长和教科室主任违反生活纪律：2人被免职";playMenu:"一点资讯官方音频播报";playNum:"1.2亿"}
                ListElement{flag:5;itemName:"音乐推荐";src:"/Resources/podcast/topLeftRectArea/pic5.png";bgColor:"#b3b3b3";titleText:"棱镜乐队：我们是，也更想成为温暖的人";playMenu:"音乐咖啡馆";playNum:"276.4万"}
                ListElement{flag:6;itemName:"相声小品";src:"/Resources/podcast/topLeftRectArea/pic6.png";bgColor:"#b1b0b2";titleText:"231224紫金港蒙民伟紫艺十五周年之封箱专场2-7.大保镖 陈明凯 程帅";playMenu:"紫艺相声录音";playNum:"26626"}
                ListElement{flag:7;itemName:"情感赫兹";src:"/Resources/podcast/topLeftRectArea/pic7.png";bgColor:"#a64e79";titleText:"好久不见，我很想念";playMenu:"最深的夜里陪你";playNum:"878.1万"}
                ListElement{flag:8;itemName:"搞笑段子";src:"/Resources/podcast/topLeftRectArea/pic8.png";bgColor:"#a6524e";titleText:"每天都洗头就不丑了";playMenu:"钢蛋脱口秀";playNum:"13.9万"}
                ListElement{flag:9;itemName:"热门翻唱";src:"/Resources/podcast/topLeftRectArea/pic9.png";bgColor:"#6349ad";titleText:"新年快乐";playMenu:"解忧杂货店";playNum:"28.8万"}
                ListElement{flag:10;itemName:"历史解密";src:"/Resources/podcast/topLeftRectArea/pic10.png";bgColor:"#ac8951";titleText:"一期节目了解西域（新疆）2000年历史";playMenu:"陈说历史";playNum:"12044"}
                ListElement{flag:11;itemName:"影视娱乐";src:"/Resources/podcast/topLeftRectArea/pic11.png";bgColor:"#5581af";titleText:"S4.E2 我们情绪不稳定的人生怎么过呀！";playMenu:"啊！是猫咪呀！|从人物...";playNum:"53060"}
            }
            Label{
                id:topTitleLabel1
                font.family: BasicConfig.commFont
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: ":::::::::::::::::::::::::::::::::::::::::::::::::::::随心FM::::::::::::::::::::::::::::::::::::::::::::::::::"
            }
            Image{
                id:discriptionImg
                anchors.top: parent.top
                anchors.left:parent.left
                anchors.topMargin: 50
                anchors.leftMargin: 20
            }
            Column{
                id:discriptionCol
                anchors.left: discriptionImg.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.verticalCenter: discriptionImg.verticalCenter
                spacing: 5
                Label{
                    id:titleTextLabel
                    font.family: "黑体"
                    font.pixelSize: 20
                    color:"white"
                    width: parent.width
                    wrapMode: Label.WordWrap
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label{
                    id:playMenuLabel
                    font.family: "黑体"
                    color:"#a1a1a3"
                    font.pixelSize: 15
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            ListView{
                id:pathView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 10
                anchors.rightMargin: 50
                height: 30
                model: fmModel
                clip: true
                orientation: ListView.Horizontal
                preferredHighlightBegin:0.5
                preferredHighlightEnd:0.5
                spacing: 10
                property real preX: 0
                property bool flickEndedState : false

                onFlickEnded:{
                    flickEndedState = false
                }

                onContentXChanged: {
                    console.log(contentX,originX)
                    if(contentY === 0){
                        if(flicking)flickEndedState = true
                    }
                    if(contentX > preX){//向左滑动
                        if(contentX > 400){
                            console.log("dfffffffffffffffffffff")
                            if(!flickEndedState)fmModel.move(0,pathView.count-3,3)
                        }
                    }else{//向右滑动
                        if(contentX < 260){
                            if(!flickEndedState)
                            fmModel.move(pathView.count-3,0,3)
                        }
                    }

                    preX = contentX
                }
                // onFlickEnded:{
                //     console.log("ddddddddddddddddfffffffffffffff")
                // }

                delegate:Item{
                    height: 30
                    clip:true
                    width: delegateLabel.implicitWidth
                    Label{
                        id:delegateLabel
                        text: itemName
                        color:index ===  pathView.currentIndex ?"red":"white"
                        font.family: "黑体"
                        font.pixelSize: 20
                        width: parent.width
                        anchors.horizontalCenter: parent.horizontalCenter
                        onXChanged: {
                            // if(index === 0){
                            //     console.log('000000000000000000000',x)
                            // }
                        }
                        MouseArea{
                            anchors.fill: parent

                            onClicked:{
                                pathView.currentIndex = index
                                pathView.positionViewAtIndex(index,ListView.Center)
                            }
                        }
                    }
                    Component.onCompleted: {
                        rootRect.color = bgColor
                        discriptionImg.source = src
                        titleTextLabel.text = titleText
                        playMenuLabel.text = "博单" + playMenu + "" + playNum + "次播放"
                    }
                }

            }
        }
        Rectangle{
            width: parent.fixedWidth
            height: width/2
            radius: 10
            color:"#ce9061"
            Row{
                id:topIndicatorRow
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 30
                spacing: 20
                property int index: 0
                Label{
                    id:highScoreLabel
                    text: "高分必听"
                    color:"white"
                    font.family: "黑体"
                    font.pixelSize: 20
                    font.bold: true
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = !topIndicatorRow.index?"white":"#ddd"
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            parent.color = !topIndicatorRow.index?"white":"#ebd0b9"
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked:{
                            topIndicatorRow.index = 0
                            highScoreLabel.color = "white"
                            hotLabel.color = "#ebd0b9"
                        }
                    }
                }
                Label{
                    id:hotLabel
                    text: "今日最热"
                    color:"#ebd0b9"
                    font.family: "黑体"
                    font.pixelSize: 20
                    font.bold: true
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = topIndicatorRow.index?"white":"#ddd"
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            parent.color = topIndicatorRow.index?"white":"#ebd0b9"
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked:{
                            topIndicatorRow.index = 1
                            highScoreLabel.color = "#ebd0b9"
                            hotLabel.color = "white"
                        }
                    }
                }
            }
            Item{
                id:middleItems
                property real scaleOffset: (window.width-1317)/1627 * 0.7 + 1
                property real itemImgWidth
                anchors.top: topIndicatorRow.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: 30 + itemImgWidth*(middleItems.scaleOffset-1)
                anchors.bottomMargin: 30
                anchors.rightMargin: 30* scaleOffset
                anchors.leftMargin: 30 * scaleOffset
                Component.onCompleted: { console.log (scaleOffset,window.width)}
                Row{
                    anchors.fill: parent
                    spacing: 10
                    Repeater{
                        model:["月亮伴你入睡","睡前情感故事","晚安睡前故事","久念暖心治愈电台"]
                        Item{
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            width: hotImg.implicitWidth * middleItems.scaleOffset
                            Image{
                                id:hotImg
                                scale: middleItems.scaleOffset
                                source: `/Resources/podcast/topMiddleRectArea/pic${index}.png`
                                Component.onCompleted: middleItems.itemImgWidth = implicitWidth
                            }
                            Label{
                                text: modelData
                                color:"#ebd0b9"
                                font.family: "黑体"
                                font.pixelSize: 20
                                anchors.top: hotImg.bottom
                                anchors.topMargin: 5+hotImg.implicitWidth*(middleItems.scaleOffset-1)
                                width: hotImg.implicitWidth
                                wrapMode: Label.WrapAnywhere
                                anchors.left: hotImg.left
                            }
                        }
                    }
                }
            }

        }
        Rectangle{
            width: parent.fixedWidth
            height: width/2
            radius: 10
        }
    }
}
