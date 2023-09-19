string card = "hails.urls";
key linecountid;
key lineid;
integer linemax;  
integer debug = TRUE;
float hailsTimer = 2.25;

integer random_integer(integer min, integer max)
{
  return min + (integer)(llFrand( max - min + 1 ));
}

media2Prim()
{
    llSetPrimMediaParams(0,                             // Side to display the media on.
            [PRIM_MEDIA_AUTO_PLAY,TRUE,                     // Show this page immediately
             PRIM_MEDIA_CURRENT_URL,"https://assets.hails.cc/i/hailey-sting.gif",    // The url currently showing
             PRIM_MEDIA_HOME_URL,"https://hails.cc",       // The url if they hit 'home'
             PRIM_MEDIA_HEIGHT_PIXELS,1024,                  // Height/width of media texture will be
             PRIM_MEDIA_WIDTH_PIXELS,800,
             PRIM_MEDIA_PERMS_INTERACT,0x0,
             PRIM_MEDIA_CONTROLS,1,
             PRIM_MEDIA_AUTO_SCALE,1,
             PRIM_MEDIA_AUTO_LOOP,1]);
}

default {
    changed(integer change)
    {
        if (change & (CHANGED_OWNER | CHANGED_INVENTORY))
        {
            if (debug == TRUE)
            {
                llOwnerSay(llGetScriptName() + " Notecard changed, UPDATING..");
            }
            llSleep(hailsTimer);
            llResetScript();
        }
    }
    state_entry() {
        linecountid = llGetNumberOfNotecardLines(card); //get the number of notecard lines
        if (debug == TRUE)
            {
                llOwnerSay(llGetScriptName() + " Starting up..");
            }
        media2Prim();
        llSetTimerEvent(10.0);
    }
    touch_start(integer total_number)
    {
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
    }
    timer() {
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
    }
   dataserver(key id, string data)
    {
        if (id == linecountid)
        {
            linemax = (integer)data - 1;
        }
        else if (id == lineid)
        {
            if (debug == TRUE)
            {
                llOwnerSay("URL: (" + data + ") ");  //Debug only
            }
            llSetPrimMediaParams(0,                         // Side to display the media on.
            [PRIM_MEDIA_AUTO_PLAY,TRUE,                     // Show this page immediately
             PRIM_MEDIA_CURRENT_URL,data,                   // The url currently showing
             PRIM_MEDIA_HOME_URL,data,                      // The url if they hit 'home'
             PRIM_MEDIA_HEIGHT_PIXELS,1024,                 // Height/width of media texture will be
             PRIM_MEDIA_WIDTH_PIXELS,800,
             PRIM_MEDIA_PERMS_INTERACT,0x0,
             PRIM_MEDIA_CONTROLS,1,
             PRIM_MEDIA_AUTO_SCALE,1,
             PRIM_MEDIA_AUTO_LOOP,1]);
             if (debug == TRUE)
            {
                llOwnerSay("Sleeping for " + (string)hailsTimer);
            }
             llSleep(90.0);
        }
    }
} 
