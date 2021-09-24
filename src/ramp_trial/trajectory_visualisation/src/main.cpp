#include <QtGui/QApplication>
#include "mainwindow.h"
#include <QSplashScreen>
#include <unistd.h>


int main(int argc, char *argv[])
{


    QApplication a(argc, argv);
    Q_INIT_RESOURCE(images);

    // show loading screen
    QSplashScreen *splash = new QSplashScreen;
    splash->setPixmap(QPixmap("../resources/images/splash.jpg"));
    splash->show();
    splash->showMessage(QObject::tr("ROS GUI is launching...."),Qt::AlignBottom,Qt::black);

    //make the main window appear
    MainWindow w;
    w.show();
    w.trajView.size_changed();

    // main window is fully loaded, delete the splash screen
    splash->finish(&w);
    delete splash;

    a.setStyle("gtk+");
    a.exec();

    return 0;
}