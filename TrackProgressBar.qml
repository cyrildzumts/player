import QtQuick 2.3
import QtQuick.Controls 1.3
import QtGraphicalEffects 1.0
import Ubuntu.Components 1.2 as Ubuntu
import PlayerModules 1.0


/****************************************************
 * Author   : Cyrille Ngassam Nkwenga
 * Email    : cyrildz@gmail.com
 * Date     : 01.05.2015
 * Component: TrackProgressBar
 *
 * Description:
 * TrackProgressBar  represents the current track progression.
 * It allows the user to seek the current track to a position
 */

Item
{
    id:trProBar
    height: 10
    width: units.gu(20)
    property real barHeight: 3
    property int duration  // time in ms
    property int minValue: 0.0
    property int position

    Label
    {
        id:timePlay


        font.pixelSize: 12
        font.italic: true
        font.bold:true
        color : colors.toolbarTextColor
        z:9
        anchors
        {
            horizontalCenter:backBar.horizontalCenter
            verticalCenter:backBar.verticalCenter
            verticalCenterOffset: 7

        }
    }

    Rectangle
    {
        id: backBar
        width: parent.width
        height: barHeight
        color : colors.progressBarBGColor
        anchors
        {
            centerIn:parent
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                player.position =  (mouseX/parent.width) * player.duration
            }

        }


        Rectangle
        {
            id:frontBar
            color: colors.progressBarFGColor
            height : barHeight
            //width:(player.state === player.StoppedState) ? (0) : (position / duration ) * backBar.width
            z: 5
            anchors
            {
                left:parent.left
                top:parent.top
                bottom:parent.bottom
            }

            Rectangle
            {
                id:glow
                width: units.gu(0.5)
                height: parent.height
                radius: 10
                anchors
                {
                    right:parent.right
                    top:parent.top
                }
                visible: false
            }

            RectangularGlow
            {
                id:glowBar
                anchors.fill: glow
                glowRadius: 3
                spread: 0.5
                cornerRadius: glow.radius + glowRadius
                color :"#398B9A"
            }

            Connections
            {
                target: player
                onDurationChanged:
                {

                    duration: player.duration

                }
                onPositionChanged:
                {
                    position: player.position
                    timePlay.text = (player.state === player.StoppedState) ?  "":(player.positionString + " → " + player.durationString)
                    frontBar.width = (player.position / player.duration ) * backBar.width

                }
                onStateChanged:
                {
                    if(  player.state ===  MusicPlayer.StoppedState )
                    {
                        frontBar.width = 0
                        print("TrackProgressBar : player has stopped")
                    }
                }
            }


        }

    }

}
