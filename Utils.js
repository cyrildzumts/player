

/****************************************************
 * Author   : Cyrille Ngassam Nkwenga
 * Email    : cyrildz@gmail.com
 * Date     : 01.05.2015
 * Component: Utils.js
 *
 * Description:
 * Utils.js  is a group of some utilities functions
 * used to execute some actions.
 */


function createPlaylist(playlistName) {

    /*
      * Database::createPlaylist(playlistName) return
      * the ID of the created playlist.
      */
    return database.createPlaylist(playlistName)
}

function addToPlaylist(trackID,plsID)
{
    /*
      * Database::addToPlaylist(trackID,plsID) add the
      * track represented by trackID into the playlist
      * represented by plsID
    */
    database.addToPlaylist(trackID,plsID)
    globalVariable.trackIDToAdd = 0;
    globalVariable.openDialog = false
}

/*
 * Open the dialog passed as parameter
 */
function openDialog(dialog)
{
    PopupUtils.open(dialog)
}

/*
 * Close the dialog passed as parameter
 */
function closeDialog(dialog)
{
    PopupUtils.close(dialog)
}

function previous()
{


    if(player.position < 5000)
    {
        playlist.previous()
    }
    else
    {
        player.position = 0
    }
}



function play()
{
    if((player.state === MusicPlayer.PausedState) || (player.state === MusicPlayer.StoppedState))
    {
        player.play()
    }

    else
    {
        player.pause()
    }
}

function setCurrentIndex(trackIndex)
{

    playlist.setCurrentIndex (trackIndex)
    console.log("Utils Playlist current Index has changed : " + trackIndex)
    //player.setCover(playlist.cover)
    //player.setMedia(playlist.currentMedia)
    //player.play()
}

function changePlaybackMode()
{
    switch(playlist.playbackMode)
    {
       case 0:
           playlist.setPlaybackMode (1)
           break

       case 1:
           playlist.setPlaybackMode( 2)
           break

       case 2:
          playlist.setPlaybackMode( 3)
           break
       case 3:
           playlist.setPlaybackMode(0)
           break
    }
}
