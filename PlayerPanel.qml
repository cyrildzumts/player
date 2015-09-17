import QtQuick 2.4
import Ubuntu.Components 1.2
import PlayerModules 1.0
import "Utils.js" as Utils
Item {
    id:panelItem
    width: units.gu(40)
    height: units.gu(7)
    signal clicked()
    property alias source: trackCover.source
    Rectangle {
        anchors.fill: parent
        color: "#403E6E"
        //color: "#22313F"
        clip:true
        MouseArea
        {
            anchors.fill: parent
            onClicked:panelItem.clicked()
        }

        CoverItem
        {
            id:trackCover
            height: parent.height
            width: height
            //sourceSize: "500x500"
            anchors
            {
                left:parent.left
                //bottom:parent.bottom
                verticalCenter : parent.verticalCenter
            }
        }
        Column
        {
            id:trackTitle
            height: parent.height
            width: parent.width
            spacing: units.gu(1)
            anchors
            {
                left: trackCover.right
                leftMargin : units.gu(2)
                //bottom: parent.bottom
                verticalCenter : parent.verticalCenter
            }
            Connections
            {
                target: playlist
                onCurrentMediaChanged:
                {
                    title.text = playlist.currentTitle
                    artist.text = playlist.currentArtist
                }
            }

            Label
            {
                id:title
                width: parent.width * 0.7
                elide: Text.ElideRight
                text: playlist.currentTitle
                color: "#CEBFC5"
            }
            Label
            {
                id:artist
                width: parent.width * 0.7
                elide: Text.ElideRight
                text: playlist.currentArtist
                color: "#CEBFC5"
            }
        }

        SimpleIcon

        {
            id:playControl
            width: units.gu(3)
            focus: true
            //source: icons.play
            name:"media-playback-start"
            border.color: "#8F618F"
            anchors
            {
                right: parent.right
                rightMargin : units.gu(2)
                //bottom: parent.bottom
                verticalCenter : parent.verticalCenter
            }
            Connections
            {
                target: player
                onStateChanged:
                {
                    if( (player.state === MusicPlayer.PausedState) || (player.state ===  MusicPlayer.StoppedState))
                    {

                        playControl.name = "media-playback-start"


                    }

                    else
                    {

                        playControl.name = "media-playback-pause"

                    }
                }
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    Utils.play()
                }
            }
        }
    }

}
