TEMPLATE = aux

QDEP_LUPDATE_INPUTS += $$PWD/../autoupdatercore
QDEP_LUPDATE_INPUTS += $$PWD/../autoupdaterwidgets
QDEP_LUPDATE_INPUTS += $$PWD/../plugins
QDEP_LUPDATE_INPUTS += $$PWD/../imports
QDEP_LUPDATE_INPUTS += $$PWD/../jar

TRANSLATIONS += \
	qtautoupdater_de.ts \
	qtautoupdater_es.ts \
	qtautoupdater_fr.ts \
	qtautoupdater_ar.ts \
	qtautoupdater_template.ts

CONFIG += lrelease
QM_FILES_INSTALL_PATH = $$[QT_INSTALL_TRANSLATIONS]

include(../dialogmaster/dialogmaster.pri)
include(../taskbarcontrol/qtaskbarcontrol.pri)


#replace template qm by ts
QM_FILES -= $$__qdep_lrelease_real_dir/qtautoupdater_template.qm
QM_FILES += qtautoupdater_template.ts

HEADERS =
SOURCES =
GENERATED_SOURCES =
OBJECTIVE_SOURCES =
RESOURCES =
