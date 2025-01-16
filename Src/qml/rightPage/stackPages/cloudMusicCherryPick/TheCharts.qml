import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"
import "./theCharts"
Flickable{
    id:flick
    contentHeight: 3800 * ((window.width-1317)/1242*0.08 + 1)
    clip: true
    objectName: "TheCharts"
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
    Connections{
        target: BasicConfig
        function onFullScreen(){
            other.model.setProperty(1,"originHeight",520)
            other.model.setProperty(2,"originHeight",300)
        }
        function onNormalScreen(){
            other.model.setProperty(1,"originHeight",800)
            other.model.setProperty(2,"originHeight",500)
        }
    }
    Column{
        id:col
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: 40
        // clip: true
        spacing: 30
        property real offset : ((width - 966)/1243*0.5 +1)
        //推荐榜单
        ListRecommendation{}
        //官方榜
        OfficalList{}
        //精选、曲风、全球、语种、特色
        OtherLists{
            id:other
        }
    }
}
