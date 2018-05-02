all: build deploy 
MK_ANDROID_PLATFORM=android-23
MK_ANDROID_BUILD_TOOLS=24.0.2


.PHONY : build
.PHONY : deploy
.PHONY : clean

deploy :
	adb install -r ./bin/hellojni.apk

build : ./bin/hellojni.apk

./bin/%.apk :  ./bin/%.signed.apk
	zipalign -v -f 4 $< $@
	
./bin/%.signed.apk :  ./bin/%.unsigned.apk ./app.keystore
	jarsigner -verbose -keystore ./app.keystore -storepass armena -keypass armena -signedjar $@ $< hellojniKey
		
./bin/%.unsigned.apk : ./bin/classes.dex ./lib/arm64-v8a/libhello.so
	aapt package -v -f -M ./AndroidManifest.xml -S ./res \
		-I $(ANDROID_HOME)/platforms/${MK_ANDROID_PLATFORM}/android.jar \
		-F $@ ./bin
	rm -rf lib
	cp -r libs lib
	aapt add $@ lib/armeabi-v7a/libhello.so
	aapt add $@ lib/mips64/libhello.so
	aapt add $@ lib/arm64-v8a/libhello.so
	aapt add $@ lib/x86_64/libhello.so
	aapt add $@ lib/armeabi/libhello.so
	aapt add $@ lib/x86/libhello.so
	aapt add $@ lib/mips/libhello.so

		
./bin/classes.dex : ./obj/com/example/hellojni/HelloJNI.class
	mkdir -p bin
	$(ANDROID_HOME)/build-tools/${MK_ANDROID_BUILD_TOOLS}/dx --dex --verbose --output=$@ ./obj
	
./lib/arm64-v8a/libhello.so :
	ndk-build
		
./src/com/example/hellojni/R.java : $(shell find ./res -type f)
	aapt package -v -f -m  -S ./res -J ./src -M ./AndroidManifest.xml \
	-I $(ANDROID_HOME)/platforms/${MK_ANDROID_PLATFORM}/android.jar

./obj/com/example/hellojni/HelloJNI.class : src/com/example/hellojni/HelloJNI.java  src/com/example/hellojni/R.java
	javac -source 7 -target 7 -d ./obj -classpath $(ANDROID_HOME)/platforms/${MK_ANDROID_PLATFORM}/android.jar -sourcepath ./src $<
	
./app.keystore : 
	keytool -genkeypair -validity 1000 -dname "CN=some company,O=Android,C=JPN" -keystore $@ \
	-storepass armena -keypass armena -alias hellojniKey -keyalg RSA -v
	
clean:
	rm -rf ./bin/* ./obj ./libs
