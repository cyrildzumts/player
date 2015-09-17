import QtQuick 2.0
import Ubuntu.Components 1.2

Icon
{
    id:icon
    property real iconSize: units.gu(2)
    width: iconSize
    z:1
    antialiasing: true
    smooth: true
    height: iconSize
    name: "back"
    color: "#514E64"
    keyColor: "#398B9A"
    //fillMode: Image.PreserveAspectFit
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            navigationStack.pop()
        }
    }

}
