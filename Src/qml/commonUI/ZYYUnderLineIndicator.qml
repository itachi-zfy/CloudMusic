import QtQuick 2.15
import QtQuick.Controls 2.15
import "../basic"

Flow{
    id:titleFlow
    required property var options
    required property int type      //0表示精选中的标题指示器 1表示喜欢中的标题指示器
    function getRepeater(){return selectorRep}
    Repeater{
        id:selectorRep
        anchors.fill: parent
        model: options
        property int selectedIndex : 0
        onSelectedIndexChanged: {
            for(let i = 0;i<selectorRep.model.length;i++){
                let item = selectorRep.itemAt(i)
                if(i === selectedIndex)
                {
                    for(let j = 0;j<item.children.length;j++){
                        if(item.children[j] instanceof Label){
                            item.children[j].color = 'white'
                        }
                    }
                }
                else{
                    for(let j = 0;j<item.children.length;j++){
                        if(item.children[j] instanceof Label){
                            item.children[j].color = '#a1a1a3'
                        }
                    }
                }
            }
        }
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
            Label{
                id:numberLabel
                visible: type===2
                text: String(Number(!index))
                font.pixelSize: 12
                font.bold: true
                font.family: "黑体"
                anchors.top:selectorLabel.top
                anchors.left: selectorLabel.right
                anchors.leftMargin: 1
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
                    if(titleFlow.type === 0){
                        if(index === 0 && cloudMusicChrryPickStackView.currentItem.objectName !== "CherryPick"){
                            cloudMusicChrryPickStackView.push("/Src/qml/rightPage/stackPages/cloudMusicCherryPick/CherryPick.qml")
                        }else if(index === 1 && cloudMusicChrryPickStackView.currentItem.objectName !== "SongListSquare"){
                            cloudMusicChrryPickStackView.push("/Src/qml/rightPage/stackPages/cloudMusicCherryPick/SongListSquare.qml")
                        }else if(index === 2 && cloudMusicChrryPickStackView.currentItem.objectName !== "TheCharts"){
                            cloudMusicChrryPickStackView.push("/Src/qml/rightPage/stackPages/cloudMusicCherryPick/TheCharts.qml")
                        }else if(index === 3 && cloudMusicChrryPickStackView.currentItem.objectName !== "Singers"){
                            cloudMusicChrryPickStackView.push("/Src/qml/rightPage/stackPages/cloudMusicCherryPick/Singers.qml")
                        }else if(index === 4 && cloudMusicChrryPickStackView.currentItem.objectName !== "Vip"){
                            cloudMusicChrryPickStackView.push("/Src/qml/rightPage/stackPages/cloudMusicCherryPick/Vip.qml")
                        }else{
                            return
                        }
                        BasicConfig.stackBehaviorsIndexs.push(index)
                        BasicConfig.stackBehaviorsAdded = true
                        BasicConfig.stackBehaviors.push(()=>{cloudMusicChrryPickStackView.pop();selectorRep.selectedIndex = BasicConfig.stackBehaviorsIndexs.pop()})
                    }else if(type === 1){

                    }
                }
            }
        }
    }
}

