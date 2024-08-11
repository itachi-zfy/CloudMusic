/***************************************************************
*  @ProjName:   %{CurrentProject:MyCloudMusic}
*  @FileName:   BasicConfig.qml
*  @Author:     zfy1362021@163.com
*  @Date:       2024-08-02
*  @Brief:      全局单例qml文件，用来存放全局通用的组件属性信息
*
*---------------------------------------------------------------
*  ||擅长C++/Qt/Qml/Map/OpenGL/WebGis&PC/Andriod端应用程序开发，
*  ||复杂仿真程序开发 (学习交流加群：492954738)
****************************************************************/
pragma Singleton
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
QtObject{
    //全局只读属性
    readonly property real screenWidth: Screen.width
    readonly property real screenHeight: Screen.height
    readonly property color mainBgColor:"#13131a"                               //界面主背景颜色
    readonly property color leftBgColor:"#1a1a21"                               //左侧背景颜色
    readonly property color bordColor:"#2b2b31"                                 //矩形边框颜色
    readonly property color commGray : "#2d2d37"                                //通用灰
    readonly property color defaultFontNormalColor: "#a1a1a3"                   //文字正常状态下的默认颜色
    readonly property color defaultFontHoverColor: "white"                      //当鼠标悬浮上去的时候文字的颜色
    readonly property color fieldBgBordColor: "#303037"                         //输入文本框当中的背景边框色
    readonly property color fieldBgColor: "#222"                                //输入文本框当中的背景色
    readonly property color fieldTextColor: "#d9d9da"                           //输入文本框中的默认字体颜色
    readonly property string commFont: "微软雅黑 Light"                          //通用默认字体
    // readonly property real leftWScale  : 255/1300                            //左侧宽占比
    readonly property real wScale : Screen.width/1920                           //控件横向缩放级数
    readonly property real hScale : Screen.height/1080                          //控件纵向缩放级数
    property bool playFlagState: true                                           //设置界面颜色选择窗口是否是播放
    property color finishedLyricsUpColor: "#ee8784"                             //已播放歌词的上渐变颜色
    property color finishedLyricsDownColor: "#f3b3b1"                           //已播放歌词的下渐变颜色
    property color finishedLyricsBorderColor: "#ffff91"                         //已播放歌词的边框颜色
    property color unFinishedLyricsUpColor: "white"                           //未播放歌词的上渐变颜色
    property color unFinishedLyricsDownColor: "#ddd"                           //未播放歌词的下渐变颜色
    property color unFinishedLyricsBorderColor: "white"                       //未播放歌词的边框颜色
    signal blankAreaClicked()                                                   //窗口空白区域被点击
    signal openLoginPopup()                                                     //打开扫码登录弹窗
    signal openLoginByOtherMeansPopup()                                         //打开其他方式登录的弹窗
    signal closeLoginPopup()                                                    //打开扫码登录弹窗
    signal closeLoginByOtherMeansPopup()                                        //打开其他方式登录的弹窗
    signal openColorSelectPopup()                                               //打开颜色选择的弹窗
    signal closeColorSelectPopup()                                              //打开颜色选择的弹窗
    Component.onCompleted: {
        console.log(`===============================================
        当前屏幕分辨率是${Screen.width}x${Screen.height}
====================================================\n`)
    }
}
