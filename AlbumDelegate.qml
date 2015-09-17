import QtQuick 2.4

Component
{
    id:albumDelegate
    Cover
            {
            id:albumCover

            text1:title
            text2: artist
            source:coverpath // === "" ? icons.nocover : coverpath
            textColor:"#CEBFC5"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                onEntered:
                {
                    parent.textColor= "#2C001E"
                }
                onExited:
                {
                    parent.textColor = "#CEBFC5"
                }

                onClicked:
                {

                    clickedItem.clickedAlbum.title = title
                    clickedItem.clickedAlbum.cover = coverpath
                    clickedItem.clickedAlbum.artist = artist
                    clickedItem.clickedAlbum.year = year
                    navigationStack.push(Qt.resolvedUrl("AlbumPage.qml"))
                }
            }
        }
}
