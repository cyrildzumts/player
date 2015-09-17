import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import Ubuntu.Components 1.2
Page
{
    id: nowplayingPage
    title: width <= units.gu(50) ?  "Now Playing" : ""
    //anchors.fill: parent
    //anchors.margins: margin
    property bool revealTracklist: false
    head.foregroundColor:"#F5F5F8"
    head.actions: [
               Action {
                   id:mediaplaylistIcon
                   iconName: "media-playlist"
                   text: i18n.tr("Search")
                   onTriggered: revealTracklist = !revealTracklist
               },
               Action {
                    id:options
                   iconName: "navigation-menu"
                   text: i18n.tr("Contacts")
               }
           ]

    states:
        [
        State
        {
            name:"phoneUI50GU"
            when:  width <= units.gu(50)
            PropertyChanges
            {
                target: phoneUILoader
                sourceComponent: phoneUIComp
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
                sourceComponent: tabletUIComp
            }
        }

    ]
    ReturnBar
    {
        visible: parent.title === ""
    }

    Component
    {
        id:phoneUIComp
        NowPlayingMobile
        {
            id:npTest
            anchors.fill: parent
            cover: NPCover{source: player.cover}
            metadata: MetadataItem{width: parent.width}
            playerBarContent: ControlBar{width: parent.width; z:2}
            tracklist: NowPlayingTracklist
                {
                    anchors.fill: parent
                    color : "#8F618F"
                    itemModel: playlist
                }

            Connections
            {
                target:nowplayingPage
                onRevealTracklistChanged:
                {
                    npTest.showTracklist(revealTracklist)
                }
            }
        }
    }

    Component
    {
        id:tabletUIComp
        AlbumTablet
        {
            anchors.fill: parent
            headerItem: AlbumHeader
            {
                cover: playlist.cover
                vinylspin: true
                trackTitle: playlist.currentTitle

                albumTitle: playlist.currentAlbum
                artist: playlist.currentArtist
                year: playlist.currentYear
            }
            tracklistItem: AlbumTabletTracklist
            {
                width:parent.width
                height: parent.height
                anchors.fill: parent
                model: playlist
                delegate: NowPlayingTrackTabletDelegate{}
            }
        }
    }

//    Component
//    {
//        id:tabletUIComp
//        NowPlayingTablet
//        {
//            id:npTest
//            anchors.fill: parent
//            cover: NPCover{source: player.cover;width:  parent.width * 0.9; height: width; anchors.centerIn: parent}
//            metadata: MetadataItem{color: "#FC4859"}
//            playerBarContent: ControlBar{}
//            tracklist: NowPlayingTracklist
//            {
//                width: parent.width * 0.8
//                height: width
//                itemModel: playlist
//                anchors
//                {
//                    centerIn: parent
//                }

//                color : "#FC4859"
//            }
//        playlistHeader: Rectangle{width: parent.width * 0.8 ; color : "#AFAFAF"}
//        }
//    }
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
