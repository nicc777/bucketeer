#!/bin/sh

echo "PWD=`pwd`"
echo "ENV: \n `env`"

pip3 install --upgrade pip

if [ -z ${EXTRA+x} ]; then 
	echo "EXTRA is not set"; 
else 
	echo "Installing $EXTRA"; 
	sudo apt install -y $EXTRA
fi

if [ -z ${INSTALL_PYTHON_PACKAGE+x} ]; then 
	echo "No extra Python package will be installed"; 
else 
	echo "Installing $INSTALL_PYTHON_PACKAGE"; 
	sudo pip3 install $INSTALL_PYTHON_PACKAGE
fi

sudo updatedb

if [ -z ${ENV_IMPORT_SCRIPT+x} ]; then 
	echo "No additional environment will be imported"; 
else 
	echo "Importing environment $ENV_IMPORT_SCRIPT"; 
	cd
	wget -O /tmp/env.sh $ENV_IMPORT_SCRIPT
	. /tmp/env.sh
fi

echo =======================================================================
echo 
echo LOOPING FOREVER...
echo 
echo =======================================================================
while true ; do
	sleep 60
done

