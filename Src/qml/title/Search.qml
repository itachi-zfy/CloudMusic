import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import Qt5Compat.GraphicalEffects

import "./../basic"
import "./../commonUI"
Row{
    id:searchRow
    //页面回退到上一步 backForwardItem
    Connections{
        target: BasicConfig
        function onBlankAreaClicked(){
            searchTextField.focus = false
        }
    }
    Item{
        id:backForwardItem
        width: 24 * BasicConfig.wScale
        height: 35 * BasicConfig.hScale
        Rectangle{
            id:backForwardRect
            radius: 4 * BasicConfig.wScale
            color: "transparent"
            border.color: BasicConfig.bordColor
            border.width: 1
            anchors.fill: parent
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    if(BasicConfig.stackBehaviors.length){
                        backForwardRect.color = "transparent"
                        backForwardRect.layer.enabled = false
                    }
                }
                onEntered: {
                    if(BasicConfig.stackBehaviors.length){
                        backForwardRect.color = BasicConfig.leftBgColor
                        backForwardRect.layer.enabled = true
                    }
                }
                onClicked:{
                    if(BasicConfig.stackBehaviors.length){
                        if(BasicConfig.stackBehaviorsAdded){
                            BasicConfig.stackBehaviorsIndexs.pop()
                            BasicConfig.stackBehaviorsAdded = false
                        }
                        BasicConfig.stackBehaviors.pop()()
                        if(BasicConfig.stackBehaviors.length===0)BasicConfig.stackBehaviorsIndexs.unshift(0)
                        console.log(`页面返回上一级，当前行为栈深度：${BasicConfig.stackBehaviors.length}`)
                    }
                }
            }
        }
        Image{
            id:backForwardIcon
            scale: BasicConfig.wScale
            anchors.centerIn: backForwardRect
            source: "/Resources/title/arrow.png"
            layer.enabled: true
            layer.effect: ColorOverlay{
                source: backForwardIcon
                color: "white"

            }
        }
    }
    //搜索框 searchTextField
    ZYYSerchBox{
        id:searchTextField
        z:window.z + 1
        height: backForwardItem.height
        width: 240 //* BasicConfig.wScale
        leftPadding:40 //* BasicConfig.wScale
    }
    ListModel{
        id:searchSingModel
        ListElement{singName:"想象之中"}
        ListElement{singName:"雨道"}
        ListElement{singName:"哪里都是你"}
        ListElement{singName:"入戏太深"}
        ListElement{singName:"That girl"}
        ListElement{singName:"素颜"}
        ListElement{singName:"她说"}
        ListElement{singName:"ABC"}
        ListElement{singName:"daylight"}
        ListElement{singName:"其他"}
    }
    ListModel{
        id:hotSearchSingModel
        ListElement{singName:"想象之中"}
        ListElement{singName:"雨道"}
        ListElement{singName:"哪里都是你"}
        ListElement{singName:"入戏太深"}
        ListElement{singName:"That girl"}
        ListElement{singName:"素颜"}
        ListElement{singName:"她说"}
        ListElement{singName:"ABC"}
        ListElement{singName:"daylight"}
        ListElement{singName:"其他"}
        ListElement{singName:"想象之中"}
        ListElement{singName:"雨道"}
        ListElement{singName:"哪里都是你"}
        ListElement{singName:"入戏太深"}
        ListElement{singName:"That girl"}
        ListElement{singName:"素颜"}
        ListElement{singName:"她说"}
        ListElement{singName:"ABC"}
        ListElement{singName:"daylight"}
        ListElement{singName:"其他"}
    }
    Popup{
        id:searchPop
        width:searchRow.implicitWidth
        height: 600
        x:0
        y:searchTextField.height + 10
        background: Rectangle{
            anchors.fill: parent
            radius: 10
            color:"#2d2d37"
            clip:true
            Flickable{
                anchors.fill: parent
                contentHeight: 1200
                ScrollBar.vertical: ScrollBar{//自定义ScrollView滚动条，不然访问不到
                    id:cusScrollBar
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    width: 10
                    policy:ScrollBar.AlwaysOn
                    contentItem: Rectangle {
                        visible: parent.active
                        implicitWidth: 10
                        implicitHeight: 10
                        radius: 4
                        color: "#42424b"
                    }
                }
                Column{
                    anchors.fill: parent
                    spacing:40
                    Item{
                        id:histoyAndRemoveItem
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: searchSingModel.count?(searchLabel.implicitHeight + singFlow.implicitHeight + 50):1
                        Item{
                            id:histoyItem
                            visible: searchSingModel.count
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.topMargin: 30
                            anchors.leftMargin: 30
                            height: removeIconImg.implicitHeight
                            Label{
                                id:searchLabel
                                color:"#7f7f85"
                                text: "搜索历史"
                                font.pixelSize: 18 * BasicConfig.wScale
                                font.family: BasicConfig.commFont
                            }
                            Image {
                                id:removeIconImg
                                anchors.right: parent.right
                                anchors.rightMargin: 30
                                anchors.verticalCenter:searchLabel.verticalCenter
                                source: "/Resources/searchBox/remove.png"
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        cursorShape = Qt.PointingHandCursor
                                    }
                                    onExited: {
                                        cursorShape = Qt.ArrowCursor
                                    }
                                    onClicked: searchSingModel.clear()
                                }
                            }
                        }
                        Flow{
                            id:singFlow
                            anchors.top: histoyItem.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.topMargin: 20
                            anchors.leftMargin: 30
                            spacing: 20 * BasicConfig.wScale
                            Repeater{
                                id:historyRep
                                anchors.fill: parent
                                model: searchSingModel
                                property bool showAll: false
                                Rectangle{
                                    width: dataLabel.implicitWidth + 20
                                    height: 40 * BasicConfig.hScale
                                    border.width: 1
                                    border.color: "#45454e"
                                    color: "#2d2d37"
                                    opacity: index?0.8:1
                                    radius: 15 * BasicConfig.hScale
                                    visible: index < (historyRep.showAll?10:7)
                                    Label{
                                        property string contentText: singName === undefined ? "":(historyRep.showAll?(index === 9 ? ">":singName):(index === 6 ? ">":singName))
                                        id:dataLabel
                                        text: undefined ===  contentText? "":contentText
                                        rotation: historyRep.showAll?(index === 9 ? -90 :0):(index === 6 ? 90 :0)
                                        font.pixelSize: 20 * BasicConfig.hScale
                                        anchors.centerIn:parent
                                        color:"#ddd"
                                        font.family:"微软雅黑 Light"
                                        height: 25
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            dataLabel.color = "white"
                                            parent.color = "#393943"
                                            cursorShape = Qt.PointingHandCursor
                                        }
                                        onExited: {
                                            dataLabel.color = "#ddd"
                                            parent.color = "#2d2d37"
                                            cursorShape = Qt.ArrowCursor
                                        }
                                        onClicked: {
                                            if(historyRep.showAll && index === 9) historyRep.showAll = false
                                            else if(!historyRep.showAll && index === 6) historyRep.showAll = true
                                            else {
                                                searchTextField.text = dataLabel.text
                                                searchPop.close()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height:searchPop.height - histoyAndRemoveItem.height
                        Label{
                            id:hotSearchLabel
                            color:"#7f7f85"
                            text: "热搜榜"
                            anchors.left: parent.left
                            anchors.leftMargin: 30
                            height: removeIconImg.implicitHeight
                            font.pixelSize: 18 * BasicConfig.wScale
                            font.family: BasicConfig.commFont
                        }
                        Column{
                            anchors.top: hotSearchLabel.bottom
                            anchors.right: parent.right
                            anchors.left: parent.left
                            anchors.bottom: parent.bottom
                            anchors.topMargin: 20

                            Repeater{
                                model: hotSearchSingModel
                                delegate: Rectangle{
                                    width: singFlow.width
                                    height: 40
                                    color:"transparent"
                                    Label{
                                        id:hotSearchIndexLabel
                                        color:index < 3?"#eb4d44":"#818187"
                                        text: String(index + 1)
                                        anchors.left: parent.left
                                        anchors.leftMargin: 20
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pixelSize: 18 * BasicConfig.wScale
                                        font.family: BasicConfig.commFont
                                    }
                                    Label{
                                        id:hotSearchNameLabel
                                        color:"#ddd"
                                        text: singName
                                        anchors.left: hotSearchIndexLabel.right
                                        anchors.leftMargin: 30
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pixelSize: 18 * BasicConfig.wScale
                                        font.family: BasicConfig.commFont
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
                                            searchTextField.text = singName
                                            searchPop.close()
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
    //听歌识曲
    Item{
        id:soundHoundItem
        height: searchTextField.height
        width: height
        Rectangle{
            id:soundHoundRect
            radius: 8 * BasicConfig.wScale
            color: "#241c26"
            border.color: "#36262f"
            border.width: 1
            anchors.fill: parent
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {
                    soundHoundRect.color = "#241c26"
                }
                onEntered: {
                    soundHoundRect.color = "#312231"
                }
                onClicked:{
                    console.log("听歌识曲")
                }
            }
        }
        Image{
            id:soundHoundIcon
            anchors.centerIn: soundHoundItem
            source: "/Resources/title/record.png"

        }
    }
}
