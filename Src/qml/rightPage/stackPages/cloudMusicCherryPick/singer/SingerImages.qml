import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../../../basic"
Flow {
    spacing: 20
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.topMargin: 20
    anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
    ListModel{
        id:listModel
        ListElement{img:"/Resources/cherryPick/singers/pic0.png";singerName:"Future";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic1.png";singerName:"Fall Out Boy";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic2.png";singerName:"FloRida";sings:"单曲：1246"}
        ListElement{img:"/Resources/cherryPick/singers/pic3.png";singerName:"Faouzia";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic4.png";singerName:"Feint";sings:"单曲：345"}
        ListElement{img:"/Resources/cherryPick/singers/pic5.png";singerName:"Frank Ocean";sings:"单曲：53467"}
        ListElement{img:"/Resources/cherryPick/singers/pic6.png";singerName:"FrogMonster";sings:"单曲：4567"}
        ListElement{img:"/Resources/cherryPick/singers/pic7.png";singerName:"Fifth Harmony";sings:"单曲：456"}
        ListElement{img:"/Resources/cherryPick/singers/pic8.png";singerName:"Furtherao";sings:"单曲：3568"}
        ListElement{img:"/Resources/cherryPick/singers/pic10.png";singerName:"Fleurie";sings:"单曲：3657"}
        ListElement{img:"/Resources/cherryPick/singers/pic11.png";singerName:"Far Out";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic12.png";singerName:"FKJ";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic13.png";singerName:"Fly By Midnight";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic14.png";singerName:"Fool's Garden";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic15.png";singerName:"FINNEAS";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic16.png";singerName:"fenekot";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic17.png";singerName:"Full Trunk";sings:"单曲：3114"}
        ListElement{img:"/Resources/cherryPick/singers/pic18.png";singerName:"fcj";sings:"单曲：3114"}
    }
    Repeater{
        model: listModel
        Rectangle{
            width: 220 + 100 * (window.width-1317)/1242
            height: 300 + 100 * (window.width-1317)/1242
            //#212127
            color:"transparent"
            Rectangle{
                id:circleRect
                anchors.top: parent.top
                anchors.topMargin: 20
                width: parent.width-40
                height: width
                radius: width/2
                clip:true
                color:"transparent"
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    anchors.centerIn: parent
                    source: img
                }
                Image{
                    id:playImg
                    visible: false
                    anchors.centerIn: parent
                    source: "/Resources/cherryPick/recentMusic/play.png"
                }
            }
            Label{
                id:singerNameLabel
                text: singerName
                font.pixelSize: 18
                font.bold: true
                font.family: BasicConfig.commFont
                color:"white"
                anchors.top: circleRect.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label{
                text: sings
                font.pixelSize: 18
                font.bold: true
                font.family: BasicConfig.commFont
                color:"#a6a6a9"
                anchors.top: singerNameLabel.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "#212127"
                    playImg.visible =  true
                }
                onExited: {
                    parent.color = "transparent"
                    playImg.visible = false
                }
                onClicked: {

                }
            }
        }
    }
}
