/***************************************************************
*  @ProjName:   %{CurrentProject:MyCloudMusic}
*  @FileName:   TopTitle.qml
*  @Author:     zfy1362021@163.com
*  @Date:       2024-08-02
*  @Brief:      顶部标题
*
*---------------------------------------------------------------
*  ||擅长C++/Qt/Qml/Map/OpenGL/WebGis PC/Andriod端应用程序开发，
*  ||复杂仿真程序开发 (学习交流加群：492954738)
****************************************************************/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import Qt5Compat.GraphicalEffects

import "../basic"
import "../commonUI"
import "../title"
Item {
    id:titleRoot
    /**
      * @type 0表示换肤按钮被点击了
      * @type 1表示设置按钮被点击了
      */
    signal typeClicked(int type)

    //搜索 searchRow
    Search{
        id:searchRow
        spacing: 8 * BasicConfig.wScale
        anchors.left: parent.left
        anchors.leftMargin: 36 * BasicConfig.wScale
        anchors.verticalCenter: parent.verticalCenter
    }
    //用户与基础设置
    UserCommonSetting{
        id:othersRow
        spacing: 5 * BasicConfig.wScale
        anchors.verticalCenter: searchRow.verticalCenter
        anchors.right: miniRow.left
        anchors.rightMargin: 10 * BasicConfig.wScale
    }
    //最小化&etc.
    MinAndMax{
        id:miniRow
        spacing: 15 * BasicConfig.wScale
        anchors.verticalCenter: othersRow.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0.02 * window.width * BasicConfig.wScale//   50/2560 ≈ 0.02
    }
}
