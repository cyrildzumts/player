import QtQuick 2.0
import Ubuntu.Components 1.2
Rectangle
{
    id:controlsPanelItem
    width: 100
    height: units.gu(7)
    property string source
    states:
        [
        State
        {
            name:"phoneUI50GU"
            when:  width <= units.gu(50)
            PropertyChanges
            {
                target: phoneUILoader
                sourceComponent: playermobilComp
                visible:true
            }
            PropertyChanges
            {
                target: tabletUILoader
                sourceComponent: undefined
                visible: false
            }
        },
        State
        {
            name:"tabletUI90"
            when:  width > units.gu(50)
            PropertyChanges
            {
                target: phoneUILoader
                sourceComponent: undefined
                visible: false
            }
            PropertyChanges
            {
                target: tabletUILoader
                visible: true
                sourceComponent: playertabletComp
            }
        }

    ]
    Component
    {
        id:playermobilComp
        PlayerPanel
        {
            id:panel
            height: units.gu(7)
            //width: parent.width
            source: controlsPanelItem.source

            anchors
            {
                fill: parent
//                left:parent.left
//                //right:parent.right
//                bottom: parent.bottom
            }
           onClicked:
           {

               navigationStack.push(nowPlayingPage)
           }
        }
    }
    Component
    {
        id:playertabletComp
        ControlBar
        {
            id:playerBar
            anchors.fill: parent
        }
    }


    Loader
    {
        id:tabletUILoader
        anchors
        {
            fill:parent
        }
    }

    Loader
    {
        id:phoneUILoader
        anchors
        {
            fill:parent
        }
    }

}
