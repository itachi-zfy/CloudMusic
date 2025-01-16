import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../basic"
import "../../commonUI"
import "./settingItems"
Item{
    id:q
    objectName: "CloudMusicCherryPick"
    readonly property var types: ["精选","歌单广场","排行榜","歌手"/*,"VIP"*/]

    Item{
        anchors.fill: parent
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: 24 * BasicConfig.wScale

        //标题中的选择器
        ZYYUnderLineIndicator{
            id:titleFlow
            anchors.left: parent.left
            anchors.top: parent.top
            height: 25
            spacing: 20
            options: types
            type:0
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
                    titleFlow.getRepeater().selectedIndex = 0
                }else if(currentItem.objectName === "SongListSquare"){
                    titleFlow.getRepeater().selectedIndex = 1
                }
            }
        }

    }
}
