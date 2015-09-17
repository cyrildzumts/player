import QtQuick 2.4
import QtQuick.Controls 1.3
import Ubuntu.Components 1.2
import QtQuick.Layouts 1.1

Item
{
    width: parent
    height: 62
    //color:"#8F618F"
    //anchors.margins: units.gu(2)
    //border.color: "transparent"
    property alias model: albumlist.model
    Rectangle
    {
        id:headerContainer
        width: parent.width
        height: units.gu(6)
        anchors
        {
            top: parent.top
            left: parent.left
        }
        Row
        {
            id:tracklistHeader
            width: parent.width - 20
            height: units.gu(6)
            anchors.centerIn: parent
            spacing: 10
            Label
            {
                id:indexLabel
                width: units.gu(16)
                horizontalAlignment: Text.AlignLeft
                //verticalAlignment: Text.AlignVCenter
                text:"Cover"
                color: "#CEBFC5"
                font.bold: true
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    //left: parent.left
                    margins: units.gu(3)
                }
            }
            Label
            {
                id:titleLabel
                width: (parent.width  - units.gu(31) )* 0.6
                horizontalAlignment: Text.AlignLeft
                text:"Title"
                color: "#CEBFC5"
                font.bold: true
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    //left: parent.left
                    margins: units.gu(3)
                }
            }
            Label
            {
                id:lenghtLabel
                width: units.gu(8)
                horizontalAlignment: Text.AlignLeft
                text: "Duration"
                color: "#CEBFC5"
                font.bold: true
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    //left: parent.left
                    margins: units.gu(3)
                }
            }
            Label
            {
                id:genreLabel
                width: (parent.width  - units.gu(31) ) * 0.3
                horizontalAlignment: Text.AlignLeft
                text: "Genre"
                color: "#CEBFC5"
                font.bold: true
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    //left: parent.left
                    margins: units.gu(3)
                }
            }
            Label
            {
                id:yearLabel
                width: units.gu(7)
                horizontalAlignment: Text.AlignLeft
                text:"Year"
                color: "#CEBFC5"
                font.bold: true
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    //left: parent.left
                    margins: units.gu(3)
                }
            }

        }
        //children: tracklistHeader
    }


//    Scrollbar
//    {
//        flickableItem: albumlist
//        z:1
//        anchors
//        {
//            top:headerContainer.bottom
//            left: parent.left
//            right:parent.right
//            bottom: parent.bottom
//        }
        ListView
        {
            id:albumlist
            width: parent.width
            anchors
            {
                //fill:parent
                top:headerContainer.bottom
                left: parent.left
                right:parent.right
                bottom: parent.bottom
            }

            clip: true
            //model: tmpListModel
            delegate: AlbumArtistDelegate{}
        }
   // }





}
