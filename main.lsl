//Script Created by Hailey Enfield
//Site: https://u.hails.cc/Links
//PLEASE LEAVE ALL CREDITS/COMMENTS INTACT

//TO USE THIS SCRIPT START BY CREATING A NOTECARD IN THE PRIM WITH THIS SCRIPT 
//NAME THE NOTECARD "hails.urls"
//ONLY PLACE ONE IMAGE/MP4 LINK PER LINE IN THE NOTECARD

integer debug = FALSE;

string card = "hails.urls";
string hailsURL;
string hailsHome;
key linecountid;
key lineid;
integer linemax;
integer mediaFace = 0;
float hailsTimer = 2.25;
float hailsTimer2 = 90.0;

integer random_integer(integer min, integer max)
{
  return min + (integer)(llFrand( max - min + 1 ));
}

media2Prim()
{
    llSetPrimMediaParams(mediaFace,                             // Side to display the media on.
            [PRIM_MEDIA_AUTO_PLAY,TRUE,                     // Show this page immediately
             PRIM_MEDIA_CURRENT_URL,hailsURL,    // The url currently showing
             PRIM_MEDIA_HOME_URL,hailsHome,       // The url if they hit 'home'
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
        hailsURL = "https://hails.cc/";
        hailsHome = hailsURL;
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
            hailsURL = data;
            hailsHome = hailsURL;
            media2Prim();
            if (debug == TRUE)
            {
                llOwnerSay("Sleeping for " + (string)hailsTimer2);
            }
             llSleep(hailsTimer2);
        }
    }
} 