import QtQuick 2.4
import Ubuntu.Components 1.2

Component
{
    id:artistItemDelegate
    ListItem
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



        Image
        {
            id: artistPic
            width: parent.height
            height: width
            source: cover
            fillMode: Image.PreserveAspectFit
            sourceSize: "500x500"
            mipmap: true
            anchors
            {
                left:parent.left
                bottom:parent.bottom
                top:parent.top
            }
        }
        Label
        {
            id:label
            width: parent.width - artistPic.width
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            text :  "  " +  artist
            anchors
            {
                left:artistPic.right
                verticalCenter: parent.verticalCenter
            }
        }

        onClicked:
        {

            clickedItem.clickedArtist.artist = artist
            clickedItem.clickedArtist.cover = cover
            navigationStack.push(Qt.resolvedUrl("ArtistPage.qml"))
        }

    }


}
