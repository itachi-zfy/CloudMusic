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
                height: 700 * (-(width - 966)/1243*0.3 +1)
                property int outIndex: index
                ListModel{
                    id:model
                    ListElement{src:"/Resources/cherryPick/officalSing/pic1.png";gColor:"#ff937b5f";titleText:"欧美热播2004|和Aicia Keys重温2004流行经典";sing1:"1 REAL GANGSTALOVE";sing2:"2 Devuelve...";sing3:"3 Soy No"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic2.png";gColor:"#ff7c6362";titleText:"Waterbomb音乐节|夏日女王娜莲激情开唱";sing1:"1 POP1";sing2:"2 ABCD";sing3:"3 Love Count"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic3.png";gColor:"#ff468c9c";titleText:"K-Pop新歌到|The BOZY献声《浪漫这...";sing1:"1 Neverland";sing2:"2 123Music";sing3:"3 Soy No"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic4.png";gColor:"#ff31588d";titleText:"Air奖|澳洲宝藏歌手Jem Cassar-Daley获...";sing1:"1 King of disapointment";sing2:"2 And the rain";sing3:"3 Say ya"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic5.png";gColor:"#ff912d44";titleText:"Sumer Sonic|2024夏日之声再次临近";sing1:"1 恋";sing2:"2 不可逆";sing3:"3 他"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic6.png";gColor:"#ff4763a9";titleText:"Pentaport音乐节|韩国摇滚乐队Jannab嗨...";sing1:"1 We fell in love";sing2:"2 I loved you";sing3:"3 aha"}
                }
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
                            // OfficalSings{}
                        }
                    }
                }
            }
        }
    }
}

