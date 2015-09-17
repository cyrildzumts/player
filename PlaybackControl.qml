import QtQuick 2.4
import Ubuntu.Components 1.2 as Ubuntu
import PlayerModules 1.0
import "Utils.js" as Utils

/****************************************************
 * Author   : Cyrille Ngassam Nkwenga
 * Email    : cyrildz@gmail.com
 * Date     : 01.05.2015
 * Component: PlaybackControls
 *
 * Description:
 * PlaybackControls controls the player through
 * play(), previous() and next()
 * play() calls the Player.play() method.
 * previous() and next() call the playlist's methods
 */
Row
{
    id:playbackControls
    property real isize: units.gu(4)
    spacing: units.gu(2)
    width: units.gu(15)
    height: units.gu(1)



            SimpleIcon
                {
                    id:backwards
                    width: isize
                    height: isize
                    //source: icons.previous
                    name:"media-skip-backward"
                    //sourceSize: "128x128"
                    smooth: true
                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked:
                        {
                            Utils.previous()

                        }


                    }

                }

            SimpleIcon

                {
                    id:start
                    width: isize
                    height: isize
                    //source: icons.play
                    name:"media-playback-start"
                    //border.color: "white"
                    Connections
                    {
                        target: player
                        onStateChanged:
                        {
                            if( (player.state === MusicPlayer.PausedState) || (player.state ===  MusicPlayer.StoppedState))
                            {

                                start.name = "media-playback-start"


                            }

                            else
                            {

                                start.name = "media-playback-pause"

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

            SimpleIcon
                {
                    id:forwards
                    width: isize
                    height: isize
                    //source:icons.next
                    name:"media-skip-forward"
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                           playlist.goToNextIndex()
                        }
                    }

                }

}
