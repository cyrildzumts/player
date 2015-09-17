import QtQuick 2.4
import QtQuick.Controls 1.3
import Ubuntu.Components 1.2
Item
{
    id:metadataItem
    width: units.gu(50)
    height: units.gu(7)
    anchors.centerIn: parent
    property string title: playlist.currentTitle
    property string artist: playlist.currentArtist
    property string album: playlist.currentAlbum

        Column
        {
            id:columnPhone
            spacing: 5
            width: parent.width
            anchors.centerIn: parent
            Label
            {
                text: title
                color: "white"
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
            }
            Label
            {
                text: artist + " - " + album
                color:"white"
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
            }
        }
}

