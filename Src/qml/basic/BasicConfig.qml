pragma Singleton
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
QtObject{
    readonly property color mainBgColor:"#13131a"                               //界面主背景颜色
    readonly property color leftBgColor:"#1a1a21"                               //左侧背景颜色
    readonly property color bordColor:"#2b2b31"                                 //矩形边框颜色
    readonly property string commFont: "微软雅黑 Light"                          //通用默认字体
    readonly property real leftWScale  : 255/1300                               //左侧宽占比
    readonly property real wScale : Screen.desktopAvailableWidth/1080           //控件横向缩放级数
    readonly property real hScale : Screen.desktopAvailableHeight/1080          //控件纵向缩放级数
}
