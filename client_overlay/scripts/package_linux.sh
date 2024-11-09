#!/bin/sh
base_dir=$(dirname "$(realpath $0)")
package_dir=../../package
driver_package_dir=${package_dir}/driver
client_package_dir=${package_dir}/client
driver_build_dir=../../driver_vrwalkinplace
client_build_dir=../bin/x64

cd ${base_dir}

rm -rf ${package_dir}
mkdir -p ${client_package_dir}
mkdir -p ${driver_package_dir}

echo "Packaging client files..."

cp -r ${client_build_dir}/res ${client_package_dir}
cp ${client_build_dir}/manifest.vrmanifest ${client_package_dir}
cp ${client_build_dir}/qt.conf ${client_package_dir}
cp ${client_build_dir}/default.desktop ${client_package_dir}
cp ${client_build_dir}/.DirIcon ${client_package_dir}
cp ${client_build_dir}/LICENSE ${client_package_dir}
cp ${client_build_dir}/default.png ${client_package_dir}
cp ${client_build_dir}/../logging.conf ${client_package_dir}

chmod +x ${client_build_dir}/OpenVR-WalkInPlaceOverlay

# Download appimagetool
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -O "${base_dir}/appimagetool"
chmod +x "${base_dir}/appimagetool"

# Package the app
python3 linuxdeployqt.py ${client_build_dir}/OpenVR-WalkInPlaceOverlay --qt-base-dir $QT_PATH --qml-scan-dir "${client_build_dir}/res/qml/" --appdir "${client_package_dir}" --appimage "${package_dir}/OpenVR-WalkInPlaceOverlay.AppImage" --verbose=1

# Remove appimagetool
rm -f "${base_dir}/appimagetool"

echo "Packaging driver files..."

# Package driver
mkdir -p ${driver_package_dir}/bin/linux32
mkdir -p ${driver_package_dir}/bin/linux64
cp -r ${driver_build_dir}/resources ${driver_package_dir}
cp ${driver_build_dir}/driver.vrdrivermanifest ${driver_package_dir}
cp ${driver_build_dir}/lib/libDriverWalkInPlace.so ${driver_package_dir}/bin/linux32/driver_00vrwalkinplace.so
cp ${driver_build_dir}/lib/libDriverWalkInPlace.so ${driver_package_dir}/bin/linux64/driver_00vrwalkinplace.so