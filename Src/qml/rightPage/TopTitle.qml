import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../basic"
Item {
    Row{
        spacing: 8
        anchors.verticalCenter: parent.verticalCenter
        Rectangle{
            width: 36 * BasicConfig.wScale
            height: 42 * BasicConfig.hScale
            radius: 4 * BasicConfig.wScale
            color: "transparent"
            border.color: BasicConfig.bordColor
            border.width: 1
            Image{
                scale: BasicConfig.wScale
                anchors.centerIn: parent
                source: "/Resources/title/arrow.png"
                layer.effect: true
                ColorOverlay{
                    source: parent
                    color: "red"
                }
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: {

                }
                onEntered: {

                }
                onClicked:{

                }
            }
        }
    }
}
