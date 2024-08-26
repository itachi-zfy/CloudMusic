import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"
import "./cherryPick"
import "./songSquare"
import "../../../../js/SingListSquareEvents.js" as SingListSquareEvents
Flickable{
    id:flick
    contentHeight: 3200
    clip: true
    objectName: "SongListSquare"
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
    //指示器标题
    MainTitleIndicator{id:mianIndicator}

    PathView{}
    Column{
        id:col
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: mianIndicator.bottom
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        anchors.topMargin: 20
        // clip: true
        spacing: 50
        property real offset : ((width - 966)/1243*0.5 +1)
        Repeater{
            model: singSquareListModel
            Item{
                id:itemRoot
                width: contentFlow.implicitWidth
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 30
                height: 700 * col.offset
                property int outIndex: index
                ListModel{id:model}
                Label{
                    id:titleLabel
                    text:modelData
                    font.bold: true
                    color: "white"
                    font.family: "黑体"
                    font.pixelSize: 24
                    anchors.left: parent.left
                    anchors.bottom: parent.top
                    anchors.bottomMargin: 20
                }
                Flow{
                    id:contentFlow
                    spacing: 20
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: titleLabel.bottom
                    anchors.topMargin: 20
                    Repeater{
                        model: model
                        ZYYSingRectangle{
                            height:width+80
                            radius: 10
                            width: 226 * col.offset
                            color: gColor
                        }
                    }
                }
            }
        }
    }
}

