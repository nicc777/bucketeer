# Bucketeer

I created this container to allow me to rapidly deploy and test Python application - for my needs, mostly Flask based applications.

The idea is therefore to build your Python app, then make it available "somewhere" on-line. By passing a couple of environment variables to the `docker run` command, the `start.sh` script will be run and based on the values in the environment variables will install additional Ubuntu and Python packages.

I have included a Flask demo app in this repo for demonstration purposes.

## Build

	$ docker build --no-cache -t bucketeer:latest .

# Preparation for launch

You need to prepare data for three environment variables:

* `EXTRA` - This variable contains a space separated list of additional Ubuntu packages to install (I kept the default at less as I use it a lot)
* `INSTALL_PYTHON_PACKAGE` - Contains the URL to the package that will be installed by pip. In fact, the command that will be run is:

	pip3 install $INSTALL_PYTHON_PACKAGE

* `ENV_IMPORT_SCRIPT` - Contains the URL to the final shell script that will be run. See below for an example.

## Launch

Using the included example packages:

	$ docker run -ti --rm -e "INSTALL_PYTHON_PACKAGE=https://127.0.0.1/sample-0.0.1.tar.gz" -e "ENV_IMRT_SCRIPT=https://127.0.0.1/env.sh" -p 127.0.0.1:5000:5000 bucketeer

The content of the `env.sh` script:

	export LC_ALL=C.UTF-8
	export LANG=C.UTF-8
	export FLASK_APP=`locate flask_app.py`
	flask run --host=0.0.0.0

Line 3 exports the required `FLASK_APP` environment variable - it looks for the app we packaged in `sample-0.0.1.tar.gz`.

The `sample-0.0.1.tar.gz` file is the most basic Flask app from the Flask documentation - nothing fancy.

# My current workflow

I thought it might be a good idea to show my current workflow starting from scratch on a sample application. This is a step by step walkthrough using this repo as a base.

-- do to --
