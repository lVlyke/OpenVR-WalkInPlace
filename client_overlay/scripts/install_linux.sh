#!/bin/sh
base_dir=$(dirname "$(realpath $0)")
package_dir=../../package
driver_package_dir=${package_dir}/driver
client_bin=${package_dir}/OpenVR-WalkInPlaceOverlay.AppImage
client_install_dir=~/.local/share/pottedmeat7/OpenVRWalkInPlace
driver_install_dir=~/.steam/steam/steamapps/common/SteamVR/drivers/00vrwalkinplace

cd ${base_dir}

sh ./uninstall_linux.sh

# Copy client and driver to Steam
mkdir -p "${client_install_dir}"
cp -f "${client_bin}" "${client_install_dir}"
cp -rT "${driver_package_dir}" "${driver_install_dir}"

# Install WIP driver to SteamVR
~/.steam/steam/steamapps/common/SteamVR/bin/vrpathreg.sh adddriver "${driver_install_dir}"

