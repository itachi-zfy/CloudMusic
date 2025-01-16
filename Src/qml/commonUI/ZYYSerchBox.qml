import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import Qt5Compat.GraphicalEffects

import "../basic"
TextField{
    id:searchTextField
    color:"white"
    placeholderText:"晴天"
    font.pixelSize: 16 * BasicConfig.wScale
    font.family: BasicConfig.commFont
    placeholderTextColor:BasicConfig.commGray
    background: Item{
        anchors.fill: parent
        //边框渐变
        Rectangle{
            id:searchBoxBordLine
            anchors.fill: parent
            radius:8
            property real gradientStopPos: 1                //渐变终点位置
            gradient:Gradient{
                orientation:Gradient.Horizontal             //.pro文件中要加上QT += qml,否则没有这个属性
                GradientStop{color: "#21283d";position:0}
                GradientStop{color: "#382635";position:searchBoxBordLine.gradientStopPos}
            }
        }

        //框体渐变
        Rectangle{
            id:searchBox
            anchors.fill: parent
            anchors.margins: 1
            radius:8
            property real gradientStopPos: 1                //渐变终点位置
            gradient:Gradient{
                orientation:Gradient.Horizontal             //.pro文件中要加上QT += qml,否则没有这个属性
                GradientStop{color: "#1a1d29";position:0}
                GradientStop{color: "#241c26";position:searchBox.gradientStopPos}
            }
            Image{
                id:searchIcon
                scale:0.7
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 16 * BasicConfig.wScale * scale
                source: "/Resources/title/search.png"
            }
        }
        MouseArea{
            anchors.fill: parent
            onPressed: {
                searchBox.gradientStopPos = 0
                mouse.accepted = false
                searchPop.open()
            }
        }
    }
    onFocusChanged: {
        if(!focus)searchBox.gradientStopPos = 1
    }

}
