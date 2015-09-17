import QtQuick 2.4
import QtGraphicalEffects 1.0
import Ubuntu.Components 1.2 as Ubuntu
import PlayerModules 1.0
Rectangle
{
    id: backBar
    width: parent.width
    height: barHeight
    color : "#DCE0E0"
    property real barHeight: 3
    property int duration  // time in ms
    property int minValue: 0.0
    property int position
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
        color: "#8F618F"
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
            color :"#CEBFC5"
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
