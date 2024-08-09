import QtQuick 2.15
import QtQuick.Controls 2.15
import "./../basic"
//分割线
Rectangle{
    id:cutLine
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom:parent.bottom
    anchors.rightMargin: window.width * (36 * BasicConfig.wScale / 1317)*2
    height: 1
    color: "#212127"
}
