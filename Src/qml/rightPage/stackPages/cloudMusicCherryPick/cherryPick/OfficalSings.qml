import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"

Item{
    anchors.left: parent.left
    anchors.right: parent.right
    height: 320
    Connections{
        target:BasicConfig
        function onFullScreen(){
            singerRep.x = 0
            leftIniImg.enabled = false
            rigtIniImg.enabled = false
        }
        function onNormalScreen(){
            singerRep.x = 0
            leftIniImg.enabled = true
            rigtIniImg.enabled = false
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
                    if(singerRep.x >= 0)slideToAni.start()
                }
            }
        }
        Image {
            id:rigtIniImg
            mirror: true
            visible: false
            enabled: false
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
                    if(singerRep.x < 0)slideToAni.start()
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
                leftIniImg.enabled = singerRep.x === 0
                rigtIniImg.enabled = !rigtIniImg.enabled
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
                    ListElement{gColor:"#ff937b5f";titleText:"欧美热播2004|和Aicia Keys重温2004流行经典";sing1:"1 REAL GANGSTALOVE";sing2:"2 Devuelve...";sing3:"3 Soy No"}
                    ListElement{gColor:"#ff7c6362";titleText:"Waterbomb音乐节|夏日女王娜莲激情开唱";sing1:"1 POP1";sing2:"2 ABCD";sing3:"3 Love Count"}
                    ListElement{gColor:"#ff468c9c";titleText:"K-Pop新歌到|The BOZY献声《浪漫这...";sing1:"1 Neverland";sing2:"2 123Music";sing3:"3 Soy No"}
                    ListElement{gColor:"#ff31588d";titleText:"Air奖|澳洲宝藏歌手Jem Cassar-Daley获...";sing1:"1 King of disapointment";sing2:"2 And the rain";sing3:"3 Say ya"}
                    ListElement{gColor:"#ff912d44";titleText:"Sumer Sonic|2024夏日之声再次临近";sing1:"1 恋";sing2:"2 不可逆";sing3:"3 他"}
                    ListElement{gColor:"#ff4763a9";titleText:"Pentaport音乐节|韩国摇滚乐队Jannab嗨...";sing1:"1 We fell in love";sing2:"2 I loved you";sing3:"3 aha"}
                }
                Repeater{
                    model: singDetailModel
                    Rectangle{
                        height:width+80
                        radius: 10
                        width: 226 * singerRect.offset
                        color: gColor
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                playImg.visible = true
                                bottomRect.height = parent.height - imgRect.height
                                bottomRect.endColor = gColor.replace(/ff/, "00")
                                showAni.start()
                                cursorShape = Qt.PointingHandCursor

                            }
                            onExited: {
                                closeAni.start()
                                playImg.visible = false
                                bottomRect.height = parent.height - imgRect.height
                                cursorShape = Qt.ArrowCursor
                            }

                        }

                        NumberAnimation {
                            id:showAni
                            target: bottomRect
                            property: "height"
                            duration: 200
                            from: 80
                            to:parent.height
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            id:closeAni
                            target: bottomRect
                            property: "height"
                            duration: 200
                            from: parent.height
                            to:80
                            easing.type: Easing.InOutQuad
                            onStopped: {
                                bottomRect.endColor = gColor
                            }
                        }
                        Rectangle{
                            id:imgRect
                            clip: true
                            width: parent.width
                            height: parent.width
                            radius: 10
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            Image {
                                anchors.fill: parent
                                source: `/Resources/cherryPick/officalSing/pic${index+1}.png`
                            }
                        }
                        Rectangle{
                            id:bottomRect
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: parent.height - imgRect.height
                            property string startColor : gColor
                            property string endColor: gColor
                            gradient: Gradient{
                                GradientStop{
                                    position: 0.8
                                    color: bottomRect.startColor
                                }
                                GradientStop{
                                    position: 0
                                    color: bottomRect.endColor
                                }
                            }
                            Image {
                                id:playImg
                                visible: false
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 10 * ((singerRect.width - 966)/1243*0.5 +1)
                                source: "/Resources/cherryPick/officalSing/play.png"
                            }
                            Label{
                                font.pixelSize: 15* ((singerRect.width - 966)/1243*0.5 +1)
                                color: "white"
                                width: parent.width-80
                                font.bold: true
                                font.family: BasicConfig.commFont
                                text: titleText
                                wrapMode: Text.WordWrap
                                anchors.left:parent.left
                                anchors.leftMargin: 10
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 10 * ((singerRect.width - 966)/1243*0.5 +1)
                            }
                        }

                    }
                }
            }
        }
    }
}
