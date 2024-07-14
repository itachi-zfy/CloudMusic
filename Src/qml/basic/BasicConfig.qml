pragma Singleton
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
QtObject{
    readonly property color mainBgColor:"#13131a"                               //界面主背景颜色
    readonly property color leftBgColor:"#1a1a21"                               //左侧背景颜色
    readonly property real leftWScale  : 255/1300                               //左侧宽占比
    readonly property real wScale : Screen.desktopAvailableWidth/1080       //控件横向缩放级数
    readonly property real hScale : Screen.desktopAvailableHeight/1080      //控件纵向缩放级数
}
