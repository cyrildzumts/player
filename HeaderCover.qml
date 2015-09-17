import QtQuick 2.4

Item
{
    width: 150
    height: 62
    clip:true
    property alias source: cover1.source
    property alias standard: cover2.visible
    property bool vinylspin : false
    CoverItem
    {
        id:cover1
        width: parent.width * 0.5
        height: width
        anchors
        {
            centerIn: parent
            horizontalCenter: parent.horizontalCenter
            //leftMargin: width * 0.02
        }
    }

    CoverItem
    {
        id:cover2
        width: cover1.width
        height: width
        property int spin: 15
        source:"vinyl3.png"
        z: -1
        anchors
        {
            centerIn: parent
            horizontalCenter:parent.horizontalCenter
            horizontalCenterOffset: width / 2
        }
        RotationAnimation {
                id:rotator
               target: cover2;
               property: "rotation"
               loops: currentTrackInfos.duration
               from: 0;
               to: 360 ;
               //duration:  player.duration
               //running: true
           }
    }
    Connections
    {
        target: player
        onDurationChanged:
        {
            if(cover2.visible && vinylspin)
            {
                rotator.running = true
                console.log("Player Duration : " + player.duration)
            }
        }
    }

}
