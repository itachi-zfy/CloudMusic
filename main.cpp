#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QDebug>

/**
 * @brief singletonRegist qml文件全局单例注册
 */
void singletonRegist(){
    qmlRegisterSingletonType(QUrl("qrc:/Src/qml/basic/BasicConfig.qml"),"BasicConfig",1,0,"BasicConfig");
}

/**
 * @brief globalRegist cpp全局注册
 */
void globalRegist(){

}

/**
 * @brief init 初始化相关操作
 */
void init(){
    singletonRegist();
    globalRegist();
    //在QWL当中使用FileDialog如果不加这行会报错
    QCoreApplication::setOrganizationName("Some organization");
    //查看系统当中的字体
    // QStringList families = QFontDatabase().families();
    // for(QString& family: families)qDebug()<<family;
}
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    init();
    return app.exec();
}
