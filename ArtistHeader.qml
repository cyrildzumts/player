import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

Rectangle
{
    id:headerContainer
    color: "#615C8D"
    anchors.fill: parent
    property int albumCount: 0
    Item
    {
        id:customCover
        width: parent.width *0.5
        height: parent.height
        anchors
        {
            top:parent.top
            left:parent.left
            bottom: parent.bottom
            //margins: units.gu(1)
        }
        HeaderCover
        {
            width: parent.width
            height: parent.height
            source: clickedItem.clickedArtist.cover
            standard: false
            anchors
            {
                centerIn: parent
            }
        }

    }

    Item
    {
        id:artistInfos
        width: parent.width - customCover.width
        height: parent.height
        anchors
        {
            top:parent.top
            right:parent.right
            bottom: parent.bottom
        }
        ColumnLayout
        {
            id:infoLayout
            width: parent.width
            //height: parent.height
            spacing:10
            anchors
            {
                centerIn:parent
                margins: units.gu(2)
            }
            Label
            {
                id:artistLabel
                width: parent.width
                text: clickedItem.clickedArtist.artist
                color: "#CEBFC5"
                Layout.maximumWidth: headerContainer.width / 2
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width * 0.8
                font
                {
                    pixelSize: units.gu(4)
                    bold: true


                }
            }

            Label
            {
                id:albumCountLabel
                width: parent.width
                text: albumCount > 1 ?  albumCount + " Albums": albumCount + " Album"
                color: "#CEBFC5"
                Layout.maximumWidth: headerContainer.width / 2
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width * 0.8
                font
                {
                    pixelSize: units.gu(3)
                    bold: true

                }
            }
        }
    }


}
