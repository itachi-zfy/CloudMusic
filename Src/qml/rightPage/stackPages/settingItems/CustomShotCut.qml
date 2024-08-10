import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../../basic"
import "../../../commonUI"
Item {
    id:customShotCutRoot
    anchors.left: parent.left
    anchors.right: parent.right
    height: 800
    MouseArea{
        anchors.fill: parent
        onClicked: BasicConfig.blankAreaClicked()
    }
    Label{
        id: shotcutTitleLabel
        text: "快捷键"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }
    Label{
        id: functionLabel
        text: "功能说明"
        font.pixelSize: 20
        font.bold: true
        font.family: "黑体"
        anchors.bottom: shotcutTitleLabel.bottom
        anchors.left: shotcutTitleLabel.right
        anchors.leftMargin: 128
        color:"white"
    }
    Label{
        id: shotcutLabel
        text: "快捷键"
        font.pixelSize: 20
        font.bold: true
        font.family: "黑体"
        anchors.bottom: shotcutTitleLabel.bottom
        anchors.left: functionLabel.right
        anchors.leftMargin: 80
        color:"white"
    }
    Label{
        id: globalShotCutLabel
        text: "全局快捷键"
        font.pixelSize: 20
        font.bold: true
        font.family: "黑体"
        anchors.bottom: shotcutTitleLabel.bottom
        anchors.left: shotcutLabel.right
        anchors.leftMargin: 220
        color:"white"
    }

    //启动时候播放到平衡音量
    Column{
        id:col1
        anchors.top : shotcutTitleLabel.bottom
        anchors.left: shotcutTitleLabel.right
        anchors.right: parent.right
        anchors.leftMargin: 128
        anchors.topMargin: 30
        spacing:30
        ListModel{
            id:shotCutModel
            ListElement{description:"播放/暂停";shotcut:"Ctrl + P";globalShotcut:"Ctrl + Alt + P"}
            ListElement{description:"上一首";shotcut:"Ctrl + Left";globalShotcut:"Ctrl + Alt + Left"}
            ListElement{description:"下一首";shotcut:"Ctrl + Right";globalShotcut:"Ctrl + Alt + Right"}
            ListElement{description:"音量加";shotcut:"Ctrl + Up";globalShotcut:"Ctrl + Alt + Up"}
            ListElement{description:"音量减";shotcut:"Ctrl + Down";globalShotcut:"Ctrl + Alt + Down"}
            ListElement{description:"mini/完整模式";shotcut:"Ctrl + M";globalShotcut:"Ctrl + Alt + M"}
            ListElement{description:"喜欢歌曲";shotcut:"Ctrl + L";globalShotcut:"Ctrl + Alt + L"}
            ListElement{description:"打开/关闭歌词";shotcut:"Ctrl + D";globalShotcut:"Ctrl + Alt + D"}
        }
        Repeater{
            model: shotCutModel
            Item{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 100
                height: 50
                Item{
                    id:descriptionItem
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: 80
                    Label{
                        anchors.left: parent.left
                        text: description
                        font.pixelSize: 18
                        font.bold: true
                        font.family: BasicConfig.commFont
                        color:"#ddd"
                    }
                }
                ZYYShotCutTextField{
                    id:shotCutTextField
                    height: 40
                    width: 200
                    text: shotcut
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: descriptionItem.right
                    anchors.leftMargin: 80
                    onKeyPressed: {
                        if(key.length===1){
                            // shotCutTextField.text = ""
                            shotCutModel.set(index,{description:description,shotcut:key,globalShotcut:`Ctrl + Alt + ${key}`})
                        }else{
                            shotCutModel.set(index,{description:description,shotcut:key,globalShotcut:`Ctrl + Alt + ${key.split('+').pop()}`})
                        }

                    }
                }
                ZYYShotCutTextField{
                    id:globalShotCutTextField
                    height: 40
                    width: 200
                    text: globalShotcut
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: shotCutTextField.right
                    anchors.leftMargin: 80
                    onKeyPressed:{
                        console.log(key)
                        if(key.length===1){
                            globalShotcut.text = ""
                            shotCutModel.set(index,{description:description,shotcut:shotcut,globalShotcut:`Ctrl + Alt + ${key}`})
                        }else{
                            shotCutModel.set(index,{description:description,shotcut:shotcut,globalShotcut:`Ctrl + Alt + ${key.split('+').pop()}`})
                        }
                    }
                }
            }
        }
    }
    //启用全局快捷键
    ZYYCheckBox{
        id:useGlobalShortCut
        anchors.left: col1.left
        anchors.top: col1.bottom
        anchors.topMargin: 30
        textFormat: Text.RichText
        text: "<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">启用全局快捷键</span>
               <span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(云音乐在后台时也能响应)</span>"
    }

    //使用系统媒体快捷键
    ZYYCheckBox{
        id:useSysShortCut
        anchors.left: useGlobalShortCut.left
        anchors.top: useGlobalShortCut.bottom
        anchors.topMargin: 30
        textFormat: Text.RichText
        text: "<span style=\"font-size: 20px;color: white;font-family:'黑体';font-bold:true;\">使用系统媒体快捷键</span>
               <span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(播放/暂停、上一首、下一首、停止)</span>"
    }
    //恢复默认
    Rectangle{
        height: 40
        width: 120
        radius: 20
        opacity: 1
        color:"transparent"
        border.width: 1
        border.color: BasicConfig.fieldBgBordColor
        anchors.verticalCenter: useSysShortCut.verticalCenter
        anchors.left: useSysShortCut.right
        anchors.leftMargin: 40
        Label{
            color:"#fff"
            font.bold: true
            text: "默认恢复"
            font.pixelSize: 18
            font.family: BasicConfig.commFont
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                cursorShape = Qt.ForbiddenCursor
                parent.opacity = 0.8
            }
            onExited: {
                cursorShape = Qt.ArrowCursor
                parent.opacity = 1
            }
            onClicked:{
                shotCutModel.clear()
                shotCutModel.append({description:"播放/暂停",shotcut:"Ctrl + P",globalShotcut:"Ctrl + Alt + P"})
                shotCutModel.append({description:"上一首",shotcut:"Ctrl + Left",globalShotcut:"Ctrl + Alt + Left"})
                shotCutModel.append({description:"下一首",shotcut:"Ctrl + Right",globalShotcut:"Ctrl + Alt + Right"})
                shotCutModel.append({description:"音量加",shotcut:"Ctrl + Up",globalShotcut:"Ctrl + Alt + Up"})
                shotCutModel.append({description:"音量减",shotcut:"Ctrl + Down",globalShotcut:"Ctrl + Alt + Down"})
                shotCutModel.append({description:"mini/完整模式",shotcut:"Ctrl + M",globalShotcut:"Ctrl + Alt + M"})
                shotCutModel.append({description:"喜欢歌曲",shotcut:"Ctrl + L",globalShotcut:"Ctrl + Alt + L"})
                shotCutModel.append({description:"打开/关闭歌词",shotcut:"Ctrl + D",globalShotcut:"Ctrl + Alt + D"})
            }
        }
    }
    //分割线
    ZYYSpliteLine{}
}
