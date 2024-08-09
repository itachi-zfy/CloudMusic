import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../../basic"
import "../../../commonUI"
Item {
    anchors.left: parent.left
    anchors.right: parent.right
    height: 150
    Label{
        id: sysTitleLabel
        text: "系统"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }
    //定时关闭
    Item{
        id:timerCloseItems
        anchors.left: sysTitleLabel.right
        anchors.right: parent.right
        anchors.top: sysTitleLabel.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 100
        Column{
            spacing: 20
            anchors.fill: parent
            ZYYCheckBox{
                id:sysCbx
                width: 100
                height: 30
                textColor: "white"
                anchors.left: parent.left
                text: "开启定时关闭软件"
            }
            Row{
                spacing: 10
                anchors.left: parent.left
                Label{
                    text: "剩余关闭时间"
                    font.pixelSize: 18
                    font.bold: true
                    font.family: "黑体"
                    color:"white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                ZYYComboBox{
                    text: "0"
                    height: 30
                    width: 150
                    model: ListModel{}
                    anchors.verticalCenter: parent.verticalCenter
                    Component.onCompleted: {
                        for(let i = 0;i<24;i++)model.append({modelData:String(i)})
                    }

                }
                Label{
                    text: "小时"
                    font.pixelSize: 18
                    font.bold: true
                    font.family: "黑体"
                    color:"white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                ZYYComboBox{
                    text: "0"
                    height: 30
                    width: 150
                    model: ListModel{}
                    anchors.verticalCenter: parent.verticalCenter
                    Component.onCompleted: {
                        for(let i = 0;i<60;i++)model.append({modelData:String(i)})
                    }
                }
                Label{
                    text: "分钟"
                    font.pixelSize: 18
                    font.bold: true
                    font.family: "黑体"
                    color:"white"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                }

            }
            ZYYCheckBox{
                id:sysShutDownCbx
                width: 100
                height: 30
                textColor: "white"
                anchors.left: parent.left
                enabled: false
                text: "关闭软件同时关机"
            }
        }
    }
    //单选按钮互斥组
    ExclusiveGroup {id:closePanExclusiveGroup}
    //关闭主面板
    Row{
        anchors.left: timerCloseItems.left
        anchors.top: timerCloseItems.bottom
        spacing: 30
        Label{
            text: "关闭主面板"
            font.pixelSize: 20
            font.bold: true
            font.family: "黑体"
            color:"white"
        }
        RadioButton{
            height: 25
            width: 155
            text: "最小化到系统托盘"
            exclusiveGroup: closePanExclusiveGroup
            style: RadioButtonStyle {
                indicator: Rectangle {
                    implicitWidth: 24;
                    implicitHeight: 24;
                    radius: 12;
                    color:"transparent"
                    border.color:control.checked?"#eb4d44" : ( control.hovered ? "white":"#707074");                    border.width: 1;
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
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    text: control.text;
                }
            }
        }
        RadioButton{
            height: 25
            width: 125
            text: "退出云音乐"
            exclusiveGroup: closePanExclusiveGroup
            style: RadioButtonStyle {
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
                    text: control.text;
                }
            }
        }
    }
}
