import QtQuick 2.15
import QtQuick.Controls 2.15
import "../basic"

Flow{
    id:selectorFlow
    required property var indicatorModel
    required property int type          //0表示正常显示1表示 #歌手# 界面中对字母进行特殊处理
    Repeater{
        id:selectorRep
        anchors.fill: parent
        model: indicatorModel
        property int selectedIndex : 0
        Rectangle{
            height: 40
            width: selectorLabel.implicitWidth + 30
            radius: 18
            border.width: 1
            color:type?"transparent":(selectorRep.selectedIndex === index ? "#24181c" : "transparent")
            border.color:type?"transparent":(selectorRep.selectedIndex === index ? "#331c1f" :  BasicConfig.fieldBgBordColor)
            Label{
                id: selectorLabel
                text: modelData
                font.pixelSize: 18
                font.bold: true
                font.family: BasicConfig.commFont
                anchors.centerIn: parent
                color:type?(index===1?BasicConfig.commGray:"white"):(selectorRep.selectedIndex === index ? "#eb4d44" :  "white")
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    if(!type || index !== 1)selectorLabel.color = "#eb4d44"
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    if(selectorRep.selectedIndex !== index){
                        if(type && index === 1)return
                        selectorLabel.color = "white"
                    }
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    if(type && index === 1)return
                    selectorRep.selectedIndex = index
                    for(let i = 0;i<selectorRep.model.length;i++){
                        if(i === index)continue
                        let item = selectorRep.itemAt(i)
                        for(let j = 0;j<item.children.length;j++){
                            if(item.children[j] instanceof Label){
                                item.children[j].color = 'white'
                            }
                        }
                    }
                }

            }
        }
    }

}
