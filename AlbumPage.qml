import QtQuick 2.4
import Ubuntu.Components 1.2


Page
{
    id:albumContents
    title:  width <= units.gu(50) ? "Album" : ""

    visible:false
    clip:true
    //flickable: true
    Component.onCompleted:
    {
        console.log("Album Page created")
        tmpListModel.refresh(clickedItem.clickedAlbum.title)
    }
    Component.onDestruction:
    {
        console.log("AlbumPage destroyed")
        tmpListModel.reset()
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
    ReturnBar
    {
        visible: parent.title === ""
    }

    Component
    {
        id:mobileComp
        AlbumMobile
        {
            anchors.fill: parent
        }
    }
    Component
    {
        id:tabletComp
        AlbumTablet
        {
            anchors.fill: parent
            headerItem: AlbumHeader
            {
                    cover: clickedItem.clickedAlbum.cover
            }
            tracklistItem: AlbumTabletTracklist
            {
                width:parent.width
                height: parent.height
                anchors.fill: parent
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


