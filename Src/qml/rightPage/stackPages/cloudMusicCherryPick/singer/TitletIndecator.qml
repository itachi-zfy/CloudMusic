import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"
Item{
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: 180
    ZYYTitleIndicator{
        id:topIndicator
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 30
        height: 60
        spacing: 10
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        indicatorModel: ["全部","华语","欧美","日本","韩国","其他"]
        type: 0
    }
    ZYYTitleIndicator{
        id:bottomIndicator
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topIndicator.bottom
        height: 60
        spacing: 10
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        indicatorModel: ["全部","男歌手","女歌手","乐队组合"]
        type: 0
    }
    ZYYTitleIndicator{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: bottomIndicator.bottom
        height: 60
        spacing: -10
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        indicatorModel: ["热门","|","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]
        type: 1
    }

}
