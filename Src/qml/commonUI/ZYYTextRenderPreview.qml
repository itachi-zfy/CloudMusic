import QtQuick 2.15
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.1
import QtQuick.Controls 2.15
import "./../basic"
Rectangle {
    Rectangle {
        id: gradientFinishedContentRect
        width: 10
        height: 10
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0; color: BasicConfig.finishedLyricsUpColor }
            GradientStop { position: 1; color: BasicConfig.finishedLyricsDownColor }

        }
        visible: false // should not be visible on screen.
        layer.enabled: true
        layer.smooth: true
    }
    Rectangle {
        id: gradientFinishedBorderRect
        width: 10
        height: 10
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0; color: BasicConfig.finishedLyricsBorderColor }
            GradientStop { position: 1; color: BasicConfig.finishedLyricsBorderColor }
        }
        visible: false // should not be visible on screen.
        layer.enabled: true
        layer.smooth: true
    }
    Rectangle {
        id: gradientUnfinishedContentRect
        width: 10
        height: 10
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0; color: BasicConfig.unFinishedLyricsUpColor }
            GradientStop { position: 1; color: BasicConfig.unFinishedLyricsDownColor }
        }
        visible: false // should not be visible on screen.
        layer.enabled: true
        layer.smooth: true
    }
    Rectangle {
        id: gradientUnfinishedBorderRect
        width: 10
        height: 10
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0; color: BasicConfig.unFinishedLyricsBorderColor }
            GradientStop { position: 1; color: BasicConfig.unFinishedLyricsBorderColor }
        }
        visible: false // should not be visible on screen.
        layer.enabled: true
        layer.smooth: true
    }
    Item {
        id: name
        width: borderLabel.implicitWidth
        height: borderLabel.font.pixelSize + 1
        anchors.centerIn: parent
        //左边
        Item{
            id:leftItem
            clip: true
            width: parent.width/2
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom

            //模拟文字边框
            Label{
                id:borderLabel
                text: "周易云音乐"
                color:"white"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.family: "幼圆"
                font.pixelSize: titleLabel.font.pixelSize + 1
                layer.enabled: true
                // This item should be used as the 'mask'
                layer.samplerName: "maskSource"
                layer.effect: ShaderEffect {
                    property var colorSource: gradientFinishedBorderRect
                    fragmentShader: "
                                    uniform lowp sampler2D colorSource;
                                    uniform lowp sampler2D maskSource;
                                    uniform lowp float qt_Opacity;
                                    varying highp vec2 qt_TexCoord0;
                                    void main() {
                                        gl_FragColor =
                                            texture2D(colorSource, qt_TexCoord0)
                                            * texture2D(maskSource, qt_TexCoord0).a
                                            * qt_Opacity;
                                    }
                                "

                }
            }
            //模拟文字主体
            Label{
                id:titleLabel
                text: "周易云音乐"
                color:"white"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.family: "幼圆"
                font.pixelSize: 64
                layer.enabled: true
                // This item should be used as the 'mask'
                layer.samplerName: "maskSource"
                layer.effect: ShaderEffect {
                    property var colorSource: gradientFinishedContentRect
                    fragmentShader: "
                                    uniform lowp sampler2D colorSource;
                                    uniform lowp sampler2D maskSource;
                                    uniform lowp float qt_Opacity;
                                    varying highp vec2 qt_TexCoord0;
                                    void main() {
                                        gl_FragColor =
                                            texture2D(colorSource, qt_TexCoord0)
                                            * texture2D(maskSource, qt_TexCoord0).a
                                            * qt_Opacity;
                                    }
                                "

                }
            }

        }

        //右边
        Item{
            clip: true
            width: parent.width/2
            anchors.top: parent.top
            anchors.left: leftItem.right
            anchors.bottom: parent.bottom
            //模拟文字边框
            Label{
                text: "周易云音乐"
                color:"white"
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.family: "幼圆"
                font.pixelSize: titleLabel.font.pixelSize + 1
                layer.enabled: true
                // This item should be used as the 'mask'
                layer.samplerName: "maskSource"
                layer.effect: ShaderEffect {
                    property var colorSource: gradientUnfinishedBorderRect
                    fragmentShader: "
                                    uniform lowp sampler2D colorSource;
                                    uniform lowp sampler2D maskSource;
                                    uniform lowp float qt_Opacity;
                                    varying highp vec2 qt_TexCoord0;
                                    void main() {
                                        gl_FragColor =
                                            texture2D(colorSource, qt_TexCoord0)
                                            * texture2D(maskSource, qt_TexCoord0).a
                                            * qt_Opacity;
                                    }
                                "

                }
            }
            //模拟文字主体
            Label{
                text: "周易云音乐"
                color:"white"
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.family: "幼圆"
                font.pixelSize: 64
                layer.enabled: true
                // This item should be used as the 'mask'
                layer.samplerName: "maskSource"
                layer.effect: ShaderEffect {
                    property var colorSource: gradientUnfinishedContentRect
                    fragmentShader:"
                                    uniform lowp sampler2D colorSource;
                                    uniform lowp sampler2D maskSource;
                                    uniform lowp float qt_Opacity;
                                    varying highp vec2 qt_TexCoord0;
                                    void main() {
                                        gl_FragColor =
                                            texture2D(colorSource, qt_TexCoord0)
                                            * texture2D(maskSource, qt_TexCoord0).a
                                            * qt_Opacity;
                                    }
                                "

                }
            }

        }

    }

}
