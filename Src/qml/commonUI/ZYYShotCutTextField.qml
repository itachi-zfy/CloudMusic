import QtQuick 2.15
import QtQuick.Controls 2.15
import "./../basic"
TextField {
    id:textField
    signal keyPressed(string key)
    color: "#ddd"
    readOnly: true
    font.pixelSize: 20
    cursorVisible: true
    font.family: BasicConfig.commFont
    Keys.onPressed: {
        if(!focus)return
        let str = ""
        if (event.modifiers & Qt.ControlModifier) {
            str += "Ctrl + "
        }
        if (event.modifiers & Qt.ShiftModifier) {
            str += "Shift + "
        }
        if (event.modifiers & Qt.AltModifier) {
            str += "Alt + "
        }
        str += String.fromCharCode(event.key)
        keyPressed(str)
    }
    Connections{
        target: BasicConfig
        function onBlankAreaClicked(){focus = false}
    }
    background: Rectangle{
        color: BasicConfig.fieldBgColor
        border.width: 1
        border.color: textField.focus?"#333" : BasicConfig.fieldBgBordColor
        anchors.fill: parent
        radius: height/2
        //只读情况下光标是不出现的，因此以这种方式模拟光标
        Rectangle{
            id:focusRect
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 8
            anchors.bottomMargin: 8
            width: 1
            visible: textField.focus
            anchors.leftMargin: textField.implicitWidth
        }
        SequentialAnimation{
            id:focusAnimation
            running: textField.focus
            loops: Animation.Infinite
            PropertyAnimation {
                target: focusRect
                property: "opacity"
                from:1
                to:0
                duration: 250
            }

            PropertyAnimation {
                target: focusRect
                property: "opacity"
                from:0
                to:1
                duration: 250
            }
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                cursorShape = Qt.IBeamCursor
            }
            onExited: {
                cursorShape = Qt.Arrow1Cursor
            }
            onPressed: {
                parent.border.color = "#333"
                mouse.accepted = false
            }
        }
    }

}
