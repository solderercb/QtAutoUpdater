if(exists(../3rdparty-common.pri)){
    include(../3rdparty-common.pri)
} else {
    isEmpty(BUILD_DIR) {
        BUILD_DIR = $${PWD}
    }
}

# Т. к. сгенерированные заголовочные файлы *.h в основном содержат относительные пути к оригинальным файлам *.h,
# они не могут быть использованы в основном проекте и должны быть заменены. Это позволит
# подключать файлы как в примерах (например, #include <QtAutoUpdaterWidgets/UpdateController>)
INCLUDE_FILES += \
    autoupdatercore/adminauthoriser.h \
    autoupdatercore/processbackend.h \
    autoupdatercore/qtautoupdatercore_global.h \
    autoupdatercore/updateinfo.h \
    autoupdatercore/updateinstaller.h \
    autoupdatercore/updater.h \
    autoupdatercore/updaterbackend.h \
    autoupdatercore/updaterplugin.h \
    autoupdaterwidgets/qtautoupdaterwidgets_global.h \
    autoupdaterwidgets/updatebutton.h \
    autoupdaterwidgets/updatecontroller.h

!isEmpty(EXPORT_LIBS) {
#    message(PWD = $${PWD})
#    message(EXPORT_LIBS = $$EXPORT_LIBS)
    TARGET_DIR = $${PWD}
    EXPORT_LIBS  ~= s,/,\\,g
    TARGET_DIR   ~= s,/,\\,g

    QMAKE_POST_LINK += $$escape_expand(\\n\\t)
    QMAKE_POST_LINK += chcp 65001 >nul 2>&1 $$escape_expand(\\n\\t)
    # Копирование сгенерированных заголовочных файлов
    QMAKE_POST_LINK += $$QMAKE_COPY_DIR \"$${TARGET_DIR}\\include\" \"$${EXPORT_LIBS}\\include\" $$escape_expand(\\n\\t)
    # Замена загловочных файлов
    for(FILE, INCLUDE_FILES) {
        FILE  ~= s,/,\\,g
        QMAKE_POST_LINK += $$QMAKE_COPY \"$${TARGET_DIR}\\src\\$${FILE}\" \"$${EXPORT_LIBS}\\include\\Qt$$dirname(FILE)\\\" >nul 2>&1 $$escape_expand(\\n\\t)
    }

    QMAKE_POST_LINK += $$QMAKE_COPY \"$${TARGET_DIR}\\lib\" \"$${EXPORT_LIBS}\" $$escape_expand(\\n\\t)
    QMAKE_POST_LINK += $$QMAKE_COPY_DIR \"$${TARGET_DIR}\\plugins\" \"$${EXPORT_LIBS}\\plugins\" $$escape_expand(\\n\\t)
}
