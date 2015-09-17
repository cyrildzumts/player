import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem
import PlayerModules 1.0
import "TimeToString.js" as TimeToString

MainView
{
    id:mainview
    width: units.gu(40)
    height: units.gu(73)
    applicationName: "PlayerDemo"
    headerColor: "#615C8D"
    backgroundColor: "#615C8D"
    footerColor: "#8F618F"
    CurrentTrackInfos
    {
        id:currentTrackInfos
    }

    ClickedItem
    {
        id:clickedItem
    }
    AppColors
    {
        id:colors
    }

    MusicDatabase
    {
        id:database

        Component.onCompleted:
        {
            launchScanThread()

        }
        onDatabaseChanged: albumModel.refresh()
        onPlaylistsModelChanged: playlistModel.refresh()
    }
    ArtistModel
    {
        id:artistModel
        Component.onCompleted:
        {
           refresh()
        }
    }

    TrackListModel
    {
        id:tmpListModel
    }

    PlaylistModel
    {
        id:playlistModel
        Component.onCompleted:
        {
            refresh()
        }
    }
    Playlist
    {
        id:playlist
        onCurrentIndexChanged:
        {
            console.log("currentIndex changed : " + index)
            //panel.source = playlist.cover
        }

        onCurrentMediaChanged:
        {
            console.log("currentMedia : " + mediaPath)
            player.setMedia(currentMedia)
            player.cover = playlist.cover
            panel.source = playlist.cover
            player.play()

        }
        onNomedia: player.stop()
    }

    MusicPlayer
    {
        id:player
        onMediaStatusChanged:
        {
            if(status === MusicPlayer.EndOfMedia)
            {
                playlist.next()
                print("MusicPlayer : end of media")

            }
        }
        onPositionChanged:
        {
            //print("Track Position : " + parseInt(position/1000))


            currentTrackInfos.position = position
            currentTrackInfos.positionStr = positionString


            if(parseInt(position/1000) === 30 )
            {
                database.playCountUp(playlist.currentTrackID())
            }

        }
        onDurationChanged:
        {
            currentTrackInfos.duration = duration
            currentTrackInfos.durationStr = TimeToString.msecsToString(duration)
        }

//        onDbusNextClicked: Utils.next()
//        onDbusPlayClicked: Utils.play()
//        onDbusPreviousClicked: Utils.previous()
    }

    AlbumModel
    {
        id: albumModel
        Component.onCompleted: refresh()
    }

    Item
    {
        id:pageStackContainer
        width: parent.width
        height: parent.height // - panel.height
        clip: true
        anchors
        {
            top:parent.top
            left:parent.left
            right:parent.right
            bottom:panel.top
        }
        PageStack
        {
            id: navigationStack

            anchors
            {
               fill:parent
            }

            Component.onCompleted: push(tabStack)

            Tabs
            {
                id:tabStack
                Tab
                {
                    id:startTab
                    title: "MUSIC HOME"
                    page: DefaultPage
                    {
                           // viewIndex : 1
                            //height: parent.height - panel.height
//                            anchors
//                            {
//                                top:parent.top
//                                left: parent.left
//                            }

                            visible:true
                    }


                }
                Tab
                {
                    id:playlistTab
                    title: "PLAYLISTS"
                }

                Tab
                {
                    id:recentlyTab
                    title: "LAST ACTIVITY"
                }
                Tab
                {
                    id:settingTab
                    title: "SETTINGS"
                }

            }



        }

    }


    NowPlayingPage
    {
        id:nowPlayingPage
        visible: false
        onWidthChanged:
        {

            console.log("Now Playing Page visible : " + visible)

            console.log("Panel visible : " + panel.visible)



        }


    }

    ControlsPanel
    {
        id:panel
        width: parent.width
        z: 5
        visible : !(nowPlayingPage.visible && width <= units.gu(50))
        anchors
        {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

}
