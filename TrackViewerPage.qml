import QtQuick 2.4
import Ubuntu.Components 1.2
import PlayerModules 1.0


Item
{
    id:albumContents
    //title:  width <= units.gu(50) ? "All Tracks" : ""
    width: 100
    height: 62
    //visible:false
    clip:true
    //flickable: true
    TrackListModel
    {
        id:allTrackModel

    }

    Component.onCompleted:  allTrackModel.queryAllTracks()
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
    ReturnBar
    {
        visible: parent.title === ""
    }

    Component
    {
        id:mobileComp
        TrackViewerMobile
        {
            anchors.fill: parent
            model: allTrackModel
            delegate: TrackViewerDelegateMobile{}
        }
    }
    Component
    {
        id:tabletComp
        TrackViewerTablet
        {
            anchors.fill: parent
//            headerItem: AlbumHeader
//            {
//                    cover: clickedItem.clickedAlbum.cover
//            }
            tracklistItem: TrackViewerMobile
            {
                width:parent.width
                height: parent.height
                anchors.fill: parent
                model: allTrackModel
                delegate: TrackViewDelegate{}
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


