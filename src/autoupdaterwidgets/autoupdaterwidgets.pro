TARGET = QtAutoUpdaterWidgets

QT = core gui widgets autoupdatercore autoupdatercore-private widgets-private gui-private core-private
# from taskbar control, must be done here because load(qt_module) preceds load(qdep)
win32:!winrt: QT += winextras
else:osx:!ios: QT += macextras
else:linux:!android:!emscripten: QT += dbus

HEADERS += \
	installwizard_p.h \
	qtautoupdaterwidgets_global.h \
	updatebutton_p.h \
	updatebutton.h \
	updatecontroller_p.h \
	updatecontroller.h \
	progressdialog_p.h \
	updateinfodialog_p.h

SOURCES += \
	installwizard.cpp \
	progressdialog.cpp \
	updatebutton.cpp \
	updatecontroller.cpp \
	updateinfodialog.cpp

FORMS += \
	componentspage.ui \
	errorpage.ui \
	installpage.ui \
	progressdialog.ui \
	successpage.ui \
	updatebutton.ui \
	updateinfodialog.ui

RESOURCES += \
	autoupdaterwidgets.qrc

DEFINES += "Q_DIALOG_MASTER_EXPORT=" \
           "Q_TASKBAR_CONTROL_EXPORT="

load(qt_module)

# в common.pri производится копирование скомпилированных файлов в папку основного проекта. Включение этого файла достаточно сделать только здесь, т. к. autoUpdaterCore скомплируется раньше (заданы зависимости)
include(../../common.pri)

win32 {
	QMAKE_TARGET_PRODUCT = "$$TARGET"
	QMAKE_TARGET_COMPANY = "Skycoder42"
	QMAKE_TARGET_COPYRIGHT = "Felix Barz"
} else:mac {
	QMAKE_TARGET_BUNDLE_PREFIX = "de.skycoder42."
}

include(../dialogmaster/dialogmaster.pri)
include(../taskbarcontrol/qtaskbarcontrol.pri)

