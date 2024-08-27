import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"

Item{
    id:filterItem
    anchors.left: topItemsRow.left
    anchors.right: topItemsRow.right
    anchors.top: topItemsRow.bottom
    anchors.topMargin: 50
    height: 50
    Connections{
        target: BasicConfig
        function onFullScreen(){
            let addList = ["知识","二次元","明星专区","生活","亲子"]
            for(let data of addList){
                listModel.insert(listModel.count-1,{modelData:data})
            }
        }
        function onNormalScreen(){
            let addList = ["知识","二次元","明星专区","生活","亲子"]
            for(let data of addList){
                listModel.remove(listModel.count-2)
            }
        }
    }
    Row{
        anchors.fill: parent
        ListModel{
            id:listModel
            ListElement{modelData:"排行榜"}
            ListElement{modelData:"情感"}
            ListElement{modelData:"音乐播客"}
            ListElement{modelData:"有声书"}
            ListElement{modelData:"脱口秀"}
            ListElement{modelData:"创作翻唱"}
            ListElement{modelData:"电音"}
            ListElement{modelData:"更多＞"}
        }
        spacing: 20
        Repeater{
            model:listModel
            Rectangle{
                color: modelData!=="更多＞"?"#2d2d37":"transparent"
                width: (modelData!=="更多＞"?105:85) * ((window.width-1317)/1242*0.38 + 1)
                height: 50 * ((window.width-1317)/1242*0.1 + 1)
                radius: 5
                border.width: 1
                border.color: "#2b2b30"
                Label{
                    text:modelData
                    font.pixelSize: 20
                    font.family: BasicConfig.commFont
                    color: "white"
                    anchors.centerIn: parent
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
        }
    }
}
