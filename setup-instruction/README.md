# Flutter SDK Setup for MACos 🖥

[Get Android Studio](https://developer.android.com/studio?gclid=CjwKCAjwgr6TBhAGEiwA3aVuIXUs2UIHDcyMlZpWjHLOITDyhWE8D77jXdrMOGznhSSpkTG-LhXEkBoCcmMQAvD_BwE&gclsrc=aw.ds)
[Get the Flutter SDK](https://docs.flutter.dev/get-started/install/macos#androi)

## Issues I encountered during installation 🤷🏻‍♂️

### Flutter command not found 🤬

I directly added it to the path file permanently.
>sudo nano /etc/paths

If flutter was unziped in ~/Development, add this to the file:
> /Users/enterYourUserName/Development/flutter/bin

Otherwise:
> /yourPath/flutter/bin

Save the file by pressing Ctrl + X, Y and then Enter. Close the terminal and reopen it again.

### Flutter doctor Error 🏥

#### Android sdkmanager tool not found

#### Flutter doctor results with "cmdline-tools component is missing"

I solved these both problems like this, I have Android Studio installed, ***the key is*** to install Android SDK Command-line Tools, steps being:

1. Open Android Studio
2. Tools Menu, SDK Manager
3. In the window that comes up there are inner panels, choose **SDK Tools** panel
4. Select Android **SDK Command-line Tools**
5. Choose **Apply** button near the bottom of the window

At that point, you will be prompted to accept the SDK license and the command line tools will be installed. Your license issue should now be resolved.

### Android license status unknown 🤨

run this command
> flutter doctor --android-licenses

and then accept license by pressing Y.

### Cocoapods not installed 🥥

run this command
> sudo gem install cocoapods
