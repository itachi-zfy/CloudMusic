import QtQuick 2.15
import QtQuick.Controls 2.15
import "./../basic"
Item {
    id:checkBox
    property string text: ""
    property color textColor: "#ddd"
    property var textFormat: Text.AutoText
    property bool checked: false
    onCheckedChanged: rect.selected = checked
    width: 1
    height: 25
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = Qt.PointingHandCursor
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
        }
        onClicked: {
            rect.selected = !rect.selected
        }
    }
    Row{
        anchors.left:parent.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        Rectangle{
            id:rect
            width: 20
            height: width
            radius: 2
            border.width: 1
            border.color:checkBox.enabled? "#7a7a7f":"#2f2f34"
            color: selected?"#eb4d44":"transparent"
            property bool selected: false
            Label{
                id:selectedLabel
                visible: parent.selected
                color:"white"
                font.bold: true
                text: "√"
                font.pixelSize: 18
                font.family: BasicConfig.commFont
                anchors.centerIn: parent
            }
        }
        Label{
            id:label
            color:checkBox.enabled? checkBox.textColor:"#2f2f34"
            font.bold: true
            text: checkBox.text
            font.pixelSize: 18
            textFormat: checkBox.textFormat
            font.family: BasicConfig.commFont
            anchors.verticalCenter: rect.verticalCenter
        }
    }
}
