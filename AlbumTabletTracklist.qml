import QtQuick 2.4
import QtQuick.Controls 1.3
import Ubuntu.Components 1.2
import QtQuick.Layouts 1.1

Item
{
    width: parent
    height: 62
    property alias model: tracklist.model
    property alias delegate: tracklist.delegate
    //color:"#8F618F"
    //anchors.margins: units.gu(2)
    //border.color: "transparent"
    Rectangle
    {
        id:headerContainer
        width: parent.width
        height: units.gu(6)
        color: "#A022313F"
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

            Label
            {
                id:indexLabel
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                //verticalAlignment: Text.AlignVCenter
                text:"Position"
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
                width: parent.width * 0.6
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
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                text: "Lenght"
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
                id:bitrateLabel
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                text: "Bitrate"
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
                id:playcountLabel
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                text:"Play Count"
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
//        flickableItem: tracklist
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
            id:tracklist
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
            model: tmpListModel
            delegate: TrackDelegateTablet{}
        }
   // }
}
