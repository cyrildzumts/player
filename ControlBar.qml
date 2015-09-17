import QtQuick 2.4
import Ubuntu.Components 1.2
import QtQuick.Layouts 1.1
import PlayerModules 1.0
import "Utils.js" as Utils
Rectangle
{
    width: units.gu(50)
    height: units.gu(7)
    //property alias progressBar: progression.children
    color: "#403E6E"
    //color: "#22313F"
    states:[
        State
        {
            name:"tabletMode"
            when: width > units.gu(50)
            PropertyChanges
            {
                target: barContainer
                state:"tabletMode"
            }
            PropertyChanges
            {
                target: controlsBar
                state:"tabletMode"
            }
        }

    ]
    Item
    {
        id:barContainer
        height: parent.height
        anchors
        {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        transitions: Transition {
            AnchorAnimation {}

        }
        states:[
            State
            {
                name:"tabletMode"
                ParentChange
                {
                    target: barContainer
                    parent: controlsBar
                }
                PropertyChanges
                {
                    target: barContainer
                    width: parent.width
                    height: units.gu(7)

                    anchors
                    {
                        leftMargin:15
                        rightMargin : 15
                    }

                    Layout.fillWidth: false
                    Layout.minimumWidth: units.gu(4)
                    Layout.preferredWidth: parent.width * 0.8
                    //Layout.preferredHeight: 3


                }

                AnchorChanges
                {
                    target: barContainer
                    anchors
                    {
                        left: nextIcon.right
                        right : repeatIcon.left
                        top:parent.top
                        bottom:parent.bottom

                    }
                }
                AnchorChanges
                {
                    target: progression
                    anchors
                    {
                        top:undefined
                        left:undefined
                        right:undefined
                        //horizontalCenter:parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                }
                PropertyChanges
                {
                    target: progression
                    anchors.topMargin: 0
                }

            }

        ]

        Connections
        {
            target: player
            onPositionChanged:
            {
                //console.log(Date(player.position).toString())
                //lapsTime.text = player.positionString
            }
            //onDurationChanged: trackLenght.text = player.durationString
        }

        Label
        {
            id: lapsTime
            text : currentTrackInfos.positionStr
            fontSize: "small"
            anchors
            {
                top: parent.top
                left: parent.left
                topMargin : 2
            }

        }
        Label
        {
            id:trackLenght
            text : currentTrackInfos.durationStr
            fontSize: "small"
            anchors
            {
                top: parent.top
                right: parent.right
                topMargin: 2
            }
        }
        ProgressBarItem
        {
            id:progression
            height: 3
            width: parent.width

            anchors
            {
                left: parent.left
                right: parent.right
                top: parent.top

            }
        }
    }



    RowLayout
    {
        id:controlsBar
        spacing: 30
        width: parent.width - 20
        height: parent.height - 20
        implicitWidth: parent.width
        anchors
        {
            centerIn: parent
        }
        states:[
            State
            {
                name:"tabletMode"
                PropertyChanges
                {
                    target: controlsBar
                    spacing: 30

                }
                AnchorChanges
                {
                    target: repeatIcon
                    anchors
                    {
                        right: shuffleIcon.left
                        verticalCenter: parent.verticalCenter

                    }
                }
                AnchorChanges
                {
                    target: shuffleIcon
                    anchors
                    {
                        right: parent.right
                        verticalCenter: parent.verticalCenter

                    }
                }
                AnchorChanges
                {
                    target: previousIcon
                    anchors
                    {
                        left: parent.left
                        verticalCenter: parent.verticalCenter

                    }
                }
                AnchorChanges
                {
                    target: playIcon
                    anchors
                    {
                        left: previousIcon.right
                        verticalCenter: parent.verticalCenter

                    }
                }
                AnchorChanges
                {
                    target: nextIcon
                    anchors
                    {
                        left: playIcon.right
                        verticalCenter: parent.verticalCenter

                    }
                }

            }

        ]
        Icon
        {
            id:repeatIcon
            //width: 24
            name: "media-playlist-repeat"
            color: "#FAFAFA"
            Layout.fillWidth: false
            Layout.minimumWidth: units.gu(3)
            Layout.preferredWidth: units.gu(3)
            Layout.maximumWidth: units.gu(4)
            Layout.minimumHeight: units.gu(3)
            Layout.maximumHeight: units.gu(4)
            anchors
            {
                verticalCenter: parent.verticalCenter
                margins: 15
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    Utils.changePlaybackMode()
                }
            }

        }


        Icon
        {
            id:previousIcon
            //width: 24
            name: "media-skip-backward"
            color: "#FAFAFA"
            Layout.fillWidth: false
            Layout.minimumWidth: units.gu(3)
            Layout.preferredWidth: units.gu(3)
            Layout.maximumWidth: units.gu(4)
            Layout.minimumHeight: units.gu(3)
            Layout.maximumHeight: units.gu(4)
            anchors
            {
                verticalCenter: parent.verticalCenter
                margins: 15
            }

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    Utils.previous()

                }


            }
        }
        Icon
        {
            id:playIcon
            name: ( (player.state === MusicPlayer.PausedState) || (player.state ===  MusicPlayer.StoppedState)) ? "media-playback-start" : "media-playback-pause"
            Layout.fillWidth: false
            color: "#FAFAFA"
            Layout.minimumWidth: units.gu(3)
            Layout.preferredWidth: units.gu(3)
            Layout.maximumWidth: units.gu(4)
            Layout.minimumHeight: units.gu(3)
            Layout.maximumHeight: units.gu(4)
            anchors
            {
                verticalCenter: parent.verticalCenter
                margins: 15
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    Utils.play()
                }
            }

        }
        Icon
        {
            id:nextIcon
            width: 24
            name: "media-skip-forward"
            color: "#FAFAFA"
            Layout.fillWidth: false
            Layout.minimumWidth: units.gu(3)
            Layout.preferredWidth: units.gu(3)
            anchors
            {
                verticalCenter: parent.verticalCenter
                margins: 15
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                   playlist.goToNextIndex()
                }
            }

        }

        Icon
        {
            id:shuffleIcon
            //width: 24
            name: "media-playlist-shuffle"
            color: playlist.playbackMode === 4 ? colors.shuffleON : colors.shuffleOFF

            Layout.fillWidth: false
            Layout.minimumWidth: units.gu(3)
            Layout.preferredWidth: units.gu(3)

            anchors
            {
                verticalCenter: parent.verticalCenter
                margins: 15
                right: parent.right
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                   playlist.shuffle()
                }
            }


        }

    }

}

