import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import Qt5Compat.GraphicalEffects

import "./../basic"
import "../commonUI"
import "../title"

Rectangle{
    id:btnRoot
    property bool isSelected: false
    property bool hovered: false
    property string leftIcon: ""
    property string text: ""
    property string rightIcon: ""
    color: isSelected?"#e84f50":"transparent"
    onIsSelectedChanged: color = isSelected?"#e84f50":"transparent"
    Image {
        id: iconLeftImg
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        source: leftIcon
        layer.enabled:parent.isSelected || parent.hovered
        layer.effect:ColorOverlay{
            source: iconLeftImg
            color: "white"
        }
    }
    Label{
        id:textLabel
        text: txt
        color: "white"
        font.pixelSize: 20
        font.family: BasicConfig.commFont
        anchors.left: iconLeftImg.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }
    Image {
        id: iconRightImg
        anchors.left: textLabel.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        source: rightIcon
        layer.enabled:parent.isSelected || parent.hovered
        layer.effect:ColorOverlay{
            source: iconLeftImg
            color: btnRoot.isSelected?"white":"#e84f50"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                iconRightImg.layer.enabled = true
                cursorShape = Qt.PointingHandCursor
            }
            onExited: {
                iconRightImg.layer.enabled = false
                cursorShape = Qt.ArrowCursor
            }
        }
    }

}

