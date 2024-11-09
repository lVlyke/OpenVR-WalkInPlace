setlocal enableDelayedExpansion

cd %~dp0\..\bin\x64

!%QTDIR%!\bin\windeployqt.exe --dir qtdata --libdir . --plugindir qtdata/plugins --qmldir res/qml OpenVR-WalkInPlaceOverlay.exe