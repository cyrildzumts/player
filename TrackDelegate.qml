import QtQuick 2.4
import Ubuntu.Components 1.2

Component
{
    id:trackDelegate
    ListItem
    {
        id:item
        color: index % 2 == 0 ? "#202C3E50" : "transparent"
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
        text : (index + 1)  + " - " +  title
        anchors.centerIn: parent
    }

    onClicked:
    {
        playlist.setTracklist(tmpListModel.getModel())
        playlist.currentIndex = index
        player.setMedia(playlist.currentMedia)
        player.play()
        console.log("TrackDelegate: item clicked")
    }
  }

}
