/***************************************************************
*  @ProjName:   %{CurrentProject:MyCloudMusic}
*  @FileName:   ZYYWindow.qml
*  @Author:     zfy1362021@163.com
*  @Date:       2024-08-04
*  @Brief:      无边框可拖动窗口
*
*---------------------------------------------------------------
*  ||擅长C++/Qt/Qml/Map/OpenGL/WebGis PC/Andriod端应用程序开发，
*  ||复杂仿真程序开发 (学习交流加群：492954738)
****************************************************************/
import QtQuick 2.12
import QtQuick.Window 2.12
import "../../qml/basic"
Window {
    id:window
    color: "transparent"
    property color bgColor
    flags: Qt.FramelessWindowHint | Qt.Window | Qt.WindowSystemMenuHint |
           Qt.WindowMaximizeButtonHint | Qt.WindowMinimizeButtonHint            //设置无边框属性
    signal positionChanged(real _x, real _y)

    //圆角边框窗口
    Rectangle{
        anchors.fill: parent
        color: bgColor
        radius: 10
    }
    //设置窗体可拖动,此层级必须在最顶层，不然会覆盖其子项的鼠标事件
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
            window.positionChanged(mouseX,mouseY)
        }
        onClicked: BasicConfig.blankAreaClicked()
    }
}
