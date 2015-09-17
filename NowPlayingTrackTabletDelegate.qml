import QtQuick 2.4
import Ubuntu.Components 1.2
import QtQuick.Layouts 1.1
import "TimeToString.js" as TimeToString
Component
{
    id:trackDelegateTablet
    Rectangle
    {
        id:item
        color:index % 2 === 0 ? "transparent" : "#208F618F"
        width:parent.width
        height: units.gu(7)
        anchors.margins: units.gu(2)
        Row
        {
            width: parent.width - 20
            height: parent.height
            anchors.centerIn: parent
            Label
            {
                id:indexLabel
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                color: "#CEBFC5"
                text:index + 1
                font.bold: trackID === playlist.currentTrackID() ? true : false
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
                elide: Text.ElideRight
                color: "#CEBFC5"
                font.bold: trackID === playlist.currentTrackID() ? true : false
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
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                color: "#CEBFC5"
                text: TimeToString.msecsToString( length * 1000)
                font.bold: trackID === playlist.currentTrackID() ? true : false
                anchors
                {
                    //left: titleLabel.right
                    //horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
            Label
            {
                id:bitrateLabel
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                color: "#CEBFC5"
                font.bold: trackID === playlist.currentTrackID() ? true : false
                text: bitrate + " kbps"
                anchors
                {
                    //horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
            Label
            {
                id:playcountLabel
                width: parent.width * 0.1
                horizontalAlignment: Text.AlignLeft
                color: "#CEBFC5"
                text:playcount
                font.bold: trackID === playlist.currentTrackID() ? true : false
                anchors
                {
                    //horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }

        }


        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                playlist.currentIndex = index
                panel.source = playlist.cover
                console.log("Playlist has changed")
            }
        }

  }

}
