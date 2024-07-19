import QtQuick 2.12
import QtQuick.Window 2.12
import "./Src/qml/basic"
import "./Src/qml/leftPage"
import "./Src/qml/rightPage"
Window {
    id:window
    width: 1317
    height: 933
    visible: true
    title: qsTr("CloudMusic")
    color: BasicConfig.mainBgColor
    flags: Qt.FramelessWindowHint // 设置无边框属性
    LeftPage{
        id:leftPage
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        color:BasicConfig.leftBgColor
        width: parent.width * BasicConfig.leftWScale
    }
    TopTitle{
        anchors.left: leftPage.right
        anchors.right: parent.right
        anchors.top: parent.top
        height: 80 * BasicConfig.hScale
    }
    //设置窗体可拖动
    MouseArea {
        id: dragRegion
        anchors.fill: parent
        property point clickPos: "0,0"//记录窗体拖动时鼠标点击的位置
        onPressed: {
            clickPos = Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: {
            // 鼠标偏移量
            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            window.x += delta.x
            window.y += delta.y
        }
    }
}
