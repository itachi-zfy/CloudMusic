import QtQuick 2.15
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.1
import QtQuick.Controls 2.15
import "./../basic"

Popup {
    id:rectPop
    width: 600
    height: 400
    modal: true
    x:(parent.width - width)/2
    y:(parent.height - height)/2
    closePolicy: Popup.NoAutoClose
    onOpened: {
        privateObj.upColor=BasicConfig.playFlagState        ?  BasicConfig.finishedLyricsUpColor    : BasicConfig.unFinishedLyricsUpColor
        privateObj.downColor=BasicConfig.playFlagState      ?  BasicConfig.finishedLyricsDownColor  : BasicConfig.unFinishedLyricsDownColor
        privateObj.borderColor=BasicConfig.playFlagState    ?  BasicConfig.finishedLyricsBorderColor: BasicConfig.unFinishedLyricsBorderColor
    }
    QtObject{
        id:privateObj
        property int index: 0
        property color upColor: BasicConfig.playFlagState ?  BasicConfig.finishedLyricsUpColor : BasicConfig.unFinishedLyricsUpColor
        property color downColor: BasicConfig.playFlagState ?  BasicConfig.finishedLyricsDownColor : BasicConfig.unFinishedLyricsDownColor
        property color borderColor: BasicConfig.playFlagState ?  BasicConfig.finishedLyricsBorderColor : BasicConfig.unFinishedLyricsBorderColor
    }
    ColorDialog{
        id:colordialog
        title: `选择颜色`
        onAccepted:{
            if(privateObj.index === 0){
                privateObj.upColor = color
            }else if(privateObj.index === 1){
                privateObj.downColor = color
            }else if(privateObj.index === 2){
                privateObj.borderColor = color
            }
        }
    }
    background: Rectangle{
        radius: 20
        color:"#2d2d37"
        anchors.fill: parent
        //关闭按钮
        Image{
            scale: 1.5
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 30
            anchors.rightMargin: 30
            source: "/Resources/title/close.png"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    rectPop.close()
                }
            }
        }

        //标题
        Label{
            id:titleLabel
            text: `更改⌈${BasicConfig.playFlagState ? "已播放" : "未播放"}⌋配色方案`
            color:"#ddd"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 80
            font.bold: true
            font.family: "黑体"
            font.pixelSize: 32
        }
        //三种渐变色
        Row{
            id:colorSetRow
            anchors.top:titleLabel.bottom
            anchors.topMargin: 60
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30
            Rectangle{
                id:previewRect
                width: 50
                height: 50
                radius: 6
                border.width:1
                border.color:privateObj.borderColor
                gradient: Gradient {
                    GradientStop { position: 0; color: privateObj.upColor }
                    GradientStop { position: 1; color: privateObj.downColor  }
                }
            }
            Repeater{
                model: ["渐变上","渐变下","描边"]
                Rectangle{
                    width: 130
                    height: 50
                    radius: parent.height/2
                    border.width: 1
                    border.color: "#28282e"
                    color: "#34343d"
                    Item{
                        anchors.centerIn: parent
                        width: 80
                        height: 25
                        Row{
                            anchors.centerIn: parent
                            spacing: 3
                            Rectangle{
                                width: 20
                                height: width
                                radius: 2
                                color:index === 0 ? privateObj.upColor :
                                                    (index === 1 ? privateObj.downColor  :
                                                                   privateObj.borderColor)
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Label{
                                text: modelData
                                font.pixelSize: 20
                                font.family: BasicConfig.commFont
                                color:"#ddd"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            privateObj.index = index
                            colordialog.open()
                        }
                    }
                }
            }
        }

        //确认按键
        Rectangle{
            id:sureBtn
            height: 50
            width: 150
            anchors.top: colorSetRow.bottom
            anchors.topMargin: 50
            radius:height/2
            anchors.horizontalCenter:colorSetRow.horizontalCenter
            gradient: Gradient{
                orientation: Gradient.Horizontal
                GradientStop{
                    color: "#e93b63"
                    position: 0
                }
                GradientStop{
                    color: "#e84f50"
                    position: 1
                }
            }
            Label{
                color:"white"
                text: "确认"
                font.pixelSize: 24
                font.bold: true
                font.family: BasicConfig.commFont
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    sureBtn.opacity = 0.8
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    sureBtn.opacity = 1
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    if(BasicConfig.playFlagState){
                        BasicConfig.finishedLyricsUpColor    = privateObj.upColor
                        BasicConfig.finishedLyricsDownColor  = privateObj.downColor
                        BasicConfig.finishedLyricsBorderColor= privateObj.borderColor
                    }else{
                        BasicConfig.unFinishedLyricsUpColor    = privateObj.upColor
                        BasicConfig.unFinishedLyricsDownColor  = privateObj.downColor
                        BasicConfig.unFinishedLyricsBorderColor= privateObj.borderColor
                    }
                    rectPop.close()
                }
            }

        }
    }

}
