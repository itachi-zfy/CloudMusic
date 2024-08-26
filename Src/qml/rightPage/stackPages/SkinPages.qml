import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../basic"
Item{
    objectName: "SkinPage"
    //个性皮肤、头像挂件
    Row{
        id:skinTitleRow
        anchors.top:parent.top
        anchors.topMargin: 20 * BasicConfig.hScale
        anchors.left: parent.left
        anchors.leftMargin: 36 * BasicConfig.wScale
        spacing: 20 * BasicConfig.wScale
        Repeater{
            id:skinTitleRep
            model: 2
            property int selectedIndex: 0
            Item{
                width: 90 * BasicConfig.wScale
                height: 40 * BasicConfig.hScale
                Label{
                    id:loginText
                    text: index?"头像挂件":"个性皮肤"
                    color:index === skinTitleRep.selectedIndex?"white":"#9c9ea3"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: index === skinTitleRep.selectedIndex
                    font.family: "黑体"
                    font.pixelSize: 28
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape = ((index === skinTitleRep.selectedIndex)? Qt.ArrowCursor:Qt.PointingHandCursor)
                        }
                        onExited: {
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            skinTitleRep.selectedIndex = index
                            if(skinTitleRep.selectedIndex === 0){
                                if(skinStackView.currentItem.objectName !== "Skin"){
                                    skinStackView.push("/Src/qml/rightPage/stackPages/skinPages/SkinPage.qml")
                                }
                            }else if(skinTitleRep.selectedIndex === 1){
                                if(skinStackView.currentItem.objectName !== "Pendant"){
                                    skinStackView.push("/Src/qml/rightPage/stackPages/skinPages/PendantPage.qml")
                                }
                            }
                            //存储栈行为
                            BasicConfig.stackBehaviors.push(()=>{skinStackView.pop()})
                        }
                    }
                }
                Rectangle{
                    height: 4
                    width: loginText.font.pixelSize
                    color: "#e84e58"
                    visible: index === skinTitleRep.selectedIndex
                    anchors.top: loginText.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: loginText.horizontalCenter
                }
            }
        }
    }


    //皮肤页面子栈
    StackView{
        id:skinStackView
        clip: true
        anchors.left: skinTitleRow.left
        anchors.right: parent.right
        anchors.top: skinTitleRow.bottom
        anchors.bottom: parent.bottom
        initialItem: "/Src/qml/rightPage/stackPages/skinPages/SkinPage.qml"
        onCurrentItemChanged: {
            if(null !== currentItem){
                if(currentItem.objectName === "Skin"){
                    skinTitleRep.selectedIndex = 0
                }else if(currentItem.objectName === "Pendant"){
                    skinTitleRep.selectedIndex = 1
                }
            }
        }
    }
}
