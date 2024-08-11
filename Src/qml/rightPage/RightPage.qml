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
            window.stackBehaviors.push(()=>{mainStackView.pop()})
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
        initialItem: "/Src/qml/rightPage/stackPages/CherryPick.qml"
    }

}
