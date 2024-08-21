import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"

Item {
    anchors.left: parent.left
    anchors.right: parent.right
    height: 400
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
        text:"最新音乐>"
        font.bold: true
        color: "white"
        font.family: "黑体"
        font.pixelSize: 24
        anchors.left: parent.left
        anchors.top: parent.top
        // anchors.topMargin: -20
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
            }
        }

    }
}
