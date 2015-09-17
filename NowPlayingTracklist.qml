import QtQuick 2.4
import QtQuick.Controls 1.3
import Ubuntu.Components 1.2 as Ubuntu
import "Utils.js" as Utils
Rectangle {
    width: 100
    height: 62
    property var itemModel

    Component
    {
        id:modelDelegate
        Ubuntu.ListItem
        {
                    id:item
                    //color:"tran"
                    width:parent.width
                    highlightColor: "#6F807E"
        //            divider
        //            {
        //                colorFrom: colors.listItemDividerColor
        //                colorTo: colors.listItemDividerColor
        //            }

        //            trailingActions: TrackActionLIstTrail
        //            {
        //            id:trails
        //            songID: trackID

        //        }

                Label
                {
                    id:label
                    width: parent.width * 0.9
                    elide: Text.ElideRight
                   // horizontalAlignment: Text.AlignHCenter
                    font.bold: trackID === playlist.currentTrackID() ? true : false
                    text : (index + 1)  + " - " +  title
                    color: "white"
                    anchors.centerIn: parent
                }

                onClicked:
                {

                    itemModel.setCurrentIndex(index)
                }

        }
    }

    ListView
    {
        id:listTracks
        width: parent.width
        height: parent.height
        //clip: true
        maximumFlickVelocity: 300
        flickDeceleration : 500
        //rebound: ReboundTransition{}
        model : itemModel
        delegate: modelDelegate
    }

}


