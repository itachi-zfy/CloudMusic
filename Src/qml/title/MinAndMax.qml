import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import Qt5Compat.GraphicalEffects

import "./../basic"
import "./../commonUI"

Row{
    id:miniRow
    //MINI
    Image{
        id:miniImg
        anchors.verticalCenter: parent.verticalCenter
        source: "/Resources/title/mini.png"
        layer.enabled: false
        layer.effect: ColorOverlay{
            source: miniImg
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onExited: {
                parent.layer.enabled = false
            }
            onEntered: {
                parent.layer.enabled = true
            }
            onClicked: {

            }
        }
    }
    //最小化
    Item{
        width: miniImg.implicitWidth
        height: miniImg.implicitHeight
        anchors.verticalCenter: parent.verticalCenter
        Rectangle{
            id:minRect
            height: 2
            width: 20
            color:"#75777f"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                minRect.color = "white"
            }
            onExited: {
                minRect.color = "#75777f"
            }
            onClicked: {
                console.log("最小化")
                window.showMinimized()

            }
        }
    }
    //最大化
    Rectangle{
        width: 20
        height: width
        radius: 2
        border.width: 1
        color:"transparent"
        border.color:"#75777f"
        anchors.verticalCenter: parent.verticalCenter
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.border.color = "white"
            }
            onExited: {
                parent.border.color = "#75777f"
            }
            onClicked: {
                // // // // // // // // // // // // // // // // // // //
                // if (window.windowState === Qt.WindowMaximized) {
                //     window.showNormal()
                // } else {
                //     window.showMaximized()
                // }
                //注意此处不能用showMaximized
                //据网络相关的issue分析：其根本原因是“失焦”
                //可能原因：
                //1、Windows对全屏窗口有特殊的处理，跟常规窗口不同。
                //2、Qt Quick使用硬件加速，据说在Windows是基于GLFW实现，这里面有些奇怪的feature，似乎是全屏窗口失焦时会停止渲染。
                //3、与Windows系统合成器对全屏OpenGL窗口的特殊处理有关。
                //最终，仍然没有明确的原因。
                //（因为不明确引发该问题的根本原因，因此只有规避措施）
                //目前的主流规避手段就是，不要设置真全屏窗口，要假全屏。即设置程序的显示大小，不要刚好等于屏幕大小。
                // // // // // // // // // // // // // // // // // // //
                if(window.width === BasicConfig.screenWidth-1){
                    window.width = 1317
                    window.height = 933
                    window.x = (BasicConfig.screenWidth - window.width)/2
                    window.y = (BasicConfig.screenHeight - window.height)/2
                    BasicConfig.normalScreen()
                    BasicConfig.isFullScreen = false
                }else{
                    window.x = 0
                    window.y = 0
                    window.width = BasicConfig.screenWidth-1
                    window.height = BasicConfig.screenHeight-1
                    BasicConfig.fullScreen()
                    BasicConfig.isFullScreen = true
                }
            }
        }
    }
    //关闭
    Image{
        id:closeImg
        anchors.verticalCenter: parent.verticalCenter
        source: "/Resources/title/close.png"
        layer.enabled: false
        layer.effect: ColorOverlay{
            source: closeImg
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onExited: {
                parent.layer.enabled = false
            }
            onEntered: {
                parent.layer.enabled = true
            }
            onClicked: {
                Qt.quit()
            }
        }
    }
}

