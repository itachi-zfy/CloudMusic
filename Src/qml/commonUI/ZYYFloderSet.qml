import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.1
import "./../basic"
import "./../commonUI"

Item {
    id:floderItemRoot
    signal getPath(string path)
    property string text
    property var textFormat: Text.AutoText
    Label{
        id: downCataLabel
        textFormat: floderItemRoot.textFormat
        text: floderItemRoot.text
        anchors.left: parent.left
        color:"white"
        font.pixelSize: 20
        font.family: "黑体"
    }
    Label{
        id: cataLabel
        text: "C:\\CloudMusic"
        font.pixelSize: 20
        font.family: "黑体"
        width: 200
        anchors.left: downCataLabel.left
        anchors.top: downCataLabel.bottom
        anchors.topMargin: 20
        color:"white"
        elide: Text.ElideRight
    }
    Rectangle{
        id:openFloderRect
        height: 30
        width: 100
        radius: 15
        anchors.left: cataLabel.right
        anchors.leftMargin: (cataLabel.implicitWidth > 200 ? 200 : cataLabel.implicitWidth) - cataLabel.width + 20
        anchors.verticalCenter: cataLabel.verticalCenter
        color: "transparent"
        border.width: 1
        border.color: BasicConfig.fieldBgBordColor
        Label{
            text: "更改目录"
            font.pixelSize: 20
            font.family: "黑体"
            anchors.centerIn: parent
            anchors.topMargin: 20
            color:"white"

        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.color = BasicConfig.commGray
                cursorShape = Qt.PointingHandCursor
            }
            onExited: {
                parent.color = "transparent"
                cursorShape = Qt.ArrowCursor
            }
            onClicked:{
                folderDialog.open();
            }
        }
    }
    FolderDialog{
        id:folderDialog
        onAccepted: {
            let s = String(folderDialog.currentFolder)
            let str = s.slice(8,s.length)
            floderItemRoot.getPath(str)
            cataLabel.text = str
            openFloderRect.anchors.leftMargin = (cataLabel.implicitWidth > 200 ? 200 : cataLabel.implicitWidth) - cataLabel.width + 20
        }
    }
}
