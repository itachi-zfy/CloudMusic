import QtQuick 2.12
import QtQuick.Window 2.12
import "./Src/qml/basic"
import "./Src/qml/leftPage"
import "./Src/qml/rightPage"
import "./Src/qml/mianPopups"
import "./Src/qml/commonUI"
ZYYWindow {
    id:window
    width: 1317
    height: 933
    visible: true
    title: qsTr("CloudMusic")
    bgColor: BasicConfig.mainBgColor
    property var stackBehaviors : []                                            //存储页面栈的行为
    function openLoginPopup(){loginPopup.open()}                                //打开扫码登录弹窗
    function openLoginByOtherMeansPopup(){loginByOtherMeansPopup.open()}        //打开其他方式登录的弹窗
    function closeLoginPopup(){loginPopup.close()}                              //打开扫码登录弹窗
    function closeLoginByOtherMeansPopup(){loginByOtherMeansPopup.close()}      //打开其他方式登录的弹窗
    //扫码登录弹窗
    LoginPopup{
        id:loginPopup
        anchors.centerIn: parent
    }
    //其他方式登录的弹窗
    LoginByOtherMeansPopup{
        id:loginByOtherMeansPopup
        anchors.centerIn: parent
    }
    //左边页面
    LeftPage{
        id:leftPage   
        width: 255
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        color:BasicConfig.leftBgColor
    }
    //右侧页面
    RightPage{
        anchors.left: leftPage.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

}
