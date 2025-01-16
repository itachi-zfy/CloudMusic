import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../../../basic"
import "../../../../commonUI"
Item{
    id:outerItem
    clip: true
    width: parent.width
    property real offset: ((window.width-1317)/1242*0.48 + 1)
    height: 500*offset
    Label{
        id:officalListLabel
        text:"官方榜"
        font.pixelSize: 24
        font.family: "黑体"
        font.bold: true
        color: "white"
        anchors.left: parent.left
        anchors.top: parent.top
    }
    Flow{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: officalListLabel.bottom
        anchors.topMargin: 20
        spacing: 20
        ListModel{
            id:outModel
            ListElement{titleText:"飙升榜";src:"/Resources/cherryPick/theCharts/officalList/pic0.png";sing1:"与我无关";sing2:"门没有了";sing3:"兰花草";singer1:"丁与文";singer2:"门尼";singer3:"GAI周延";discription1:"新";discription2:"新";discription3:"新"}
            ListElement{titleText:"新歌榜";src:"/Resources/cherryPick/theCharts/officalList/pic1.png";sing1:"才二十三";sing2:"佤写不来情歌2024";sing3:"童话镇";singer1:"方大同";singer2:"王力宏";singer3:"容祖儿";discription1:"-";discription2:"-";discription3:"▲"}
            ListElement{titleText:"热歌榜";src:"/Resources/cherryPick/theCharts/officalList/pic2.png";sing1:"如果爱忘了(live)";sing2:"红";sing3:"与我无关";singer1:"汪苏泷/单衣纯";singer2:"罗言";singer3:"阿冗";discription1:"▲";discription2:"▼";discription3:"-"}
            ListElement{titleText:"原创榜";src:"/Resources/cherryPick/theCharts/officalList/pic3.png";sing1:"海底物语";sing2:"In My Head";sing3:"爱欲求";singer1:"江辰";singer2:"落日飞车";singer3:"郑州人";discription1:"新";discription2:"新";discription3:"新"}
        }
        Repeater{
            model:outModel
            Rectangle{
                width: 477 * offset
                height: 200 *offset
                color:"#212127"
                radius: 10
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        cursorShape = Qt.PointingHandCursor
                    }
                    onExited: {
                        cursorShape = Qt.ArrowCursor
                    }
                }
                Label{
                    id:bigLabel
                    text:titleText
                    font.family: "黑体"
                    font.pixelSize: 26
                    font.bold: true
                    color:"white"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                }
                Label{
                    id:updateLabel
                    font.family: "黑体"
                    font.pixelSize: 16
                    font.bold: true
                    color:"#677174"
                    text:"每天跟新"
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    anchors.verticalCenter: bigLabel.verticalCenter
                }
                Image{
                    id:discriptionImg
                    anchors.left: bigLabel.left
                    anchors.leftMargin: width*(scale-1)
                    source: src
                    scale: outerItem.offset
                    anchors.verticalCenter: parent.verticalCenter
                }
                Column{
                    anchors.left: discriptionImg.right
                    anchors.right: updateLabel.right
                    anchors.top: discriptionImg.top
                    spacing: 10
                    Repeater{
                        anchors.verticalCenter: parent.verticalCenter
                        model:3
                        Item{
                            id:singRowLayout
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 10 *  ((window.width-1317)/1242 * 1.5 + 1)
                            height: discriptionImg.implicitHeight/3
                            Label{
                                anchors.left: parent.left
                                anchors.leftMargin: 10 *  ((window.width-1317)/1242 * 1.5 + 1)
                                text: `<span style=\"font-size: 18px;color: #ddd;font-family:'黑体';font-bold:true;\">${index+1} ${!index? sing1 : (index===1?sing2:sing3)}</span><span style=\"font-size: 18px;color: #7a7a7d;font-family:'黑体';\">-${!index? singer1 : (index===1?singer2:singer3)}</span>`
                                textFormat: Text.RichText
                                verticalAlignment: Text.AlignVCenter
                            }
                            Label{
                                property string txt: !index?discription1:(index===1?discription2:discription3)
                                text: txt
                                font.pixelSize: 18
                                font.bold: true
                                font.family: "黑体"
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                verticalAlignment: Text.AlignVCenter
                                color:txt==="新"?"#42b088":(txt==="-"?"#56565b":(txt==="▲"?"#eb4d44":"#42b088"))
                            }

                        }
                    }
                }
            }

        }
    }
}
