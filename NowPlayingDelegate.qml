import QtQuick 2.4
import Ubuntu.Components 1.2

Component
{
    id:trackListDelegate
    ListItem
    {
        id:trackItem
        //color:"tran"
        width:parent.width
        highlightColor: "#6F807E"
//            divider
//            {
//                colorFrom: colors.listItemDividerColor
//                colorTo: colors.listItemDividerColor
//            }

    Label
    {
        id:label
        width: parent.width * 0.9
        elide: Text.ElideRight
       // horizontalAlignment: Text.AlignHCenter
        font.bold: trackID === playlist.currentTrackID() ? true : false
        text : (index + 1)  + " - " +  title + "\n" + artist
        anchors.centerIn: parent
    }

    onClicked:
    {
        playlist.currentIndex = index
        panel.source = playlist.cover
        console.log("Playlist has changed")

    }
  }

}
