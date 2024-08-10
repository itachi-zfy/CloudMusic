import QtQuick 2.15
import QtQuick.Controls 2.15
import "./../basic"
Item {
    id:vipItemRoot
    property string text: "VIP开通"
    property color outerCircleColor : "#dadada"
    property color innerCircleColor : "#cecece"
    property color rightRectColor: "#dadada"
    property color textColor: "#f8f9f9"
    Rectangle{
        id:vipRect
        radius: 6 * BasicConfig.wScale
        width: parent.width
        height:12 * BasicConfig.wScale
        color: vipItemRoot.rightRectColor
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        Label{
            text: vipItemRoot.text
            anchors.left: parent.left
            anchors.leftMargin: parent.radius*2 + 5
            color:vipItemRoot.textColor
            font.pixelSize: parent.height/2 + 2
            font.family: BasicConfig.commFont
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    //背景色边框矩形
    Rectangle{
        id:bgBordRect
        width: vipRect.height + 4
        height: width
        radius: width/2
        color: BasicConfig.mainBgColor
        anchors.verticalCenter: parent.verticalCenter
        Rectangle{
            id:r1
            anchors.fill: parent
            anchors.margins: 1
            radius: width/2
            color: vipItemRoot.outerCircleColor
            anchors.centerIn: parent
            Rectangle{
                id:r2
                anchors.fill: parent
                anchors.margins: 4 * BasicConfig.wScale
                radius: width/2
                color: vipItemRoot.innerCircleColor
                anchors.centerIn: parent
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            window.openLoginPopup()
        }
    }
}
