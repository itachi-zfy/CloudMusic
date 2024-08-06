import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../../../basic"
Item{
    objectName: "Pendant"
    Flow{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 30
        height: 80
        spacing: 10
        Repeater{
            id:selectorRep
            anchors.fill: parent
            model: ["推荐","世界名画","十二星座","MBTI","黑胶联名","网易游戏","学生专享","云村定制",
                "黑胶尊享","音乐热词","节日专属","趣味萌宠","影视","明星专属","城市"]
            property int selectedIndex : 0
            Rectangle{
                height: 40
                width: selectorLabel.implicitWidth + 30
                radius: 18
                border.width: 1
                color:selectorRep.selectedIndex === index ? "#24181c" : "transparent"
                border.color:selectorRep.selectedIndex === index ? "#331c1f" :  BasicConfig.fieldBgBordColor
                Label{
                    id: selectorLabel
                    text: modelData
                    font.pixelSize: 18
                    font.bold: true
                    font.family: BasicConfig.commFont
                    anchors.centerIn: parent
                    color:selectorRep.selectedIndex === index ? "#eb4d44" :  "white"
                }
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
                        selectorRep.selectedIndex = index
                    }
                }
            }
        }
    }

}
