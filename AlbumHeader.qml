import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

Rectangle
{
    id:headerContainer
    color: "#615C8D"
    anchors.fill: parent
    property alias  standard   : headerCover.standard
    property alias vinylspin: headerCover.vinylspin
    property alias trackTitle: trackTitleLabel.text
    property alias cover: headerCover.source
    property alias albumTitle: albumLabel.text
    property alias artist: artistLabel.text
    property alias year: yearLabel.text
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
            id:headerCover
            width: parent.width
            height: parent.height
            //source: clickedItem.clickedAlbum.cover
            anchors
            {
                centerIn: parent
            }
        }

    }

    Item
    {
        id:albumInfos
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
            }Label
            {
                id:trackTitleLabel
                width: parent.width
                visible: headerCover.vinylspin
                color: "#CEBFC5"
                Layout.maximumWidth: headerContainer.width / 2
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width * 0.8
                font
                {
                    pixelSize: parent.width * 0.05 // units.gu(4)
                    bold: true


                }
            }
            Label
            {
                id:albumLabel
                width: parent.width
                text: clickedItem.clickedAlbum.title
                color: "#CEBFC5"
                Layout.maximumWidth: headerContainer.width / 2
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width * 0.8
                font
                {
                    pixelSize:parent.width * 0.04
                    bold: true


                }
            }
            Label
            {
                id:artistLabel
                width: parent.width
                text:clickedItem.clickedAlbum.artist
                color: "#CEBFC5"
                Layout.maximumWidth: headerContainer.width / 2
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width * 0.8
                font
                {
                    pixelSize: parent.width * 0.04
                }
            }
            Label
            {
                id:yearLabel
                width: parent.width
                text: clickedItem.clickedAlbum.year === 0 ? "-" : clickedItem.clickedAlbum.year
                color: "#CEBFC5"
                Layout.maximumWidth: headerContainer.width / 2
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width * 0.8
                font
                {
                    pixelSize: parent.width * 0.03
                    bold: true

                }
            }
        }
    }


}
