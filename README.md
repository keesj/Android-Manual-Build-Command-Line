# Android-Manual-Build-Command-Line


Based on https://github.com/skanti/Android-Manual-Build-Command-Line but different

This method relies on installing the android code under ubuntu/debian by installing the packages
provided by the guardian project. Because of this less manual steps are required to get things working.

For the same reason we can rely on ndk-build to build the native code.

On bionic things look like this (see https://wiki.debian.org/AndroidTools/IntroBuildingApps )


	sudo apt-get install google-android-platform-24-installer google-android-build-tools-24-installer google-android-ndk-installer
	git clone https://github.com/mherod/android-sdk-licenses.git 
	sudo cp -a android-sdk-licenses/. /usr/lib/android-sdk/licenses 
	
	cd hello-jni
	make
