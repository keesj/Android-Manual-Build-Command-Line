# Android-Manual-Build-Command-Line


Based on https://github.com/skanti/Android-Manual-Build-Command-Line 

This method relies on installing the android code under ubuntu/debian by installing the packages
provided by the guardian project. Because of this path of tools are on different locations. For the same reason we can rely on ndk-build to build the native code.

On bionic things look like this (see https://wiki.debian.org/AndroidTools/IntroBuildingApps )

	# using lxc containers (as root/using sudo)
	lxc-create -t download -n android-dev -- --dist ubuntu --release focal --arch amd64
	lxc-start --name android-dev
	lxc-attach --name android-dev
	apt-get update 
	apt-get upgrade
	apt-get -y  install vim tmux build-essential git openssh-server
	
	apt-get -y install \
		google-android-platform-24-installer \
		google-android-build-tools-24-installer \
		google-android-ndk-installer \
		android-sdk-helper  \
		android-sdk \
		libncurses5
	git clone https://github.com/mherod/android-sdk-licenses.git 
	sudo cp -a android-sdk-licenses/. /usr/lib/android-sdk/licenses 
	
	# now add a user and set ANDROID_HOME to /usr/lib/sdfasfds in the .bashrc
	adduser --disabled-password $SUDO_USER
	su - $SUDO_USER
	echo "export ANDROID_HOME=/usr/lib/android-sdk/" >> .bashrc
	echo 'export PATH=/usr/lib/android-ndk/:${PATH}' >> .bashrc
	

	git clone https://github.com/keesj/AndroidMakefile
	cd AndroidMakefile/hello-jni
	make


# Running

am start -n com.example.hellojni/com.example.hellojni.HelloJNI

