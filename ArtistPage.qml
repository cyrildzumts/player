import QtQuick 2.4
import Ubuntu.Components 1.2
import PlayerModules 1.0


Page
{
    id:artistContents
    title: width <= units.gu(50) ?  "Artist" : ""
    visible:false
    clip:true
    //anchors.fill: parent
    property int albumCount
    AlbumModel
    {
        id:artistAlbums
        Component.onCompleted:
        {
            queryArtistAlbum(clickedItem.clickedArtist.artist)
            albumCount = artistAlbums.rowCount()
        }
    }
    ReturnBar
    {
        visible: parent.title === ""
    }
    states:
        [
        State
        {
            name:"phoneUI50GU"
            when:  width <= units.gu(50)
            PropertyChanges
            {
                target: phoneUILoader
                sourceComponent: mobileComp
                visible:true
            }
            PropertyChanges
            {
                target: tabletUILoader
                sourceComponent: undefined
                visible: false
            }
        },
        State
        {
            name:"tabletUI90"
            when:  width > units.gu(50)
            PropertyChanges
            {
                target: phoneUILoader
                sourceComponent: undefined
                visible: false
            }
            PropertyChanges
            {
                target: tabletUILoader
                visible: true
                sourceComponent: tabletComp
            }
        }

    ]

    Component
    {
        id:mobileComp
        ArtistPageMobile
        {
            anchors.fill: parent
        }
    }
    Component
    {
        id:tabletComp
        ArtistPageTablet
        {
            anchors.fill: parent
            headerItem: ArtistHeader
            {
                albumCount: artistContents.albumCount
            }
           albumlistItem: ArtistAlbumList
            {
                width:parent.width
                height: parent.height
                anchors.fill: parent
                model: artistAlbums
            }
        }
    }

    Loader
    {
        id:tabletUILoader
        anchors.fill: parent
    }

    Loader
    {
        id:phoneUILoader
        anchors.fill: parent
    }

    
}


