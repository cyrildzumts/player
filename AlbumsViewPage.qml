import QtQuick 2.4

Item
{

    width: 100
    height: 62

    //anchors.fill: parent
    GridView
    {
        id:albumView
        //header: Rectangle {width: parent.width; height: units.gu(7); color: colors.leftBarItemHeaderTextColor}
//        width: parent.width
//        height: parent.height
        anchors.fill: parent
        maximumFlickVelocity: 500
        flickDeceleration : 500
        contentWidth: width
        contentHeight: height
        cellWidth: units.gu(13)
        cellHeight: units.gu(19)
        model : albumModel
        delegate: AlbumDelegate{}
    }
}
