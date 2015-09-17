# player
A Ubuntu Touch Music Player

Actually this is  UI part of the Player Project, a QML Music Player for Ubuntu Touch.
The project is plit into two parts :
* The UI part ( this one )
* The Logic Part.

The UI part needs the libPlayerModules.so ( the logic part) to be installed on one of the following path :
* /usr/lib/x86_64-linux-gnu/qt5/qml
* $HOME/.local/share

You can find the logic part here : https://github.com/cyrildzumts/playermodules.git.
 you need :
* Qt-Creator 
* Qt 5.4
* Taglib 
* C++ 11

A .pro file is uploaded so please, adjust the paths corresponding 
to your username. You may ask Qt Creator to recreate a Makefile ( it was automatically generated by Qt creator)
if you want that file.

For the UI part, you need the Ubuntu SDK UI 1.2 ( the one available on Ubuntu 15.04
