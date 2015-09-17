import QtQuick 2.4
import Ubuntu.Components 1.2
Item
{
    width: 100
    height: 62
    clip: true
    ListView
    {
        id:artistList
        anchors.fill: parent
        model:artistModel
        delegate: ArtistItemDelegate{}
    }
    Scrollbar {
           flickableItem: artistList
           align: Qt.AlignTrailing
           activeFocusOnPress:true
       }
}
