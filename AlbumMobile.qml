import QtQuick 2.4

Item {
    width: 100
    height: 62

    Component
    {
        id:listViewHeader
        Item
        {
            width: parent.width
            height: width + units.gu(7)


            Cover
            {
                id:coverHead
                displayAll: true
                width: parent.width
                height: width + units.gu(7)
                anchors.centerIn: parent
                textColor: "#CEBFC5"
                text1: clickedItem.clickedAlbum.title
                text2: clickedItem.clickedAlbum.artist + " - " + clickedItem.clickedAlbum.year + " - " + tracklist.count + " tracks"
                coverSize: parent.width
                source:clickedItem.clickedAlbum.cover
                anchors
                {
                    top:parent.top
                    left: parent.left
                    margins: 0
                }

            }
//            MouseArea
//            {
//                anchors.fill: parent
//                onClicked: navigationStack.pop()
//            }
        }
    }

    Item
    {
        id:pageContent
        anchors.fill: parent
        ListView
        {
            id:tracklist
            anchors.fill: parent
            clip: true
            header: listViewHeader
            //headerPositioning: ListView.PullBackHeader
            model: tmpListModel
            delegate: TrackDelegate{}
        }

    }
}
