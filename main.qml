import QtQuick 2.12
import QtQuick.Window 2.12
import "./Src/qml/basic"
import "./Src/qml/leftPage"
import "./Src/qml/commonUI"
import "./Src/qml/rightPage"
import "./Src/qml/playMusic"
import "./Src/qml/mianPopups"
import "./Src/js/MainEvents.js" as MainEvents
ZYYWindow {
    id:window
    width: 1317
    height: 933
    visible: true
    title: "ZYYCloudMusic"
    bgColor: BasicConfig.mainBgColor
    //处理全局信号事件
    Connections{
        id:globalEventDeal
        target: BasicConfig
        function onOpenLoginPopup(){loginPopup.open()}
        function onOpenLoginByOtherMeansPopup(){loginByOtherMeansPopup.open()}
        function onOpenColorSelectPopup(){colorAdjustWindow.open()}
        function onCloseLoginPopup(){loginPopup.close()}
        function onCloseLoginByOtherMeansPopup(){loginByOtherMeansPopup.close()}
        function onCloseColorSelectPopup(){colorAdjustWindow.close()}
    }

    //用于坐标映射到windows
    Item {
        id: positionMapItem
        anchors.fill: parent
    }

    //扫码登录弹窗
    LoginPopup{
        id:loginPopup
        anchors.centerIn: parent
    }

    //其他方式登录的弹窗
    LoginByOtherMeansPopup{
        id:loginByOtherMeansPopup
        anchors.centerIn: parent
    }


    //可拖动颜色选择弹窗
    ZYYColorAdjustWindow{
        id:colorAdjustWindow
        MouseArea{
            anchors.top:parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50 * BasicConfig.hScale
            anchors.rightMargin: 100 * BasicConfig.wScale
            property point clickedPos: "0,0"
            onPressed: clickedPos = Qt.point(mouse.x, mouse.y)
            onPositionChanged: {
                // MainEvents.colorAdjustMoveEvent(mouseX,mouseY)
                var delta = Qt.point(mouse.x - clickedPos.x, mouse.y - clickedPos.y)
                colorAdjustWindow.x += delta.x
                colorAdjustWindow.y += delta.y
                // window.positionChanged(mouseX,mouseY)
            }
        }
    }

    //左边页面
    LeftPage{
        id:leftPage   
        width: 255
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        color:BasicConfig.leftBgColor
    }

    //右侧页面
    RightPage{
        anchors.left: leftPage.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
    //底部
    PlayMusic{
        onOpenMusicPage:{
            musicPage.y = 0
        }
    }
    //音乐界面
    MusicPage{
        id:musicPage
    }

}
