import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import Ubuntu.Components 1.2

Item
{
    id: containerTablet
    property int margin: units.gu(10)
    property alias cover: npCover.children
    property alias playerBarContent: playerBar.children
    property alias metadata: metadataItem.children
    property alias tracklist: playlistContents.children
    property alias  playlistHeader: header.children
    anchors.fill: parent
    ColumnLayout
    {
        id:tabletLayout
        height: parent.height - (playerBar.height + metadataItem.height)
        anchors
        {
            left:parent.left
            right: parent.right
            top: parent.top
            bottom: metadataItem.top
            margins : margin
        }
        GroupBox
        {
            id: mainItems
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            Layout.fillWidth: true
            Layout.fillHeight: true
            RowLayout
            {
                id:mainItemsLayout
                width: parent.width
                spacing: width * 0.05
                anchors
                {
                    fill: parent
                    margins:0
                }

                Item
                {
                    id:npCover
                    height: parent.height
                    width: parent.width * 0.5
                    //clip: true
                    //Layout.fillWidth: true
//                    Layout.minimumWidth: units.gu(40)
//                    Layout.maximumWidth: parent.width * 0.8
//                    Layout.minimumHeight: units.gu(40)
//                    Layout.maximumHeight: parent.width * 0.8
                    anchors
                    {

                        left: parent.left
                    }
                }

                Item
                {
                    id:playlistContents
                    height: parent.height
                    width: parent.width * 0.5
                    clip: true
//                    Layout.fillWidth: true
//                    Layout.fillHeight: true
//                    Layout.minimumWidth: units.gu(30)
//                    Layout.maximumWidth: units.gu(40)
//                    Layout.minimumHeight: units.gu(40)
//                    Layout.maximumHeight: units.gu(50)
                    anchors
                    {
                        right: parent.right
                    }
                     Item
                    {
                        id:header
                        width: parent.width
                        height: units.gu(4)
                        anchors
                        {
                            bottom: npTracklist.top
                            left: parent.left
                        }
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                if(playlistContents.y === 0)
                                {
                                    playlistContents.y = container.height - header.height
                                }
                                else
                                {
                                    playlistContents.y = 0
                                }
                            }
                        }

                    }
                    Item
                    {
                        id:npTracklist
                        width: parent.width
                        height: parent.height - header.height
                        anchors
                        {
                            //top: header.bottom
                            bottom: parent.bottom
                            left: parent.left
                        }
                    }

                }
            }
        }




    } // ColumnLayout ends here

    Item
    {
        id:metadataItem
        width: parent.width
        height: units.gu(7)
        anchors
        {
            bottom : playerBar.top
            bottomMargin: units.gu(3)
            left: parent.left
        }
    }
    Item
    {
        id:playerBar
        height: units.gu(10)
        width: parent.width
        anchors
        {

            bottom: parent.bottom
            left: parent.left
        }
    }

}




