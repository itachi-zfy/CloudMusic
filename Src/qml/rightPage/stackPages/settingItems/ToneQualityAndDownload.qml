import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.1

import QtQuick.Controls 2.15 as N
import "../../../basic"
import "../../../commonUI"

Item {
    id:toneRoot
    anchors.left: parent.left
    anchors.right: parent.right
    height: 830
    Label{
        id: toneTitleLabel
        text: "音质与下载"
        font.pixelSize: 22
        font.bold: true
        font.family: "黑体"
        anchors.left: parent.left
        color:"white"
    }
    //音质播放设置与音质下载顺序
    Column{
        id:toneCol1
        anchors.left: toneTitleLabel.left
        anchors.right: parent.right
        anchors.top: toneTitleLabel.top
        anchors.leftMargin: 150
        spacing: 40
        Repeater{
            model: ["音质播放设置","音质下载设置"]
            Item{
                anchors.left: parent.left
                anchors.right: parent.right
                height: 150
                ExclusiveGroup{id:group}
                Label{
                    id: tonePlayLabel
                    text: modelData
                    font.pixelSize: 20
                    font.bold: true
                    font.family: "黑体"
                    anchors.left: parent.left
                    color:"white"
                }
                Grid{
                    rows: 3
                    columns: 3
                    rowSpacing: 30
                    columnSpacing: 60
                    anchors.left: tonePlayLabel.right
                    anchors.top: tonePlayLabel.top
                    anchors.right: parent.right
                    anchors.leftMargin: 30
                    Repeater{
                        model: ["沉静环绕声","超声母带","高清臻音","高解析度无损","无损","极高","标准"]
                        ZYYRadioButton{
                            showIcon: index < 5
                            checked: index === 5
                            contentText: modelData
                            exclusiveGroup: group
                            vipText: if(index<2)"SVIP"
                                     else if(index < 5)"VIP"
                                     else ""
                            outerCircleColor: if(index<2)"#f3d693"
                                              else if(index < 5)"#4a4444"
                                              else "white"
                            innerCircleColor: if(index<2)"#b39048"
                                              else if(index < 5)"#e95d59"
                                              else "white"
                            rightRectColor: if(index<2)"#2a2726"
                                            else if(index < 5)"#282626"
                                            else "white"
                            textColor: if(index<2)"#ecdfc5"
                                       else if(index < 5)"#e0c8c2"
                                       else "white"
                        }
                    }
                }
            }
        }
        //了解音质
        Label{
            id: knowToneLabel
            text: "了解音质>"
            font.pixelSize: 20
            anchors.left: parent.left
            color:"#647bb8"
            font.family: BasicConfig.commFont
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                }
                // onClicked: Qt.openUrlExternally("你的网站名")
            }
        }
        //下载目录
        ZYYFloderSet{
            id:downCataItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: 60
            textFormat: Text.RichText
            text: "<span style=\"font-size: 20px;color: #ddd;font-family:'黑体';font-bold:true;\">下载目录</span>
                <span style=\"font-size: 20px;color: #89898c;font-family:'黑体';\">(默认将音乐文件下载在该文件夹中)</span>"
        }
        //缓存目录
        ZYYFloderSet{
            id:catchCateItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: 60
            text: "缓存目录"
        }
        //最大占用内存
        Row{
            id:maxMemoryRow
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 20
            Label{
                id: maxMemoryLabel
                text: "缓存最大占用"
                font.pixelSize: 20
                color:"#ddd"
                font.family: BasicConfig.commFont
            }
            ZZYSlider{
                id:memorySlider
                value: 1
                width: 300
                height: 14
                anchors.verticalCenter: maxMemoryLabel.verticalCenter
            }
            Label{
                text: "1G"
                font.pixelSize: 20
                color:"#ddd"
                font.family: BasicConfig.commFont
            }
            //清除缓存
            Rectangle{
                id:clearMemoryRect
                height: 30
                width: 100
                radius: 15
                anchors.verticalCenter: maxMemoryLabel.verticalCenter
                color: "transparent"
                border.width: 1
                border.color: BasicConfig.fieldBgBordColor
                Label{
                    text: "清除缓存"
                    font.pixelSize: 20
                    font.family: "黑体"
                    anchors.centerIn: parent
                    color:"white"

                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = BasicConfig.commGray
                        cursorShape = Qt.PointingHandCursor
                    }
                    onExited: {
                        parent.color = "transparent"
                        cursorShape = Qt.ArrowCursor
                    }
                }
            }
        }
        //音乐命名格式和文件智能分类
        Column{
            spacing:30
            anchors.left:parent.left
            anchors.right: parent.right
            Repeater{
                model: ["音乐命名格式","文件智能分类"]
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 25
                    ExclusiveGroup{id:singGroup}
                    Label{
                        id:subTitleLabel
                        text: modelData
                        font.pixelSize: 20
                        font.family: "黑体"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        color:"white"
                    }
                    Row{
                        spacing: 40
                        anchors.left: subTitleLabel.right
                        anchors.leftMargin: 15
                        anchors.verticalCenter: subTitleLabel.verticalCenter
                        Repeater{
                            model: index?["不分文件夹","按歌手分文件夹","按歌手/专辑分文件夹"]:
                                          ["歌曲名","歌曲-歌手名","歌曲名-歌手"]
                            ZYYRadioButton{
                                checked: index === 0
                                contentText: modelData
                                exclusiveGroup: singGroup
                            }
                        }
                    }
                }
            }
        }
    }

    //分割线
    ZYYSpliteLine{}
}
