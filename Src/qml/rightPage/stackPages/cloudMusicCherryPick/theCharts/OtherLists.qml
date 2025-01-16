import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
// import Qt.labs.folderlistmodel 2.15
import "../../../../basic"
import "../../../../commonUI"
import "../../../../../js/TheChartsFunctions.js" as TheChartsFunctions
Repeater{
    anchors.left: parent.left
    anchors.right: parent.right
    Component.onCompleted: {
        if(BasicConfig.isFullScreen){
            other.model.setProperty(1,"originHeight",520)
            other.model.setProperty(2,"originHeight",300)
        }
    }
    model: ListModel{
        id:titleModel
        ListElement{titleText:"精选榜";originHeight:300;srcDir:"qrc:/Resources/cherryPick/theCharts/cherryPick"}
        ListElement{titleText:"曲风榜";originHeight:800;srcDir:"qrc:/Resources/cherryPick/theCharts/singStyle"}
        ListElement{titleText:"全球榜";originHeight:500;srcDir:"qrc:/Resources/cherryPick/theCharts/global"}
        ListElement{titleText:"语种榜";originHeight:500;srcDir:"qrc:/Resources/cherryPick/theCharts/language"}
        ListElement{titleText:"特色榜";originHeight:500;srcDir:"qrc:/Resources/cherryPick/theCharts/special"}
    }
    Item{
        id:outerItem
        clip: true
        width: parent.width
        property real offset: ((window.width-1317)/1242*0.38 + 1)
        height: originHeight*offset
        // FolderListModel {
        //     id: folderModel
        //     folder: srcDir
        //     nameFilters: ["*"] // 通配符，表示匹配所有文件
        //     Component.onCompleted: console.log(folderModel.count,srcDir)
        // }
        Label{
            id:officalListLabel
            text:titleText
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
            anchors.topMargin: 30 *  ((window.width-1317)/1242 * 1.5 + 1)
            spacing: 20 * ((window.width-1317)/1242*4 + 1)
            anchors.leftMargin:20 *  ((window.width-1317)/1242 * 1.5 + 1)
            Component.onCompleted: TheChartsFunctions.loadModelData(index,srcDir,outModel)
            ListModel{
                id:outModel
                ListElement{src:"/Resources/cherryPick/theCharts/cherryPick/pic0.png";}
                ListElement{src:"/Resources/cherryPick/theCharts/cherryPick/pic1.png";}
                ListElement{src:"/Resources/cherryPick/theCharts/cherryPick/pic2.png";}
                ListElement{src:"/Resources/cherryPick/theCharts/cherryPick/pic3.png";}
            }
            Repeater{
                model:outModel
                Item{
                    width: 226
                    height: width
                    Image{
                        anchors.fill: parent
                        source: src
                        scale: outerItem.offset
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            playImg.visible = true
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            playImg.visible = false
                            cursorShape = Qt.ArrowCursor
                        }
                    }
                    Image{
                        id:playImg
                        source: "/Resources/cherryPick/officalSing/play.png"
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 20
                        anchors.rightMargin: 20
                        visible: false
                    }

                }

            }
        }
    }
}
