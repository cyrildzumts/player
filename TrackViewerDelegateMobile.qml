import QtQuick 2.4
import Ubuntu.Components 1.2
import QtQuick.Layouts 1.1
import "TimeToString.js" as TimeString
Component
{
    id:trackDelegateTablet
    ListItem
    {
        id:item
        color:index % 2 === 0 ? "transparent" : "#208F618F"
        width:parent.width
        height:  units.gu(9)
        //anchors.margins: units.gu(2)
//        MouseArea
//        {
//            anchors.fill: parent
////            hoverEnabled: true
////            onEntered:
////            {
////                parent.textColor= "#DD4814"
////            }
////            onExited:
////            {
////                parent.textColor = "#2C001E"
////            }

            onClicked:
            {


            }
//        }
        Row
        {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            anchors.margins: units.gu(1)
            spacing: 4
            Image
            {
                id:albumCover
                width: parent.height
                height: width
                source: cover
                sourceSize: "500x500"
                fillMode: Image.PreserveAspectFit
                mipmap: true
//                Layout.fillWidth: false
//                Layout.fillHeight: false
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    bottom: parent.bottom
                    //margins: units.gu(3)
                }
            }
            Item
            {
                id:titleGroup
                width: parent.width - albumCover.width
                height: artistLabel.height + titleLabel.height
                //Layout.maximumWidth: units.gu(40)
                anchors
                {
                    //left:albumCover.right
                    verticalCenter: parent.verticalCenter
                }
                Label
                {
                    id:titleLabel
                    width: parent.width * 0.9

                    horizontalAlignment: Text.AlignLeft
                    elide: Text.ElideRight
                    color: "#FAFAFA"
                    fontSize: "medium"

                    //font.bold: true
                    text:title === "" ? "No Title available" : title
                    anchors
                    {
                        //left:indexLabel.right
                        top:parent.top
                        left: parent.left

                    }
                }
                Label
                {
                    id:artistLabel
                    width: parent.width
                    horizontalAlignment: Text.AlignLeft
                    elide: Text.ElideRight
                    color: "#FAFAFA"
                    fontSize: "small"
                    opacity: 0.5
                    text: artist === "" ? "name not available" : artist
                    anchors
                    {
                        top: titleLabel.bottom
                        left: parent.left

                    }
                }

            }


        }

  }

}
