//Script Created by Hailey Enfield
//Site: https://u.hails.cc/Links
//PLEASE LEAVE ALL CREDITS/COMMENTS INTACT

//TO USE THIS SCRIPT START BY CREATING A NOTECARD IN THE PRIM WITH THIS SCRIPT 
//NAME THE NOTECARD "hails.urls"
//ONLY PLACE ONE IMAGE/MP4 LINK PER LINE IN THE NOTECARD

string hailsVersion = "0.1.0";  //Version Number
string card = "hails.urls";      //Notecard name
string objectName = "hails.media2Prim"; //Primitive name
string hailsURL;
string hailsHome;
vector black = <0.67,0.67,0.67>; //Vector value for Black
key linecountid;
key lineid;
integer debug = FALSE;           //DEBUG toggle, TRUE = ON | FALSE = OFF
integer linemax;
integer doPhantom = TRUE;        //Primitive Phantom Status, TRUE = ON | FALSE = OFF
integer doGrab = TRUE;           //Primitive Grab/Drag Functionality, TRUE = ON | FALSE = OFF
integer mediaFace = 0;           // TOP = 0 | +X = 1 | +Y = 2 | -X = 3 | BOTTOM = 4
float hailsTimer = 2.25;         // Short pause timer
float hailsTimer2 = 90.0;        // Long pause timer

integer random_integer(integer min, integer max) { return min + (integer)(llFrand( max - min + 1 )); } //Random number generation

hailsSetup() //Setup Primitive
{
    llSetObjectName(objectName + " | v" + hailsVersion)
    if (debug == TRUE) { llOwnerSay(llGetScriptName() + " Setting up Primitive..."); }
    llSetTexture(TEXTURE_BLANK, ALL_SIDES); //Set Primitive Texture to Blank
    llSetColor(black, 1);
    llSetColor(black, 2);
    llSetColor(black, 3);
    llSetColor(black, 4);
    llSetAlpha(0.0, 4); //Set Prim Bottom Transparent
    llSetStatus(STATUS_BLOCK_GRAB_OBJECT, doGrab | STATUS_PHANTOM, doPhantom); //Lock/Unlock Grab/Drag Functionality and whether Primitive is Phantom
    llSleep(0.27); //Take a nap ..zzZzz..
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
                llOwnerSay(llGetScriptName() + " has detected a change, Resetting Script. . .");
            }
            llSleep(hailsTimer);
            llResetScript();
        }
    }
    state_entry() {
        linecountid = llGetNumberOfNotecardLines(card); //get the number of notecard lines
        if (debug == TRUE)
        {
            llOwnerSay(llGetScriptName() + " is Performing Start up..");
        }
        hailsSetup();
        hailsURL = "https://hails.cc/";
        hailsHome = hailsURL;
        media2Prim();
        llSetTimerEvent(12.0); //Allow Initial URL to load
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
            if (debug == TRUE) { llOwnerSay(llGetScriptName() + " is Sleeping for " + (string)hailsTimer2); } //Debug
            llSleep(hailsTimer2);
        }
    }
} 
