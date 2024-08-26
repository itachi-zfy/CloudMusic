import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"
import "../../../../../js/SingListSquareEvents.js" as SingListSquareEvents
Flow{
    id:selectorFlow
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.topMargin: 30
    height: 80
    spacing: 10
    anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
    Repeater{
        id:selectorRep
        anchors.fill: parent
        model: ["推荐","官方","华语","摇滚","民谣","电子","轻音乐","更多分类∨"]
        property int selectedIndex : 0
        Rectangle{
            height: 40
            width: selectorLabel.implicitWidth + 30
            radius: 18
            border.width: 1
            color:selectorRep.selectedIndex === index ? "#24181c" : "transparent"
            border.color:selectorRep.selectedIndex === index ? "#331c1f" :  BasicConfig.fieldBgBordColor
            Label{
                id: selectorLabel
                text: modelData
                font.pixelSize: 18
                font.bold: true
                font.family: BasicConfig.commFont
                anchors.centerIn: parent
                color:selectorRep.selectedIndex === index ? "#eb4d44" :  "white"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    selectorLabel.color = "#eb4d44"
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    selectorLabel.color = "white"
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    if(index !== 7){
                        selectorRep.selectedIndex = index
                    }else{
                        morePop.open()
                    }
                }

            }
            Popup{
                id:morePop
                width: 600
                height: 300
                y:parent.height + 10
                x:(parent.width- width)/2
                onOpened:{
                    selectorLabel.text = "更多分类∧"
                }
                onClosed:{
                    selectorLabel.text = "更多分类∨"
                }
                background: Rectangle{
                    anchors.fill: parent
                    color: "#2d2d37"
                    radius: 10
                    Flow{
                        id:titleFlow
                        anchors.left: parent.left
                        anchors.top: parent.top
                        height: 25
                        spacing: 20
                        anchors.topMargin: 30
                        anchors.leftMargin: 20
                        Repeater{
                            id:subSelectorRep
                            anchors.fill: parent
                            model: ["语种","风格","场景","情感","主题"]
                            property int selectedIndex : 0
                            onSelectedIndexChanged: {
                                SingListSquareEvents.refreshModel(selectedIndex,classifyModel)
                            }
                            Item{
                                height: 40
                                width: subSelectorLabel.implicitWidth
                                function setLabelColor(color){subSelectorLabel.color = color}
                                Label{
                                    id: subSelectorLabel
                                    text: modelData
                                    font.pixelSize: 20
                                    font.bold: true
                                    font.family: "黑体"
                                    anchors.centerIn: parent
                                    color:subSelectorRep.selectedIndex === index ? "white" :  "#a1a1a3"
                                }
                                Rectangle{
                                    visible: subSelectorRep.selectedIndex === index
                                    anchors.left: subSelectorLabel.left
                                    anchors.right: subSelectorLabel.right
                                    anchors.top: subSelectorLabel.bottom
                                    anchors.leftMargin: subSelectorLabel.implicitWidth/subSelectorLabel.font.pixelSize * 2
                                    anchors.rightMargin: subSelectorLabel.implicitWidth/subSelectorLabel.font.pixelSize * 2
                                    anchors.topMargin: 3
                                    height: 3
                                    color:"#eb4d44"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        if(subSelectorRep.selectedIndex === index){
                                            subSelectorLabel.color = "white"
                                        }else{
                                            subSelectorLabel.color = "#b9b9ba"
                                        }
                                        cursorShape = Qt.PointingHandCursor
                                    }
                                    onExited: {
                                        if(subSelectorRep.selectedIndex === index){
                                            subSelectorLabel.color = "white"
                                        }else{
                                            subSelectorLabel.color = "#a1a1a3"
                                        }
                                        cursorShape = Qt.ArrowCursor
                                    }
                                    onClicked: {
                                        for(let i = 0;i<subSelectorRep.count;i++)subSelectorRep.itemAt(i).setLabelColor("#a1a1a3")
                                        subSelectorRep.selectedIndex = index
                                        parent.setLabelColor("white")
                                    }
                                }
                            }
                        }
                    }
                    Flow{
                        anchors.left: titleFlow.left
                        anchors.right: parent.right
                        anchors.rightMargin: 30
                        anchors.top: titleFlow.bottom
                        anchors.topMargin: 30
                        spacing: 10
                        ListModel{
                            id:classifyModel
                            ListElement{modelData:"欧美"}
                            ListElement{modelData:"日语"}
                            ListElement{modelData:"韩语"}
                            ListElement{modelData:"粤语"}
                        }
                        Repeater{
                            id:grandSelectorRep
                            anchors.fill: parent
                            model: classifyModel
                            property int selectedIndex : 0
                            Rectangle{
                                height: 40
                                width: grandSelectorLabel.implicitWidth + 30
                                radius: 18
                                border.width: 1
                                color: "transparent"
                                border.color:"#3b3b44"
                                Label{
                                    id: grandSelectorLabel
                                    text: modelData
                                    font.pixelSize: 18
                                    font.bold: true
                                    font.family: BasicConfig.commFont
                                    anchors.centerIn: parent
                                    color: "white"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        parent.color = "#3b2f38"
                                        parent.border.color = "#4d3239"
                                        grandSelectorLabel.color = "#c64742"
                                        cursorShape = Qt.PointingHandCursor
                                    }
                                    onExited: {
                                        parent.color = "transparent"
                                        parent.border.color = "#3b3b44"
                                        grandSelectorLabel.color = "white"
                                        cursorShape = Qt.ArrowCursor
                                    }
                                    onClicked: {
                                        console.log(index)
                                        grandSelectorRep.selectedIndex = index
                                        morePop.close()
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
