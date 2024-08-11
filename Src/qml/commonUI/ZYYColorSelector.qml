import QtQuick 2.15
import "./../basic"
Rectangle{
    id:colorSelectRoot
    radius: 15
    border.width: 1
    border.color: "#28282e"
    color: "#1a1a20"
    property string text: "已播放"

    Rectangle{
        id:colorRect
        width: parent.height/2
        height: width
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        gradient: Gradient {
            GradientStop { position: 0; color: colorSelectRoot.text === "已播放" ? BasicConfig.finishedLyricsUpColor:BasicConfig.unFinishedLyricsUpColor  }
            GradientStop { position: 1; color: colorSelectRoot.text === "已播放" ? BasicConfig.finishedLyricsDownColor:BasicConfig.unFinishedLyricsDownColor  }
        }
    }
    Text {
        color:"#ddd"
        text: parent.text
        font.pixelSize: 20
        anchors.left: colorRect.right
        anchors.leftMargin: 10
        font.family:  BasicConfig.commFont
        anchors.verticalCenter: colorRect.verticalCenter
    }

}
