#!/bin/sh
base_dir=$(dirname "$(realpath $0)")
client_install_dir=~/.local/share/pottedmeat7/OpenVRWalkInPlace
driver_install_dir=~/.steam/steam/steamapps/common/SteamVR/drivers/00vrwalkinplace

cd ${base_dir}

rm -rf "${client_install_dir}"
rm -rf "${driver_install_dir}"

~/.steam/steam/steamapps/common/SteamVR/bin/vrpathreg.sh removedriver "${driver_install_dir}"