import QtQuick 2.3
import Ubuntu.Components 1.2 as Ubuntu

/****************************************************
 * Author   : Cyrille Ngassam Nkwenga
 * Email    : cyrildz@gmail.com
 * Date     : 01.05.2015
 * Component: SimpleIcon
 *
 * Description:
 * SimpleIcon is a a Item that represent a circular Icon.
 */

Rectangle
{
    id:iconContainer
    width: units.gu(7)
    height: width
    antialiasing: true
    color: "transparent"

    property alias source: icon.source
    property alias  name:  icon.name
    property alias iconColor: icon.color
    property real iconSize: width - 8
    property real hOffset : 0

    border
    {
        color: colors.circleColor
        width: 1
    }
    radius: width*0.5
    clip:true
    smooth: true
    Ubuntu.Icon
    {
        id:icon
        width: iconSize
        color: "#FAFAFA"
        antialiasing: true
        smooth: true
        height: iconSize
        //color: "#514E64"
        //keyColor: "#398B9A"
        //fillMode: Image.PreserveAspectFit
        anchors
        {
            centerIn:parent
            horizontalCenterOffset: hOffset
        }

    }

}
