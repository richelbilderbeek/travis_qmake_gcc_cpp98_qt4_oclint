#!/bin/bash

cpp_files=`ls *.cpp | egrep -v "^qrc_.*\.cpp$" | egrep -v "^moc_.*\.cpp$"`
h_files=`ls *.h | egrep -v "^ui_.*\.h$"`

./oclint-0.10.3/bin/oclint -o oclint.log \
  -disable-rule ShortVariableName \
  $cpp_files \
  $h_files \
  -- \
  -c -std=c++98 \
  -I/usr/include/c++/5 \
  -I/usr/include/x86_64-linux-gnu/c++/5 \
  -I/usr/include/qt4 \
  -I/usr/include/qt4/QtCore \
  -I/usr/include/qt4/QtGui

# Will be 1 if success
# Will be 0 if fail
success=`egrep "FilesWithViolations=0 P1=0 P2=0 P3=0" oclint.log | wc -l`

if [ $success -eq 1 ]; 
then
  echo "OCLint: OK"
  cat oclint.log
else
  echo "OCLint: Fail"
  cat oclint.log
  exit 1
fi