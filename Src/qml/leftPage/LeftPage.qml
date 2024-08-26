import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../basic"
import "../commonUI"
import "../title"
Rectangle{
    Item{
        width: 255
        height: 80
        anchors.left: parent.left
        anchors.top: parent.top
        Row{
            id:titleAndIcon
            spacing: 10
            anchors.centerIn: parent
            Image{
                id:iconImg
                source: "/Resources/title/logo.png"
            }
            Label{
                id:titleLabel
                color:"white"
                font.bold: true
                text: "周易云音乐"
                font.pixelSize: 26
                font.family: BasicConfig.commFont
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        //云音乐精选、播客、社区
        ListModel{
            id:cherryPickModel
            ListElement{iconLeft:"/Resources/leftBar/datasource.png";txt:"云音乐精选";iconRight:""}
            ListElement{iconLeft:"/Resources/leftBar/boke.png";txt:"播客";iconRight:""}
            ListElement{iconLeft:"/Resources/leftBar/social.png";txt:"社区";iconRight:""}
        }
        Column{
            id:col1
            anchors.top: parent.top
            anchors.topMargin: 130
            spacing:5
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater{
                id:cherryPickRep
                model: cherryPickModel
                ZYYLeftButton{
                    width: 210
                    height: 50
                    radius: 10
                    leftIcon: iconLeft
                    text: txt
                    rightIcon: iconRight
                    isSelected: !index
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.hovered =  true
                            parent.color = parent.isSelected?"#e84f50":"#27272d"
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            parent.hovered =  parent.isSelected
                            parent.color = parent.isSelected?"#e84f50":"transparent"
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            for(let i = 0;i<cherryPickModel.count;i++){
                                cherryPickRep.itemAt(i).isSelected = false
                            }
                            for(let i = 0;i<likeModel.count;i++){
                                likeRep.itemAt(i).isSelected = false
                            }
                            parent.isSelected = true
                            if(index === 0){
                                BasicConfig.jumpToMainPage()
                            }else if(index === 1){
                                BasicConfig.jumpToPodcastPage()
                            }
                        }
                    }
                }
            }
        }
        //分割线
        Rectangle{
            id:cutLine1
            anchors.left: col1.left
            anchors.right: col1.right
            anchors.top:col1.bottom
            height: 2
            color: "#212127"
            anchors.topMargin: 10
        }
        //我喜欢的音乐、最近播放、下载管理、本地音乐
        ListModel{
            id:likeModel
            ListElement{iconLeft:"/Resources/leftBar/likeLeft.png";txt:"我喜欢的音乐";iconRight:"/Resources/leftBar/likeRight.png"}
            ListElement{iconLeft:"/Resources/leftBar/recent.png";txt:"最近播放";iconRight:""}
            ListElement{iconLeft:"/Resources/leftBar/downLoad.png";txt:"下载管理";iconRight:""}
            ListElement{iconLeft:"/Resources/leftBar/datasource.png";txt:"本地音乐";iconRight:""}
        }
        Column{
            id:col2
            anchors.top: cutLine1.bottom
            anchors.topMargin: 10
            spacing:5
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater{
                id:likeRep
                model: likeModel
                ZYYLeftButton{
                    width: 210
                    height: 50
                    radius: 10
                    leftIcon: iconLeft
                    text: txt
                    rightIcon: iconRight
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.hovered =  true
                            parent.color = parent.isSelected?"#e84f50":"#27272d"
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            parent.hovered =  parent.isSelected
                            parent.color = parent.isSelected?"#e84f50":"transparent"
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            for(let i = 0;i<cherryPickModel.count;i++){
                                cherryPickRep.itemAt(i).isSelected = false
                            }
                            for(let i = 0;i<likeModel.count;i++){
                                likeRep.itemAt(i).isSelected = false
                            }
                            parent.isSelected = true
                        }
                    }
                }
            }
        }
        //分割线
        Rectangle{
            id:cutLine2
            anchors.left: col2.left
            anchors.right: col2.right
            anchors.top:col2.bottom
            height: 2
            color: "#212127"
            anchors.topMargin: 10
        }
        //创建本地歌单
        Item{
            anchors.left: cutLine2.left
            anchors.right: cutLine2.right
            anchors.top:cutLine2.bottom
            height: 80
            property int singNum: 0
            Label{
                id:createLabel
                text: `创建的歌单(${parent.singNum})`
                color: "#a3a3a6"
                font.pixelSize: 16
                font.bold: true
                font.family: BasicConfig.commFont
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            Image{
                anchors.verticalCenter: createLabel.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                source: "/Resources/leftBar/add.png"
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
            }
            //分割线
            Rectangle{
                id:cutLine3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom:parent.bottom
                height: 2
                color: "#212127"
                anchors.topMargin: 10
            }
        }
    }

}
