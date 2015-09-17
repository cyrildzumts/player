import QtQuick 2.4
import Ubuntu.Components 1.2
import QtQuick.Layouts 1.1
import "TimeToString.js" as TimeString
Component
{
    id:trackDelegateTablet
    Rectangle
    {
        id:item
        color:index % 2 === 0 ? "transparent" : "#208F618F"
        width:parent.width
        height: units.gu(16)
        //anchors.margins: units.gu(2)
        MouseArea
        {
            anchors.fill: parent
//            hoverEnabled: true
//            onEntered:
//            {
//                parent.textColor= "#DD4814"
//            }
//            onExited:
//            {
//                parent.textColor = "#2C001E"
//            }

            onClicked:
            {

                clickedItem.clickedAlbum.title = title
                clickedItem.clickedAlbum.cover = coverpath
                clickedItem.clickedAlbum.artist = artist
                clickedItem.clickedAlbum.year = year
                navigationStack.push(Qt.resolvedUrl("AlbumPage.qml"))
            }
        }
        Row
        {
            width: parent.width
            height: parent.height - 20
            anchors.centerIn: parent
            //anchors.margins: units.gu(1)
            spacing: 10
            Image
            {
                id:albumCover
                width: units.gu(16)
                height: width
                source: coverpath
                fillMode: Image.PreserveAspectFit
                mipmap: true
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    //left: parent.left
                    //margins: units.gu(3)
                }
            }
            Label
            {
                id:titleLabel
                width: (parent.width  - units.gu(31) )* 0.6
                horizontalAlignment: Text.AlignLeft
                elide: Text.ElideRight
                color: "#CEBFC5"

                text:title
                anchors
                {
                    //left:indexLabel.right
                    verticalCenter: parent.verticalCenter
                }
            }
            Label
            {
                id:lenghtLabel
                width: units.gu(8)
                horizontalAlignment: Text.AlignLeft
                color: "#CEBFC5"
                text: TimeString.msecsToString( duration * 1000)

                anchors
                {
                    //left: titleLabel.right
                    //horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
            Label
            {
                id:genreLabel
                width: (parent.width  - units.gu(31) ) * 0.3
                horizontalAlignment: Text.AlignLeft
                color: "#CEBFC5"

                text: genre
                anchors
                {
                    //horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
            Label
            {
                id:yearLabel
                width: units.gu(7)
                horizontalAlignment: Text.AlignLeft
                color: "#CEBFC5"
                text:year === 0 ? "-" : year

                anchors
                {
                    //horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }

        }

  }

}
