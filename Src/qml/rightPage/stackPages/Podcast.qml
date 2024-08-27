import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../basic"
import "../../commonUI"
import "./podcast"
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
    //顶部区域
    TopArea{id:topItemsRow}
    //过滤标签
    TopFilter{id:filterItem}
    //猜你喜欢
    GuessYouLike{
        id:guessYouLike
        anchors.top: filterItem.bottom
        anchors.left: filterItem.left
        anchors.right: filterItem.right
        height: 680*((window.width-1317)/1242*0.48 + 1)
        clip:true
        anchors.topMargin: 40
    }
}
