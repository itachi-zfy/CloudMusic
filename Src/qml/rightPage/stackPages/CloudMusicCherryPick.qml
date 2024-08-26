import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../basic"
import "./settingItems"
Item{
    id:cloudMusicCherryPickRoot
    objectName: "CloudMusicCherryPick"
    readonly property var types: ["精选","歌单广场","排行榜","歌手","VIP"]

    Item{
        anchors.fill: parent
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: 24 * BasicConfig.wScale

        //标题中的选择器
        Flow{
            id:titleFlow
            anchors.left: parent.left
            anchors.top: parent.top
            height: 25
            spacing: 20
            Repeater{
                id:selectorRep
                anchors.fill: parent
                model: cloudMusicCherryPickRoot.types
                property int selectedIndex : 0
                Item{
                    height: 40
                    width: selectorLabel.implicitWidth
                    function setLabelColor(color){selectorLabel.color = color}
                    Label{
                        id: selectorLabel
                        text: modelData
                        font.pixelSize: 20
                        font.bold: true
                        font.family: "黑体"
                        anchors.centerIn: parent
                        color:selectorRep.selectedIndex === index ? "white" :  "#a1a1a3"
                    }
                    Rectangle{
                        visible: selectorRep.selectedIndex === index
                        anchors.left: selectorLabel.left
                        anchors.right: selectorLabel.right
                        anchors.top: selectorLabel.bottom
                        anchors.leftMargin: selectorLabel.implicitWidth/selectorLabel.font.pixelSize * 2
                        anchors.rightMargin: selectorLabel.implicitWidth/selectorLabel.font.pixelSize * 2
                        anchors.topMargin: 3
                        height: 3
                        color:"#eb4d44"
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            if(selectorRep.selectedIndex === index){
                                selectorLabel.color = "white"
                            }else{
                                selectorLabel.color = "#b9b9ba"
                            }
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            if(selectorRep.selectedIndex === index){
                                selectorLabel.color = "white"
                            }else{
                                selectorLabel.color = "#a1a1a3"
                            }
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            for(let i = 0;i<selectorRep.count;i++)selectorRep.itemAt(i).setLabelColor("#a1a1a3")
                            selectorRep.selectedIndex = index
                            parent.setLabelColor("white")
                            if(index === 0 && cloudMusicChrryPickStackView.currentItem.objectName !== "CherryPick"){
                                cloudMusicChrryPickStackView.push("/Src/qml/rightPage/stackPages/cloudMusicCherryPick/CherryPick.qml")
                            }else if(index === 1 && cloudMusicChrryPickStackView.currentItem.objectName !== "SongListSquare"){
                                cloudMusicChrryPickStackView.push("/Src/qml/rightPage/stackPages/cloudMusicCherryPick/SongListSquare.qml")
                            }
                            BasicConfig.stackBehaviors.push(()=>{cloudMusicChrryPickStackView.pop()})
                        }
                    }
                }
            }
        }

        //下方主页面栈区
        StackView{
            id:cloudMusicChrryPickStackView
            anchors.top: titleFlow.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: -window.width * (36 * BasicConfig.wScale / 1317)
            clip:true
            anchors.topMargin: 20
            initialItem: "/Src/qml/rightPage/stackPages/cloudMusicCherryPick/CherryPick.qml"
            onCurrentItemChanged: {
                if(currentItem.objectName === "CherryPick"){
                    selectorRep.selectedIndex = 0
                }else if(currentItem.objectName === "SongListSquare"){
                    selectorRep.selectedIndex = 1
                }
            }
        }

    }
}
