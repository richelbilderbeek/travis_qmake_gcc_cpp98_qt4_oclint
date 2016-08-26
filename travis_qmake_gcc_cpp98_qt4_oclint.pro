QT += core gui

# Cannot use -Weffc++ with Qt4
QMAKE_CXXFLAGS += -Wall -Wextra -Werror

SOURCES += main.cpp
SOURCES += my_dialog.cpp
FORMS   += my_dialog.ui
HEADERS += my_dialog.h

RESOURCES += travis_qmake_gcc_cpp98_qt4_oclint.qrc