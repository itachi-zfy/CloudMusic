import QtQuick 2.15
import QtQuick.Controls 2.15
import "./../basic"

Rectangle{
    id:root

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
        to:300 * ((root.parent.width - 966)/1243*0.5 +1)
        easing.type: Easing.InOutQuad
        onStarted: {
            singsCol.visible = true
            titLabel.anchors.bottomMargin = 10 * ((root.parent.width - 966)/1243*0.5 +1)
        }
    }
    NumberAnimation {
        id:closeAni
        target: bottomRect
        property: "height"
        duration: 200
        from: 300 * ((root.parent.width - 966)/1243*0.5 +1)
        to:80
        easing.type: Easing.InOutQuad
        onStarted: {
            singsCol.visible = false
            titLabel.anchors.bottomMargin = -50
        }
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
            source: src
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
            anchors.bottomMargin: 10 * ((root.parent.width - 966)/1243*0.5 +1)
            source: "/Resources/cherryPick/officalSing/play.png"
        }
        Label{
            id:titLabel
            font.pixelSize: 15* ((root.parent.width - 966)/1243*0.5 +1)
            color: "white"
            width: parent.width-80
            font.bold: true
            font.family: BasicConfig.commFont
            text: titleText
            wrapMode: Text.WordWrap
            anchors.left:parent.left
            anchors.leftMargin: 10
            anchors.bottom: singsCol.top
            anchors.bottomMargin: -50//10 * ((singerRect.width - 966)/1243*0.5 +1)
        }
        Column{
            id:singsCol
            anchors.left: titLabel.left
            anchors.right: titLabel.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            spacing: 5
            visible: false
            Label{
                text:sing1
                font.pixelSize: 12
                color:"white"
                font.family: BasicConfig.commFont
            }
            Label{
                text:sing2
                font.pixelSize: 12
                color:"white"
                font.family: BasicConfig.commFont
            }
            Label{
                text:sing3
                font.pixelSize: 12
                color:"white"
                font.family: BasicConfig.commFont
            }
        }
    }

}
