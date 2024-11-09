#!/bin/sh

if [ $1 = "install" ]; then

	sh ./client_overlay/scripts/install_linux.sh

	echo "install complete"
elif [ $1 = 'uninstall' ]; then
	sh ./client_overlay/scripts/uninstall_linux.sh
elif [ $1 = "clean" ]; then

	cd lib_vrwalkinplace 
	make clean

	cd ../driver_vrwalkinplace 
	make clean

	cd ../
	make clean

	echo "clean complete"

else 

	cd lib_vrwalkinplace 
    cmake -DCMAKE_BUILD_TYPE=Release .
	make

	cd ../driver_vrwalkinplace 
    cmake -DCMAKE_BUILD_TYPE=Release .
	make

	cd ../

	QT_PATH=/usr/lib/x86_64-linux-gnu/qt5/
	# QT_PATH=~/Qt/5.15.2/gcc_64/bin/

	PATH=$QT_PATH:$PATH
	export PATH
	qmake -config release
	make

	sh "./client_overlay/scripts/package_linux.sh"

	echo "build complete"
fi
