/***************************************************************
*  @ProjName:   %{CurrentProject:MyCloudMusic}
*  @FileName:   RightPage.qml
*  @Author:     zfy1362021@163.com
*  @Date:       2024-08-02
*  @Brief:      右侧的Grid页面
*
*---------------------------------------------------------------
*  ||擅长C++/Qt/Qml/Map/OpenGL/WebGis PC/Andriod端应用程序开发，
*  ||复杂仿真程序开发 (学习交流加群：492954738)
****************************************************************/

import QtQuick 2.15
import QtQuick.Controls 2.15
import "../basic"
Item{
    //获取主栈区
    function getStackView(){return mainStackView}
    //从左边侧边栏直接跳转到主界面
    Connections{
        target: BasicConfig
        function onJumpToMainPage(){
            mainStackView.push("/Src/qml/rightPage/stackPages/CloudMusicCherryPick.qml")
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
        function onJumpToPodcastPage(){
            mainStackView.push("/Src/qml/rightPage/stackPages/Podcast.qml")
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
        function onJumpToCommunityPage(){
            mainStackView.push("/Src/qml/rightPage/stackPages/Community.qml")
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
        function onJumpToLikePage(){
            mainStackView.push("/Src/qml/rightPage/stackPages/Like.qml")
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
        function onJumpToRecentPage(){
            mainStackView.push("/Src/qml/rightPage/stackPages/Recent.qml")
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
        function onJumpToDownLoadPage(){
            mainStackView.push("/Src/qml/rightPage/stackPages/DownloadManager.qml")
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
        function onJumpToLocalMusicPage(){
            mainStackView.push("/Src/qml/rightPage/stackPages/LocalMusic.qml")
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
    }
    //顶部标题区域
    TopTitle{
        id:titleArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 60 * BasicConfig.hScale
        onTypeClicked: {
            if(type === 0){//换肤页面
                if(mainStackView.currentItem.objectName !== "SkinPage"){
                    mainStackView.push("/Src/qml/rightPage/stackPages/SkinPages.qml")
                }
            }else if(type == 1){//设置页面
                if(mainStackView.currentItem.objectName !== "Settings"){
                    mainStackView.push("/Src/qml/rightPage/stackPages/Settings.qml")
                }
            }
            //页面切换行为入栈
            BasicConfig.stackBehaviors.push(()=>{mainStackView.pop()})
        }
    }
    //下方主页面栈区
    StackView{
        id:mainStackView
        anchors.top: titleArea.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        clip:true
        initialItem: "/Src/qml/rightPage/stackPages/CloudMusicCherryPick.qml"
    }

}
