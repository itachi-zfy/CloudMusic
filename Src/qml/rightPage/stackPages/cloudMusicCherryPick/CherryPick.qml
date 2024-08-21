import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"
import "./cherryPick"
Flickable{
    id:flick
    contentHeight: 2800
    clip: true
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
    Column{
        anchors.fill: parent
        anchors.topMargin: 30
        spacing: 30
        //轮播图
        CarouselImage{}

        //官方歌单
        OfficalSings{}

        //最新音乐
        RecentMusic{}
    }
}

