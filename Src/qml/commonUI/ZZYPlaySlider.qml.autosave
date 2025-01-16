import QtQuick 2.15
import QtQuick.Controls 2.15
import "../basic"
Rectangle{
    id:progressSlider
    color: '#4d4d56'
    height: 8
    radius: height/2
    property real value: 0.1
    Label{
        id:currentTimeLabel
        text: '02:02'
        color: "white"
        font.pixelSize: 12
        font.family: '黑体'
        anchors.right: progressSlider.left
        anchors.rightMargin: 5
        anchors.verticalCenter: progressContentRect.verticalCenter
    }
    Label{
        id:maxTimeLabel
        text: '03:52'
        color: "white"
        font.pixelSize: 12
        font.family: '黑体'
        anchors.left: progressSlider.right
        anchors.leftMargin: 5
        anchors.verticalCenter: progressContentRect.verticalCenter
    }
    Rectangle{
        id:progressContentRect
        anchors.left: parent.left
        anchors.top: parent.top
        radius: height/2
        anchors.bottom: parent.bottom
        color:'#b94d51'
        width: progressSlider.width * progressSlider.value
    }
    Rectangle{
        id:currentPosRect
        height: parent.height+ 6
        width: height
        radius: width/2
        visible: false
        anchors.right: progressContentRect.right
        anchors.rightMargin: -width/2
        anchors.verticalCenter: progressContentRect.verticalCenter
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            currentPosRect.visible = true
            progressContentRect.color = '#e84f50'
            cursorShape = Qt.PointingHandCursor
        }
        onExited: {
            currentPosRect.visible = false
            progressContentRect.color = '#b94d51'
            cursorShape = Qt.ArrowCursor
        }
        onPositionChanged: {
            if(pressed){
                currentPosRect.visible = true
                progressContentRect.color = '#e84f50'
                let v = mouseX/progressSlider.width
                progressSlider.value = v>=1?1:(v<=0?0:v)
            }
        }
        onClicked: {
            let v = mouseX/progressSlider.width
            progressSlider.value = v>=1?1:(v<=0?0:v)
        }
    }
}
