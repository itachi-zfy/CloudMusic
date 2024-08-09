import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "./../basic"

Item {
    id:zyyRadioButtonRoot
    height: 25
    width: 155
    property string contentText
    property bool checked: false
    property ExclusiveGroup exclusiveGroup
    Component{
        id:radioButtonStyle
        RadioButtonStyle {
            indicator: Rectangle {
                implicitWidth: 24;
                implicitHeight: 24;
                radius: 12;
                color:"transparent"
                border.color:control.checked?"#eb4d44" : ( control.hovered ?"white" :"#707074");
                border.width: 1;
                Rectangle {
                    anchors.fill: parent;
                    visible: control.checked;
                    color: "#eb4d44";
                    radius: width/2;
                    anchors.margins: 5;
                }
            }
            label: Text {
                color:"#707074"
                font.pixelSize: 18
                font.family: "黑体"
                verticalAlignment: Text.AlignVCenter
                height: zyyRadioButtonRoot.height
                width: zyyRadioButtonRoot.width
                text: control.text
            }
            spacing:10
        }
    }
    RadioButton{
        anchors.fill: parent
        text: contentText
        style: radioButtonStyle
        checked: parent.checked
        exclusiveGroup: parent.exclusiveGroup
    }
}
