import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"

Item{
    anchors.left: parent.left
    anchors.right: parent.right
    height: 320 * singerRect.offset
    Connections{
        target:BasicConfig
        function onFullScreen(){
            singerRep.x = 0
            leftIniImg.enabled = false
            rigtIniImg.enabled = false
        }
        function onNormalScreen(){
            singerRep.x = 0
            leftIniImg.enabled = false
            rigtIniImg.enabled = true
        }
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            leftIniImg.visible = true
            rigtIniImg.visible = true
            cursorShape = Qt.PointingHandCursor
        }
        onExited: {
            leftIniImg.visible = false
            rigtIniImg.visible = false
            cursorShape = Qt.ArrowCursor
        }
    }
    Label{
        id:titleLabel
        text:"官方歌单>"
        font.bold: true
        color: "white"
        font.family: "黑体"
        font.pixelSize: 24
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: -20
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)

    }
    Item{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: titleLabel.bottom
        anchors.topMargin: 10
        height: parent.height
        Image {
            id:leftIniImg
            visible: false
            enabled: false
            anchors.left: parent.left
            y:(singerRect.height-(implicitHeight))/(2 * ((singerRect.width - 966)/1243*0.5 +1))
            source: "/Resources/cherryPick/leftArrow.png"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    leftIniImg.visible = true
                    rigtIniImg.visible = true
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    leftIniImg.visible = false
                    rigtIniImg.visible = false
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    if(singerRep.x < 0)slideToAni.start()
                }
            }
        }
        Image {
            id:rigtIniImg
            mirror: true
            visible: false
            anchors.right: parent.right
            y:(singerRect.height-(implicitHeight))/(2 * ((singerRect.width - 966)/1243*0.5 +1))
            source: "/Resources/cherryPick/leftArrow.png"

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    leftIniImg.visible = true
                    rigtIniImg.visible = true
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    leftIniImg.visible = false
                    rigtIniImg.visible = false
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    if(singerRep.x >= 0)slideToAni.start()
                }
            }
        }

        NumberAnimation {
            id:slideToAni
            target: singerRep
            property: "x"
            duration: 500
            easing.type: Easing.InOutQuad
            from:singerRep.x < 0? 0 - 226 * singerRect.offset*2 - 40 : singerRep.x
            to:singerRep.x < 0? 0 : 0 - 226 * singerRect.offset*2 - 40
            alwaysRunToEnd: true
            onStopped:{
                rigtIniImg.enabled = singerRep.x === 0
                leftIniImg.enabled = !rigtIniImg.enabled
            }
        }
        Item{
            id:singerRect
            anchors.left: parent.left
            anchors.right: rigtIniImg.left
            height: 300 * (width-138)/1243 * 1.5
            anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
            clip: true
            property real offset : ((singerRect.width - 966)/1243*0.5 +1)
            Row{
                id:singerRep
                width: parent.width
                height: parent.height
                spacing: 20
                ListModel{
                    id:singDetailModel
                    ListElement{src:"/Resources/cherryPick/officalSing/pic1.png";gColor:"#ff937b5f";titleText:"欧美热播2004|和Aicia Keys重温2004流行经典";sing1:"1 REAL GANGSTALOVE";sing2:"2 Devuelve...";sing3:"3 Soy No"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic2.png";gColor:"#ff7c6362";titleText:"Waterbomb音乐节|夏日女王娜莲激情开唱";sing1:"1 POP1";sing2:"2 ABCD";sing3:"3 Love Count"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic3.png";gColor:"#ff468c9c";titleText:"K-Pop新歌到|The BOZY献声《浪漫这...";sing1:"1 Neverland";sing2:"2 123Music";sing3:"3 Soy No"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic4.png";gColor:"#ff31588d";titleText:"Air奖|澳洲宝藏歌手Jem Cassar-Daley获...";sing1:"1 King of disapointment";sing2:"2 And the rain";sing3:"3 Say ya"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic5.png";gColor:"#ff912d44";titleText:"Sumer Sonic|2024夏日之声再次临近";sing1:"1 恋";sing2:"2 不可逆";sing3:"3 他"}
                    ListElement{src:"/Resources/cherryPick/officalSing/pic6.png";gColor:"#ff4763a9";titleText:"Pentaport音乐节|韩国摇滚乐队Jannab嗨...";sing1:"1 We fell in love";sing2:"2 I loved you";sing3:"3 aha"}
                }
                Repeater{
                    model: singDetailModel
                    ZYYSingRectangle{
                        height:width+80
                        radius: 10
                        width: 226 * singerRect.offset
                        color: gColor
                    }
                }
            }
        }
    }
}
