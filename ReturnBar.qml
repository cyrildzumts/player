import QtQuick 2.4
import Ubuntu.Components 1.2
Item
{
    id:header
    height: units.gu(4)
    z:1
    anchors
    {
        top: parent.top
        left: parent.left
        right: parent.right
        margins: units.gu(2)
    }
    Icon
    {
        id:backIcon
        name: "back"
        width: units.gu(3)
        color: "#FAFAFA"
        height: width
        anchors
        {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: navigationStack.pop()
        }
    }
}
