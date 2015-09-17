import QtQuick 2.4

Item
{
    width: 100
    height: 62
    property alias model: tracklist.model
    property alias delegate : tracklist.delegate

    Component
    {
        id:listViewHeader
        Rectangle
        {
            width: parent.width
            height: units.gu(8)
        }
    }


    ListView
    {
        id:tracklist
        anchors
        {
            fill: parent
            margins: units.gu(1)
        }
        clip: true
        //header: listViewHeader
        //headerPositioning: ListView.PullBackHeader

    }


}
