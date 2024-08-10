import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Slider {
    id: slider
    width: 200
    minimumValue:0
    maximumValue:10

    style: SliderStyle {
        groove: Rectangle {
            color: "#2b2b30"
            height: control.height / 2
            width: control.width
            radius: height/2
            clip: true
            Rectangle{
                color: "#eb4d44"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                width: parent.width * slider.value/slider.maximumValue
            }
        }
    }
}
