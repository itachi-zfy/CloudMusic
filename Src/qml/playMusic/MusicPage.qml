import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import Qt5Compat.GraphicalEffects

import "./../basic"
import "./../commonUI"
import "../title"
Rectangle{
    id:musicRoot
    width: parent.width
    height: parent.height
    x:0
    y:parent.height
    Behavior on y{NumberAnimation { duration: 200 }}
    gradient: Gradient{
        orientation: Gradient.Vertical
        GradientStop{position: 0;color:"#28333a"}
        GradientStop{position: 1;color:"#181c1f"}
    }
    // MouseArea{anchors.fill: parent}
    //收起与全屏
    Row{
        id:fullScreenRow
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 30
        anchors.leftMargin: 50
        spacing: 20
        Rectangle{
            width: 50
            height: 50
            radius: 5
            color: "#2d373d"
            border.width: 1
            border.color: "#3a4449"
            Label{
                anchors.centerIn: parent
                text: "∨"
                font.family: "黑体"
                font.pixelSize: 24
                color:"white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {musicRoot.y = musicRoot.parent.height}
            }
        }
        Rectangle{
            width: 50
            height: 50
            radius: 5
            color: "#2d373d"
            border.width: 1
            border.color: "#3a4449"
            Image{
                anchors.centerIn: parent
                source:"/Resources/playMusic/fullScreen.png"
            }
        }
    }
    //最小化&etc.
    MinAndMax{
        id:miniRow
        spacing: 15 * BasicConfig.wScale
        anchors.verticalCenter: fullScreenRow.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0.02 * window.width * BasicConfig.wScale//   50/2560 ≈ 0.02
    }
    //唱片
    Image{
        anchors.left: parent.left
        anchors.top: fullScreenRow.bottom
        scale: 0.6
        source: "qrc:/Resources/playMusic/bigRecord.png"
    }
    MusicPageBottom{}
}
