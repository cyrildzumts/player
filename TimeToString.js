.pragma library

function msecsToString(value) {
    var min = 0;
    var sec= 0;
    var hourString;
    var minString;
    var secString;
    if(value < 3600000)
    {

       min = parseInt( value / 60000);
       value = value % 60000;
        sec =  parseInt(value / 1000);
       minString = min > 9 ?  min : "0%1".arg(min)
       secString = sec > 9 ? sec : "0%1".arg(sec)
       return minString + ":" + secString;
    }
    else
    {
        var hour = parseInt(value / 3600000);
        value = value % 3600000;
        min = parseInt(value / 60000);
        value = value % 60000;
         sec =  parseInt(value / 1000);
        hourString = hour > 9 ?  hour : "0%1".arg(hour)
        minString = min > 9 ?  min : "0%1".arg(min)
        secString = sec > 9 ? sec : "0%1".arg(sec)
        return  hourString + ":" + minString + ":" + secString;
    }
}
