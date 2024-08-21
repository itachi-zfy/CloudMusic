import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../basic"
import "../../../../commonUI"
Item{
    anchors.left: parent.left
    anchors.right: parent.right
    height: 200*carouselRow.m_scale
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
    Image {
        id:leftIniImg
        visible: false
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
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
                startTimer.onlyOnce = true
                carouselIndicatorAnimtion.reserveFlag = false
                startTimer.interval = 100
                startTimer.start()
            }
        }
    }
    Image {
        id:rigtIniImg
        mirror: true
        visible: false
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
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
                startTimer.stop()
                carouselIndicatorAnimtion.stop()
                carouselIndicatorAnimtion.reserveFlag = true
                carouselIndicatorAnimtion.start()
                startAni.start()
            }
        }
    }

    Timer{
        id:startAni
        repeat: false
        running: false
        interval: 2000
        onTriggered: {
            carouselIndicatorAnimtion.reserveFlag = false
            startTimer.start()
        }
    }
    Item{
        clip:true
        width: flick.width * 0.89
        height: parent.height*carouselRow.m_scale
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: window.width * (36 * BasicConfig.wScale / 1317)
        ListModel{
            id:carouselModel
            ListElement{src:"/Resources/cherryPick/carouselI1.png"}
            ListElement{src:"/Resources/cherryPick/carouselI2.png"}
            ListElement{src:"/Resources/cherryPick/carouselI3.png"}
            ListElement{src:"/Resources/cherryPick/carouselI4.png"}
            ListElement{src:"/Resources/cherryPick/carouselI5.png"}
            ListElement{src:"/Resources/cherryPick/carouselI6.png"}
        }

        ListView{
            id:carouselRow
            spacing: 30
            orientation: ListView.Horizontal
            anchors.left: parent.left
            anchors.right: parent.right
            height: 160*carouselRow.m_scale
            model: carouselModel//1.59 2.33
            property real m_scale: (carouselRow.width/950-1) * 0.4 + 1
            delegate:  Rectangle{
                width: 460*carouselRow.m_scale
                height: 160*carouselRow.m_scale
                radius: 10
                clip: true
                color: "transparent"
                Image {
                    id:carouselImg
                    anchors.centerIn: parent
                    source: src
                    scale: carouselRow.m_scale
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.opacity = 0.8
                            leftIniImg.visible = true
                            rigtIniImg.visible = true
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            parent.opacity = 1
                            leftIniImg.visible = false
                            rigtIniImg.visible = false
                            cursorShape = Qt.ArrowCursor
                        }
                    }
                }
            }
            add:Transition {
                NumberAnimation {
                    property: "x"
                    duration: 1030* (2-carouselRow.m_scale)
                    from: -460
                    to:0
                    easing.type: Easing.Linear
                }
            }
            addDisplaced: Transition {
                NumberAnimation {
                    property: "x"
                    duration: 1000* (2-carouselRow.m_scale)
                    easing.type: Easing.Linear
                }
            }
            remove: Transition {
                NumberAnimation {
                    property: "x"
                    duration: 930 * (2-carouselRow.m_scale)
                    from: 0
                    to:-460
                    easing.type: Easing.Linear
                }
            }
            removeDisplaced: Transition {
                NumberAnimation {
                    property: "x"
                    duration: 1000
                    easing.type: Easing.Linear
                }
            }
        }
        Item{
            id:carouselIndicatorItem
            anchors.top: carouselRow.bottom
            anchors.topMargin: 20*carouselRow.m_scale
            anchors.horizontalCenter: parent.horizontalCenter
            width: 95
            height: 10
            property var widthArray: [0,6,8,10,8,6,0]        //记录点的位置以制作动画
            property var posArray: []     //记录点的位置以制作动画
            Rectangle{
                id:indicator0
                width: carouselIndicatorItem.widthArray[0]
                height: width
                radius: height/2
                color: "#a1a1a3"
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted:{
                    parent.posArray.push(x)
                    parent.posArray.reverse()
                }
            }
            //qml:[0,10,26,44,64,82,98]
            Rectangle{
                id:indicator1
                width: carouselIndicatorItem.widthArray[1]
                height: width
                radius: height/2
                color: "#a1a1a3"
                x:indicator0.x + 10 + indicator0.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: parent.posArray.push(x)

            }

            Rectangle{
                id:indicator2
                width: carouselIndicatorItem.widthArray[2]
                height: width
                radius: height/2
                color: "#a1a1a3"
                x:indicator1.x + 10 + indicator1.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: parent.posArray.push(x)
            }

            Rectangle{
                id:indicator3
                width: carouselIndicatorItem.widthArray[3]
                height: width
                radius: height/2
                color: "#a1a1a3"
                x:indicator2.x + 10 + indicator2.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: parent.posArray.push(x)
            }
            Rectangle{
                id:indicator4
                width: carouselIndicatorItem.widthArray[4]
                height: width
                radius: height/2
                color: "#a1a1a3"
                x:indicator3.x + 10 + indicator3.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: parent.posArray.push(x)
            }
            Rectangle{
                id:indicator5
                width: carouselIndicatorItem.widthArray[5]
                height: width
                radius: height/2
                color: "#a1a1a3"
                x:indicator4.x + 10 + indicator4.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: parent.posArray.push(x)
            }
            Rectangle{
                id:indicator6
                width: carouselIndicatorItem.widthArray[6]
                height: width
                radius: height/2
                color: "#a1a1a3"
                x:indicator5.x + 10 + indicator5.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: parent.posArray.push(x)
            }
            SequentialAnimation{
                id:carouselIndicatorAnimtion
                alwaysRunToEnd: true
                property bool reserveFlag: false
                ParallelAnimation{
                    alwaysRunToEnd: true
                    PropertyAnimation{
                        target: indicator1
                        properties: "height,width"
                        from: carouselIndicatorAnimtion.reserveFlag ? 0: 6
                        to:carouselIndicatorAnimtion.reserveFlag ? 6: 0
                        duration: 1000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: indicator1
                        properties: "x"
                        from:carouselIndicatorAnimtion.reserveFlag ? 0:  indicator1.x
                        to:carouselIndicatorAnimtion.reserveFlag ? indicator1.x : 0
                        duration: 1000
                        alwaysRunToEnd: true
                    }
                    ScriptAction{
                        script: {
                            if(carouselIndicatorAnimtion.reserveFlag){
                                carouselModel.insert(0,carouselModel.get(carouselModel.count-1))
                                carouselModel.remove(carouselModel.count-1)
                            }else{
                                carouselModel.append(carouselModel.get(0))
                                carouselModel.remove(0)
                            }
                        }
                    }
                    PropertyAnimation{
                        target: indicator2
                        properties: "height,width"
                        from: carouselIndicatorAnimtion.reserveFlag ? 6 : 8
                        to:carouselIndicatorAnimtion.reserveFlag ? 8 : 6
                        duration: 1000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: indicator2
                        properties: "x"
                        from: carouselIndicatorAnimtion.reserveFlag ? indicator1.x : indicator2.x
                        to:carouselIndicatorAnimtion.reserveFlag ? indicator2.x : indicator1.x
                        duration: 1000
                        alwaysRunToEnd: true
                    }

                    PropertyAnimation{
                        target: indicator3
                        properties: "height,width"
                        from:carouselIndicatorAnimtion.reserveFlag ? 8 :  10
                        to:carouselIndicatorAnimtion.reserveFlag ? 10 : 8
                        duration: 1000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: indicator3
                        properties: "x"
                        from:carouselIndicatorAnimtion.reserveFlag ? indicator2.x :  indicator3.x
                        to:carouselIndicatorAnimtion.reserveFlag ? indicator3.x : indicator2.x
                        duration: 1000
                        alwaysRunToEnd: true
                    }

                    PropertyAnimation{
                        target: indicator4
                        properties: "height,width"
                        from:carouselIndicatorAnimtion.reserveFlag ? 10 :  8
                        to:carouselIndicatorAnimtion.reserveFlag ? 8 : 10
                        duration: 1000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: indicator4
                        properties: "x"
                        from:carouselIndicatorAnimtion.reserveFlag ? indicator3.x :  indicator4.x
                        to:carouselIndicatorAnimtion.reserveFlag ? indicator4.x : indicator3.x
                        duration: 1000
                        alwaysRunToEnd: true
                    }

                    PropertyAnimation{
                        target: indicator5
                        properties: "height,width"
                        from:carouselIndicatorAnimtion.reserveFlag ? 8 :  6
                        to:carouselIndicatorAnimtion.reserveFlag ? 6 : 8
                        duration: 1000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        id:mesuarFlag
                        target: indicator5
                        properties: "x"
                        from:carouselIndicatorAnimtion.reserveFlag ? indicator4.x :  indicator5.x
                        to:carouselIndicatorAnimtion.reserveFlag ? indicator5.x : indicator4.x
                        duration: 1000
                        alwaysRunToEnd: true
                    }

                    PropertyAnimation{
                        target: indicator6
                        properties: "height,width"
                        from:carouselIndicatorAnimtion.reserveFlag ? 6 :  0
                        to:carouselIndicatorAnimtion.reserveFlag ? 0 : 6
                        duration: 1000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        id:bbb
                        target: indicator6
                        properties: "x"
                        from:carouselIndicatorAnimtion.reserveFlag ? indicator5.x :  indicator6.x
                        to:carouselIndicatorAnimtion.reserveFlag ? indicator6.x : indicator5.x
                        duration: 1000
                        alwaysRunToEnd: true

                    }

                }

                ScriptAction{
                    script: {
                        indicator0.width = carouselIndicatorItem.widthArray[0]
                        indicator1.width = carouselIndicatorItem.widthArray[1]
                        indicator2.width = carouselIndicatorItem.widthArray[2]
                        indicator3.width = carouselIndicatorItem.widthArray[3]
                        indicator4.width = carouselIndicatorItem.widthArray[4]
                        indicator5.width = carouselIndicatorItem.widthArray[5]
                        indicator6.width = carouselIndicatorItem.widthArray[6]
                        indicator0.x = carouselIndicatorItem.posArray[0]
                        indicator1.x = carouselIndicatorItem.posArray[1]
                        indicator2.x = carouselIndicatorItem.posArray[2]
                        indicator3.x = carouselIndicatorItem.posArray[3]
                        indicator4.x = carouselIndicatorItem.posArray[4]
                        indicator5.x = carouselIndicatorItem.posArray[5]
                        indicator6.x = carouselIndicatorItem.posArray[6]
                    }

                }
            }

        }
        Timer{
            id:startTimer
            running: true
            repeat: true
            interval: 3000
            property bool  onlyOnce: false
            onTriggered: {
                carouselIndicatorAnimtion.start()
                if(onlyOnce){
                    interval = 3000
                    stop()
                    startTimer.onlyOnce = false
                    startAni.start()
                }
            }

        }
    }

}
