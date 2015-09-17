import QtQuick 2.4
import  Ubuntu.Components 1.2 as Ubuntu
import QtQuick.Controls 1.3
Rectangle {
    width: 100
    height: 62
    Item
    {
        id: innerPage
        anchors
        {
            fill: parent
        }

        Item
        {
            id:header
            width: parent.width * 0.9
            height: width
            anchors
            {
                top:parent.top
                left:parent.left
                right:parent.right
            }
            Image
            {
               id:artistCover
               width: parent.width * 0.9
               height: width
               source: clickedItem.clickedArtist.cover
               sourceSize: "500x500"
               fillMode: Image.PreserveAspectFit
               mipmap: true
               anchors.centerIn: parent
            }

            Rectangle
            {
                id:artistInfos
                width: parent.width
                height: artistCover.height * 0.4
                color : "#A0000000"
                anchors
                {
                    left:parent.left
                    bottom : parent.bottom
                }

                Column
                {
                    anchors.centerIn: parent
                    Label
                    {
                        text: clickedItem.clickedArtist.artist
                        color: "#DDE1E1"
                    }

                    Label
                    {
                        text : albumArtistView.count + " Album(s)"
                        color: "#DDE1E1"
                    }
                }
            }
        }

        Item
        {
            id:artistAlbumList
            width: parent.width
            height: parent.height * 0.5
            anchors
            {
                top:header.bottom
                topMargin : units.gu(5)
                left:parent.left
                leftMargin : units.gu(1)
                bottom:parent.bottom
            }

            clip : true
            ListView
            {
                id:albumArtistView
                width: parent.width
                height: parent.height
                spacing: units.gu(1)
                orientation: ListView.Horizontal
                anchors
                {
                    centerIn: parent
                }

                model:artistAlbums
                delegate: AlbumDelegate{}

            }
        }
    }
}
