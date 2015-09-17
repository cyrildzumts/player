import QtQuick 2.4
import Ubuntu.Components 1.2
Item
{
//    width: 100
//    height: 62
    anchors.fill: parent
    property alias  headerItem: header.children
    property alias tracklistItem: albumTracklist.children
    Item
    {
        id:header
        //width: parent.width
        height: parent.height / 2
        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
    Item
    {
        id:albumTracklist
        //width: parent.width
        height: parent.height - header.height
        anchors
        {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}
