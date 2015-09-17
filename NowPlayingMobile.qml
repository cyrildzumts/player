import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.2

Item
{
    id: container
    property int margin: 0
    property alias cover: npCover.children
    property alias playerBarContent: playerBar.children
    property alias metadata: metadataItem.children
    property alias tracklist: playlistContents.children


    function showTracklist(status)
    {

        if(status)
        {
            playlistContents.y = 0
        }
        else
        {
            playlistContents.y = container.height
        }
    }

    anchors.fill: parent
    ColumnLayout
    {
        id:phoneLayout
        height: parent.height
        width: parent.width
        spacing: units.gu(2)
        anchors
        {
            fill:parent
        }
        Item
        {
            id:npCover
            width: parent.width
            height: width
            Layout.fillWidth: true
            Layout.minimumWidth: units.gu(40)
            Layout.maximumWidth: units.gu(50)

            anchors
            {
                top:parent.top
                left: parent.left
                right:parent.right
            }
        }
        Item
        {
            id:metadataItem
            width: parent.width
            height: (parent.height - npCover.height) / 2
            Layout.fillWidth: true
            Layout.minimumWidth: units.gu(40)
            Layout.maximumWidth: units.gu(50)
            Layout.maximumHeight: units.gu(7)
            anchors
            {
                left:parent.left
                right: parent.right
                top: npCover.bottom
                margins: units.gu(1)
            }

        }
        Item
        {
            id:playerBar
            height: (parent.height - npCover.height) / 2
            width: parent.width
            Layout.fillWidth: true
            Layout.minimumWidth: units.gu(40)
            Layout.maximumWidth: units.gu(50)
            Layout.maximumHeight: units.gu(7)
            anchors
            {
                top: metadataItem.bottom
                left: parent.left
                right: parent.right
            }
        }
    } // ColumnLayout ends here

    Item
    {
        id:playlistContents
        height: parent.height
        width: parent.width
        y : parent.height
        clip: true
        anchors
        {
            left:parent.left
        }

        Behavior on y {
            NumberAnimation { duration: 500 }
        }

    }

}



