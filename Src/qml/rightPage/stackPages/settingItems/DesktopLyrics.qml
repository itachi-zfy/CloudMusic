import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../basic"
import "../../../commonUI"
Item{
    id:lyricsRoot
    anchors.left: parent.left
    anchors.right: parent.right
    height: 800
    Label{
        id: desktopLyricsLabel
        text: "桌面歌词"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
        clip: true
        height: 25
        verticalAlignment: Text.AlignVCenter
    }
    //桌面歌词
    Row{
        id:row1
        anchors.bottom: desktopLyricsLabel.bottom
        anchors.left: desktopLyricsLabel.left
        anchors.leftMargin: 150
        spacing:50
        Repeater{
            model: ["启用桌面歌词","启用歌词总在最前","外文歌词显示翻译","外文歌词显示音译"]
            ZYYCheckBox{
                text: modelData
                checked: index === 1 || index === 2
            }
        }
    }
    //字体字号
    ListModel{id:fontSizeModel}
    Row{
        id:row2
        anchors.top: row1.bottom
        anchors.left: row1.left
        anchors.right: row1.right
        spacing:20
        anchors.topMargin: 30
        Repeater{
            model: ["字体","字号","字粗","描边"]
            Item{
                width: 150
                height: 60
                Label{
                    id: fontLabel
                    text: modelData
                    font.pixelSize: 20
                    font.bold: true
                    font.family: "黑体"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    color:"white"
                    height: 25
                }
                ZYYComboBox{
                    width: parent.width
                    height: 30
                    anchors.top: fontLabel.bottom
                    anchors.left: fontLabel.left
                    anchors.topMargin: 20
                    Component.onCompleted: {
                        if(index === 0){
                            model = ["默认","仿宋","华文中宋","华文仿宋","华文宋体","华文新魏","华文楷体","华文细黑","华文行书"
                                     ,"华文楷书","宋体","幼圆","微软雅黑","微软雅黑 Light","新宋体","方正姚体","方正舒体"]
                            text = "默认"
                        }else if(index === 1){
                            model = fontSizeModel
                            for(let i = 20;i<97;i++)model.append({modelData:String(i)})
                            text = "20"
                        }else if(index === 2){
                            model = ["标准","加粗"]
                            text = "标准"
                        }else if(index === 3){
                            model = ["有描边","无描边"]
                            text = "有描边"
                        }
                    }
                }
            }
        }
    }
    //分割线
    ZYYSpliteLine{}
}
