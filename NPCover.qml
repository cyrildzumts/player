import QtQuick 2.4

Item
{
    width: parent.width
    height: parent.height
    property alias source: image.source
    anchors.centerIn: parent
    children: Image
    {
        id:image
        width: parent.width
        height:parent.height
        sourceSize:"500x500"
        source:"cover.jpg"
        anchors.centerIn:parent
    }
}

