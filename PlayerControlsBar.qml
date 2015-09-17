import QtQuick 2.4
import QtQuick.Controls 1.3
import QtGraphicalEffects 1.0
import Ubuntu.Components 1.2 as Ubuntu

/****************************************************
 * Author   : Cyrille Ngassam Nkwenga
 * Email    : cyrildz@gmail.com
 * Date     : 01.05.2015
 * Component: ToolbarControls
 *
 * Description:
 * ToolbarControls controls the player and playlist through
 * its children :
 * - PlaybackControls, PlaybackMode, TrackProgressBar, and
 * the cover art of the current track.
 *
 * It is possible to blur the Bar, but for now I keep it deactivated since
 * the look and feel of the application is not improved when using it.
 */

Item
{
    id:toolbars
    property alias progBvisibility : trackProgression.visible
    property int ftSize: 13
    property alias coverpath: coverTrack.coverpath
    property alias position: trackProgression.position
    property alias duration: trackProgression.duration


    width: units.gu(108)
    height: units.gu(8)

    Image
    {
        id: background
        //source: themes.toolBar
        visible: false
        //sourceSize: "1980x64"
        //z: -1
        fillMode:Image.PreserveAspectCrop
        anchors.fill: parent

    }
    Item
    {
        id:toolbarContents
        //color: "transparent"
        anchors.fill: parent
        //visible: false

        Image
        {
            id:coverTrack
            //width:units.gu(6)
            property string coverpath
            height: parent.height
            width:height
            clip: true
            smooth: true
            source : player.cover === "" ? icons.nocover : player.cover

            //sourceSize:"500x500"

            //
            //fillMode:Image.PreserveAspectFit
            cache:false
            //asynchronous: true



            anchors
            {
                left: parent.left

                top:parent.top

                //horizontalCenter:parent.horizontalCenter
            }
        }





        PlaybackControls
        {
            id:controlsPlayback
            width: units.gu(10)
            height: 32
            anchors
            {
                left: coverTrack.right
                leftMargin : units.gu(2)
                rightMargin: units.gu(2)
                verticalCenter : parent.verticalCenter
            }

        }

        Item
        {
            id:progressBarContainer
            height: 50
            //color : "#2d2d2d"
            anchors
            {
                left: controlsPlayback.right
                leftMargin:units.gu(9)
                right : modePlayback.left
                rightMargin: units.gu(2)

                verticalCenter:controlsPlayback.verticalCenter

            }

            Item
            {
                id:metaData
                width: parent.width * 0.9
                height: 13
                anchors
                {
                    top:parent.top

                    topMargin: 2
                    horizontalCenter:parent.horizontalCenter

                }
                clip:true
                Label
                {


                    id:trackInfo

                    width: parent.width
                    //height: parent.height
                    font.bold: true
                    font.pixelSize: ftSize
                    color: colors.toolbarTextColor
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    fontSizeMode: Text.HorizontalFit
                    elide: Text.ElideRight

                    Connections
                    {
                        target: playlist
                        onCurrentMediaChanged:
                        {

                           trackInfo.text = (player.state === MusicPlayer.PlayingState | MusicPlayer.PausedState) ? (playlist.currentTitle+ " - " + playlist.currentArtist + " - " + playlist.currentAlbum) : ""

                        }

                    }


                }


            }
            TrackProgressBar
            {
                id:trackProgression
                width: parent.width
                height: 5


                anchors
                {
                    centerIn:parent
                }


            }

        }



        PlaybackMode
        {
            id:modePlayback
            //width: units.gu(30)
           // width: units.gu(20)
            //height:
            //isize: 28
            anchors
            {

                leftMargin: units.gu(2)
                right: parent.right
                //rightMargin: units.gu(0.5)
                verticalCenter : parent.verticalCenter
            }
        }

    }

}

