import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"

Item {
    id:recentMusicRoot
    anchors.left: parent.left
    anchors.right: parent.right
    height: 450
    property list<Component> components
    required property int type                  //0表示最新音乐，1表示精选有声书，2表示热门播客
    required property string titleText
    Connections{
        target:BasicConfig
        function onFullScreen(){
            singerGrid.x = 0
            leftIniImg.enabled = false
            rigtIniImg.enabled = false
        }
        function onNormalScreen(){
            singerGrid.x = 0
            leftIniImg.enabled = false
            rigtIniImg.enabled = true
        }
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            leftIniImg.visible = true
            rigtIniImg.visible = true
            cursorShape = Qt.PointingHandCursor
        }
        onExited: {
            leftIniImg.visible = false
            rigtIniImg.visible = false
            cursorShape = Qt.ArrowCursor
        }
    }
    Label{
        id:titleLabel
        text:titleText
        font.bold: true
        color: "white"
        font.family: "黑体"
        font.pixelSize: 24
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)

    }

    Item{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: titleLabel.bottom
        anchors.topMargin: 10
        height: parent.height
        property real yOffset: (2 * ((singerRect.width - 966)/1243*1.6 +1))
        Image {
            id:leftIniImg
            visible: false
            enabled: false
            anchors.left: parent.left
            y:(singerRect.height-(implicitHeight))/parent.yOffset
            source: "/Resources/cherryPick/leftArrow.png"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    leftIniImg.visible = true
                    rigtIniImg.visible = true
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    leftIniImg.visible = false
                    rigtIniImg.visible = false
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    if(singerGrid.x < 0)slideToAni.start()
                }
            }

        }
        Image {
            id:rigtIniImg
            mirror: true
            visible: false
            enabled: true
            anchors.right: parent.right
            y:(singerRect.height-(implicitHeight))/parent.yOffset
            source: "/Resources/cherryPick/leftArrow.png"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    leftIniImg.visible = true
                    rigtIniImg.visible = true
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    leftIniImg.visible = false
                    rigtIniImg.visible = false
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: {
                    if(singerGrid.x >= 0){
                        slideToAni.start()
                    }
                }
            }
        }
        NumberAnimation {
            id:slideToAni
            target: singerGrid
            property: "x"
            duration: 500
            easing.type: Easing.InOutQuad
            from:singerGrid.x
            to:singerGrid.x < 0? 0 : 0 - 226*4 - 60
            alwaysRunToEnd: true
            onStopped:{
                rigtIniImg.enabled = singerGrid.x === 0
                leftIniImg.enabled = !rigtIniImg.enabled
            }
        }
        Item{
            id:singerRect
            anchors.left: parent.left
            anchors.right: rigtIniImg.left
            height: 350 * (width-138)/1243 * 1.5
            anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
            clip: true
            property real offset : ((singerRect.width - 966)/1243*0.5 +1)
            ListModel{
                id:listModel
                ListElement{singName:"佤写不来情歌2024";discription:"";singer:"王力宏";svipLabel:"沉浸声";origin:"原唱";playNum:"";playTime:"";score:""}
                ListElement{singName:"深海之息";discription:"";singer:"Youzee Music";svipLabel:"沉浸声";origin:"";playNum:"";playTime:"";score:""}
                ListElement{singName:"会呼吸的痛";discription:"";singer:"呆呆破";svipLabel:"高清臻音";origin:"";playNum:"";playTime:"";score:""}
                ListElement{singName:"Die With A Smile";discription:"";singer:"Lady Gaga/Bruno Mars";svipLabel:"高清臻音";origin:"mv▶";playNum:"";playTime:"";score:""}
                ListElement{singName:"童话镇";discription:"";singer:"容祖儿";svipLabel:"Hi-Res";origin:"";playNum:"";playTime:"";score:""}
                ListElement{singName:"普通女孩";discription:"";singer:"沙一汀EL";svipLabel:"高清臻音";origin:"";playNum:"";playTime:"";score:""}
                ListElement{singName:"如果的事";discription:"";singer:"游戈/听潮阁";svipLabel:"沉浸声";origin:"";playNum:"";playTime:"";score:""}
                ListElement{singName:"爱你但说不出口";discription:"";singer:"Karencici";svipLabel:"超声母带";origin:"原唱";playNum:"";playTime:"";score:""}
                ListElement{singName:"一人行";discription:"";singer:"曾舜息";svipLabel:"高清臻音";origin:"原唱";playNum:"";playTime:"";score:""}
                ListElement{singName:"Dancing in the Dark";discription:"";singer:"Jasmine Kelly/lushroom/sanjay.";svipLabel:"高清臻音";origin:"原唱";playNum:"";playTime:"";score:""}
                ListElement{singName:"两难";discription:"";singer:"加木";svipLabel:"高清臻音";origin:"原唱";playNum:"";playTime:"";score:""}
                ListElement{singName:"巴林溪";discription:"";singer:"Y.Z.H于智号/李晨曦Chirslous";svipLabel:"沉浸声";origin:"";playNum:"";playTime:"";score:""}
                Component.onCompleted: {
                    //精选有声书
                    if(type === 1){
                        listModel.clear()
                        listModel.append({singName:"听过的有声书",discription:"听过的好书都在这",singer:"",svipLabel:"",origin:"",playNum:"",playTime:"",score:""})
                        listModel.append({singName:"球状闪电|《三体》前传|陈思...",discription:"刘慈欣著童瑶王安宇主演科幻剧",singer:"",svipLabel:"",origin:"高分必听",playNum:"46.3万",playTime:"",score:"9.3"})
                        listModel.append({singName:"【官方正版】海底小纵队之谈谈...",discription:"小朋友们来谈谈岛探秘吧",singer:"",svipLabel:"",origin:"高分必听",playNum:"3443.7万",playTime:"",score:"9.6"})
                        listModel.append({singName:"贝乐虎成语故事",discription:"在故事中学会成语",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.4"})
                        listModel.append({singName:"西游记·少儿趣听版|中国神话...",discription:"每个中国孩子心中都有一个孙悟空",singer:"",svipLabel:"",origin:"高分必听",playNum:"",playTime:"",score:"9.6"})
                        listModel.append({singName:"贝乐虎诗词启蒙",discription:"孩子的第一堂语文课",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.4"})
                        listModel.append({singName:"我在三界开茶馆",discription:"做死人生意，卖你从没见过的东西",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.4"})
                        listModel.append({singName:"贝乐虎儿童音乐剧之奇妙的身体...",discription:"看音乐剧了解身体的奥秘",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.4"})
                        listModel.append({singName:"贝乐虎动物音乐派对 动画原声（...  ",discription:"贝乐虎动物音乐派对",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.4"})
                        listModel.append({singName:"天下霸唱之\"天坑\"系类四部曲完...",discription:"神秘天坑奇案，霸唱宇宙再普传奇",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.4"})
                        listModel.append({singName:"贝乐虎入园记 动画原声版（免...",discription:"贝乐虎入园记",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.4"})
                        listModel.append({singName:"贝乐虎英文儿歌（免费试听）",discription:"在音乐中提高孩子英语听说能力",singer:"",svipLabel:"",origin:"高分必听",playNum:"142.1万",playTime:"",score:"9.6"})
                    }else if(type === 2){
                        listModel.clear()
                        listModel.append({singName:"青花瓷（粤语）",discription:"",singer:"抖音热榜BGM",svipLabel:"歌曲翻唱",origin:"",playNum:"",playTime:"00:22",score:""})
                        listModel.append({singName:"大香蕉-龙智祥 吴非华",discription:"",singer:"大香蕉-龙智祥 吴非华",svipLabel:"歌曲翻唱",origin:"",playNum:"46.3万",playTime:"00:22",score:"9.3"})
                        listModel.append({singName:"抖音热门歌曲（DJ版）",discription:"",singer:"2024抖音车载BGM",svipLabel:"DJ播曲",origin:"",playNum:"3443.7万",playTime:"01:22",score:"9.6"})
                        listModel.append({singName:"小猫怎么叫",discription:"",singer:"小猫怎么叫",svipLabel:"儿歌",origin:"",playNum:"142.1万",playTime:"00:26",score:"9.4"})
                        listModel.append({singName:"抖音最火歌曲（dj版）",discription:"",singer:"2024抖音最火DJBGM",svipLabel:"remix",origin:"",playNum:"",playTime:"03:22",score:"9.6"})
                        listModel.append({singName:"广西大师《赛马娘》",discription:"",singer:"赛马娘",svipLabel:"游戏",origin:"",playNum:"142.1万",playTime:"00:22",score:"9.4"})
                        listModel.append({singName:"忒修斯的船 手欠的麻烦不要听（官方现场版）华晨宇",discription:"",singer:"华晨宇 火星演唱会",svipLabel:"歌曲翻唱",origin:"",playNum:"142.1万",playTime:"06:22",score:"9.4"})
                        listModel.append({singName:"小猪佩奇绘本故事《乔治的新恐龙》",discription:"",singer:"小猪佩奇故事在线听",svipLabel:"绘本故事",origin:"",playNum:"142.1万",playTime:"00:24",score:"9.4"})
                        listModel.append({singName:"王权篇OP《梦回还》完整版",discription:"",singer:"狐妖小红娘OP/END歌曲合集",svipLabel:"动漫",origin:"",playNum:"142.1万",playTime:"00:22",score:"9.4"})
                        listModel.append({singName:"揽胜进行曲（抖音热门）",discription:"",singer:"官方推荐欧美EA7热歌☁",svipLabel:"3D环绕",origin:"",playNum:"142.1万",playTime:"05:22",score:"9.4"})
                        listModel.append({singName:"抖音热播DJ串烧歌曲（抖音热歌）.",discription:"",singer:"抖音热歌-全球Remix（更...",svipLabel:"3D环绕",origin:"",playNum:"142.1万",playTime:"00:22",score:"9.4"})
                        listModel.append({singName:"兰亭序 粤语",discription:"",singer:"兰亭序粤语",svipLabel:"歌曲翻唱",origin:"",playNum:"142.1万",playTime:"00:28",score:"9.6"})
                    }
                }
            }
            Grid{
                id:singerGrid
                width: parent.width
                height: parent.height
                spacing: 20
                Repeater{
                    id:rep
                    model: listModel
                    Rectangle{
                        width: 470*((singerRect.width - 966)/1243 * 0.094 + 1)
                        height: 100
                        radius: 10
                        color: 'transparent'
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.color = "#212127"
                                playImg.visible = true
                                scoreLabel.text = "..."
                                // aternativeRow.visible = true

                                loader.item.visible = true
                            }
                            onExited: {
                                parent.color = "transparent"
                                playImg.visible = false
                                // aternativeRow.visible = false
                                scoreLabel.text = score
                                loader.item.visible = false
                            }
                        }
                        Image{
                            id:img
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            scale: 1.1
                            source:(index+1)? `/Resources/cherryPick/${type===0?'recentMusic':(type === 1?'audiobook':'hotPodcast')}/pic${index+1}.png`:""
                            Image{
                                id:playImg
                                visible: false
                                scale: 0.6
                                opacity: 0.8
                                source: `/Resources/cherryPick/recentMusic/play.png`
                                anchors.centerIn: parent
                            }
                        }
                        Item{
                            anchors.left: img.right
                            anchors.leftMargin: 10
                            anchors.top: parent.top
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            Column{
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: type === 1?10: 20
                                Label{
                                    text: singName
                                    font.bold: true
                                    font.pixelSize: 20
                                    font.family: '黑体'
                                    color: 'white'
                                }
                                Label{
                                    text: discription
                                    font.bold: true
                                    font.pixelSize: 12
                                    font.family: '黑体'
                                    color: '#a1a1a3'
                                }
                                Row{
                                    spacing: 5
                                    Rectangle{
                                        width: svipLabelLabel.implicitWidth + 8
                                        height: svipLabelLabel.implicitHeight
                                        color: "transparent"
                                        border.width: 1
                                        border.color: type === 2 ? "#417cbd":"#cba24e"
                                        visible: svipLabel !== ''
                                        Label{
                                            id:svipLabelLabel
                                            text: svipLabel
                                            color: type === 2 ? "#417cbd":"#cba24e"
                                            font.bold: true
                                            font.pixelSize: 10
                                            font.family: BasicConfig.commFont
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Rectangle{
                                        width: originLabel.implicitWidth + 8
                                        height: originLabel.implicitHeight
                                        color:  type===1?"#28191e":"transparent"
                                        border.width: 1
                                        border.color: type === 2 ? "#417cbd":"#eb402b"
                                        visible: origin !== ''
                                        Label{
                                            id:originLabel
                                            text: origin
                                            color: type === 2 ? "#417cbd":"#eb402b"
                                            font.bold: true
                                            font.pixelSize: 10
                                            font.family: BasicConfig.commFont
                                            anchors.centerIn: parent
                                        }
                                    }
                                    Label{
                                        text: (index===1?playNum:singer)===undefined?"":(index===1?playNum:singer)
                                        font.bold: true
                                        font.pixelSize: 15
                                        font.family: '黑体'
                                        color: 'white'
                                    }
                                }
                            }
                        }
                        Loader{
                            id:loader
                            anchors.right:parent.right
                            anchors.rightMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            sourceComponent: components[type]
                            Item{
                                anchors.right: parent.right
                                anchors.rightMargin: 50
                                width: fenLabel.implicitWidth + scoreLabel.implicitBackgroundWidth
                                visible: type === 1 && score!==""
                                Label{
                                    id:scoreLabel
                                    text: score
                                    font.bold: true
                                    font.pixelSize: 20
                                    font.family: '黑体'
                                    color: 'white'
                                }
                                Label{
                                    id:fenLabel
                                    text: "分"
                                    visible: scoreLabel.text !== "..."
                                    font.pixelSize: 12
                                    font.family: '黑体'
                                    color: 'white'
                                    anchors.left: scoreLabel.right
                                    anchors.bottom: scoreLabel.bottom
                                }
                            }
                        }
                    }
                }
            }
        }

    }

    Component{
        id: com1
        Row{
            id:aternativeRow
            visible: false
            spacing: 20
            Image {
                source: "/Resources/cherryPick/recentMusic/download.png"
            }
            Image {
                source: "/Resources/cherryPick/recentMusic/like.png"
            }
            Image {
                source: "/Resources/cherryPick/recentMusic/more.png"
            }
        }
    }
    Component{
        id: com2
        Item{

        }
    }
    Component{
        id: com3
        Row{
            id:aternativeRow
            visible: false
            spacing: 20
            Image {
                source: "/Resources/cherryPick/recentMusic/download.png"
            }
            Image {
                source: "/Resources/cherryPick/recentMusic/more.png"
            }
        }
    }
    Component.onCompleted: components.push(com1,com2,com3)
}
