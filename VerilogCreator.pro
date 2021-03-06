#/*
#* Copyright 2018 Rochus Keller <mailto:me@rochus-keller.ch>
#*
#* This file is part of the VerilogCreator plugin.
#*
#* The following is the license that applies to this copy of the
#* plugin. For a license to use the plugin under conditions
#* other than those described here, please email to me@rochus-keller.ch.
#*
#* GNU General Public License Usage
#* This file may be used under the terms of the GNU General Public
#* License (GPL) versions 2.0 or 3.0 as published by the Free Software
#* Foundation and appearing in the file LICENSE.GPL included in
#* the packaging of this file. Please review the following information
#* to ensure GNU General Public Licensing requirements will be met:
#* http://www.fsf.org/licensing/licenses/info/GPLv2.html and
#* http://www.gnu.org/copyleft/gpl.html.
#*/

DEFINES += VERILOGCREATOR_LIBRARY
DEFINES -= QT_NO_CAST_FROM_ASCII

# Qt Creator linking

## set the QTC_SOURCE environment variable to override the setting here
QTCREATOR_SOURCES = $$(QTC_SOURCE)
isEmpty(QTCREATOR_SOURCES):QTCREATOR_SOURCES=/home/me/Downloads/qt-creator-opensource-src-3.4.0

## set the QTC_BUILD environment variable to override the setting here
IDE_BUILD_TREE = $$(QTC_BUILD)
isEmpty(IDE_BUILD_TREE):IDE_BUILD_TREE=/opt/qtcreator-3.4.0

## uncomment to build plugin into user config directory
## <localappdata>/plugins/<ideversion>
##    where <localappdata> is e.g.
##    "%LOCALAPPDATA%\QtProject\qtcreator" on Windows Vista and later
##    "$XDG_DATA_HOME/data/QtProject/qtcreator" or "~/.local/share/data/QtProject/qtcreator" on Linux
##    "~/Library/Application Support/QtProject/Qt Creator" on Mac
USE_USER_DESTDIR = yes

###### If the plugin can be depended upon by other plugins, this code needs to be outsourced to
###### <dirname>_dependencies.pri, where <dirname> is the name of the directory containing the
###### plugin's sources.

QTC_PLUGIN_NAME = VerilogCreator
QTC_LIB_DEPENDS += \
    # nothing here at this time

QTC_PLUGIN_DEPENDS += \
    coreplugin texteditor projectexplorer

QTC_PLUGIN_RECOMMENDS += \
    # optional plugin dependencies. nothing here at this time

###### End _dependencies.pri contents ######

include($$QTCREATOR_SOURCES/src/qtcreatorplugin.pri)

# VerilogCreator files

INCLUDEPATH += ..

SOURCES += \
    VlHighlighter.cpp \
    VlConstants.cpp \
    VlEditor.cpp \
    VlEditorDocument.cpp \
    VlEditorFactory.cpp \
    VlEditorWidget.cpp \
    VlPlugin.cpp \
    VlIndenter.cpp \
    VlModelManager.cpp \
    VlProject.cpp \
    VlProjectManager.cpp \
    VlHoverHandler.cpp \
    VlProjectFile.cpp \
    VlConfigurationFactory.cpp \
    VlIcarusConfiguration.cpp \
    VlVerilatorConfiguration.cpp \
    VlYosysConfiguration.cpp \
    VlOutlineMdl.cpp \
    VlTclConfiguration.cpp \
    VlTclEngine.cpp

HEADERS += \
    verilogcreator_global.h \
    VlHighlighter.h \
    VlConstants.h \
    VlEditor.h \
    VlEditorDocument.h \
    VlEditorFactory.h \
    VlEditorWidget.h \
    VlPlugin.h \
    VlIndenter.h \
    VlModelManager.h \
    VlProject.h \
    VlProjectManager.h \
    VlHoverHandler.h \
    VlProjectFile.h \
    VlConfigurationFactory.h \
    VlIcarusConfiguration.h \
    VlVerilatorConfiguration.h \
    VlYosysConfiguration.h \
    VlOutlineMdl.h \
    VlTclConfiguration.h \
    VlTclEngine.h

include (../Verilog/Verilog.pri )

OTHER_FILES +=

DISTFILES += \
    VerilogCreator.json.in

RESOURCES += \
    VerilogCreator.qrc 
