import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "./../basic"

Item {
    id:zyyRadioButtonRoot
    height: 25
    width: 155
    property bool enabledState: true
    property string contentText
    property bool checked: false
    property bool showIcon: false
    property string vipText: "VIP开通"
    property color outerCircleColor : "#dadada"
    property color innerCircleColor : "#cecece"
    property color rightRectColor: "#dadada"
    property color textColor: "#f8f9f9"
    property ExclusiveGroup exclusiveGroup
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape = parent.enabledState?Qt.PointingHandCursor:Qt.ForbiddenCursor
        }
        onExited: {
            cursorShape = Qt.ArrowCursor
        }
    }
    Component{
        id:radioButtonStyle
        RadioButtonStyle {
            indicator: Rectangle {
                implicitWidth: 24
                implicitHeight: 24
                radius: 12
                color:"transparent"
                border.color:control.checked?(zyyRadioButtonRoot.enabledState?"#eb4d44":
                                            (control.hovered ?"transparent":"#532426")) :
                                            (zyyRadioButtonRoot.enabledState?
                                            (control.hovered ?"white" :"#707074"):"#707074")
                border.width: 1
                Rectangle {
                    anchors.fill: parent
                    visible: control.checked
                    color: zyyRadioButtonRoot.enabledState?"#eb4d44":"#532426"
                    radius: width/2
                    anchors.margins: 5
                }
            }
            label: Text {
                color:zyyRadioButtonRoot.enabledState?"#ddd":"#707074"
                font.pixelSize: 18
                font.family: "黑体"
                verticalAlignment: Text.AlignVCenter
                height: zyyRadioButtonRoot.height
                width: implicitWidth
                text: control.text
                ZYYVipIconItem{
                    width: 50
                    height: 20
                    visible: zyyRadioButtonRoot.showIcon
                    anchors.left: parent.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    outerCircleColor: zyyRadioButtonRoot.outerCircleColor
                    innerCircleColor: zyyRadioButtonRoot.innerCircleColor
                    rightRectColor: zyyRadioButtonRoot.rightRectColor
                    textColor: zyyRadioButtonRoot.textColor
                    text:zyyRadioButtonRoot.vipText
                }
            }
            spacing:10
        }
    }
    RadioButton{
        id:radioBtn
        anchors.fill: parent
        text: contentText
        style: radioButtonStyle
        checked: parent.checked
        exclusiveGroup: parent.exclusiveGroup
    }


}
