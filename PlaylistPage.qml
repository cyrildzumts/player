import QtQuick 2.4
import Ubuntu.Components 1.2


Page
{
    id:albumContents
    title: "PLAYLISTS"
    visible:false
    property alias color: rec.color
    Rectangle
    {
        id: rec
        color:"lightgreen"
        anchors
        {
            fill: parent
            //margins: units.gu(5)
        }
    }
}


