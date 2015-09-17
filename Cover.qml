import QtQuick 2.4
import QtQuick.Controls 1.3
import Ubuntu.Components 1.2 as Ubuntu
import Ubuntu.Components.ListItems 1.0 as ListItem


/****************************************************
 * Author   : Cyrille Ngassam Nkwenga
 * Email    : cyrildz@gmail.com
 * Date     : 01.05.2015
 * Component: Cover
 *
 * Description:
 * Cover is a Component used to represent the cover art
 * of a track or of an album.
 * It is able to display the album's Info too , like :
 * the albumArtist , how many tracks the album contains,
 * the year of production ...
 *
 */

Item
{
    id:coverContainer

    property int  coverSize: units.gu(12)
    property alias source: cover.source
    property alias text1: albumInfo.text
    property alias text2: artistInfo.text
    property color textColor
    property alias color: titleRect.color
    width: coverSize
    height: width + units.gu(7)
    property alias displayAll: artistInfo.visible
    Image
    {
        id:cover
        mipmap: true
        cache: false
        antialiasing: true
        width: coverSize
        height: width
        sourceSize: "500x500"
        fillMode: Image.PreserveAspectFit
        anchors
        {
            //centerIn:parent
            top:parent.top
            left:parent.left
            //margins: units.gu(1)
        }
    }



    // The Rectangle here is used to theme the Cover.
    Rectangle
    {
        id:titleRect
        width: parent.width
        height: units.gu(6)
        color: "transparent"
        anchors
        {
            left:parent.left
            top:cover.bottom
            bottom: parent.bottom
            margins: units.gu(1)
        }

        Ubuntu.ListItem
        {
            id:tags2
            anchors.fill: parent

            Column
            {
                anchors.fill: parent
                Label
                {
                    text: text1
                    width: parent.width
                    elide: Text.ElideRight
                    fontSizeMode: Text.VerticalFit
                    color: textColor
                    font
                    {
                        pixelSize:13
                        bold:true
                    }
                }
                Label
                {
                    text:text2
                    width: parent.width
                    elide: Text.ElideRight
                    color: textColor
                    fontSizeMode: Text.VerticalFit
                    font
                    {
                        pixelSize:11
                    }
                }
            }
        }

        Column
        {
            id:tags
            anchors.fill: parent
            visible: false
            Label
            {
                id:albumInfo
                elide: Text.ElideRight
                fontSizeMode: Text.VerticalFit
                color: textColor
//                font
//                {
//                    pixelSize:12

//                }

                width: parent.width

                //horizontalAlignment: Text.AlignJustify

            }

            Label
            {
                id:artistInfo
                elide: Text.ElideRight
                width: parent.width
                color: textColor
                //visible: false
                horizontalAlignment: Text.AlignJustify

            }
        }


    }


}
