import QtQuick 2.4
import Ubuntu.Components 1.2
import PlayerModules 1.0
Page {
       id: page
       title: "MUSIC"
       head {
           sections {
               model: ["Artist", "Albums", "All Tracks"]
               selectedIndex: 0
               //onSelectedIndexChanged: viewIndex = head.sections.selectedIndex
           }
       }


//       TracklistModel
//       {
//           id:allTracksModel
//       }

       property real itemModelHeight : pageStackContainer.height
       property real itemModelWidth : pageStackContainer.width
      // property int viewIndex: head.sections.selectedIndex

//       Item
//       {
//           id:pageViewContainer
//           width: itemModelWidth * 3
//           height: itemModelHeight - panel.height
////           anchors
////           {
////               top: parent.top
////               left: parent.left
////           }

//           clip: true
//           Component.onCompleted:
//           {
//               x = -itemModelWidth
//           }
//           Connections
//           {
//               target: page.head.sections
//               onSelectedIndexChanged:
//               {
//                   switch(page.head.sections.selectedIndex)
//                   {
//                        case 0:
//                            pageViewContainer.x = 0
//                            break
//                        case 1:
//                            pageViewContainer.x = -itemModelWidth
//                            break
//                        case 2:
//                            pageViewContainer.x = -itemModelWidth * 2
//                            break

//                   }
//               }
//           }

//           Row
//           {
//               anchors.fill: parent
//               ArtistsViewPage
//               {
//                   id:artists
//                   height: itemModelHeight;
//                   width: itemModelWidth

//               }
//               AlbumsViewPage
//               {
//                   id:albumViewer
//                   height: itemModelHeight
//                   width: itemModelWidth

//               }

//               Rectangle
//               {
//                   id:tracks
//                   height: itemModelHeight
//                   width: itemModelWidth
//                   color: "lightgreen"
//               }
//           }
//       }

       VisualItemModel {
           id: itemModel
           ArtistsViewPage
           {
               id:artists
               height: itemModelHeight
               width: itemModelWidth


           }
           AlbumsViewPage
           {
               id:albumViewer
               height: itemModelHeight
               width: itemModelWidth


           }

           TrackViewerPage
           {
               id:tracks
               height: itemModelHeight
               width: itemModelWidth
           }
       }

       ListView
       {
           id:viewerDefault
           anchors
           {
               leftMargin:5
               rightMargin:5
               fill: parent
           }
           clip: true
           model: itemModel
           snapMode: ListView.SnapOneItem
           orientation: ListView.Horizontal
           interactive: false
           flickableDirection: Flickable.VerticalFlick
           flickDeceleration: 300
           currentIndex: page.head.sections.selectedIndex
           onCurrentItemChanged:
           {
               positionViewAtIndex(currentIndex,ListView.Center)
               //console.log("Current Item changed : " + currentIndex)

           }

           onFlickEnded:
           {
               returnToBounds()
           }
           Component.onCompleted:
           {
    //           viewerDefault.positionViewAtIndex(/*head.sections.selectedIndex*/ 1,ListView.Contain)
               print("QML Page Selected Index : " + page.head.sections.selectedIndex)
               currentIndex : page.head.sections.selectedIndex
               print("QML Page Selected Index : " + page.head.sections.selectedIndex)
           }
       }

   }
