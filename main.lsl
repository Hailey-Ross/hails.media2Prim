//Script Created by Hailey Enfield
//Site: https://u.hails.cc/Links
//Github: https://github.com/Hailey-Ross/hails.media2Prim
//PLEASE LEAVE ALL CREDITS/COMMENTS INTACT

//TO USE THIS SCRIPT START BY CREATING A NOTECARD IN THE PRIM WITH THIS SCRIPT 
//NAME THE NOTECARD "hails.urls"
//ONLY PLACE ONE IMAGE/MP4 LINK PER LINE IN THE NOTECARD

key linecountid;
key lineid;

string hailsVersion = "0.1.0";   //Version Number
string card = "hails.urls";      //Notecard name
string objectName = "hails.media2Prim"; //Primitive name
string hailsObjName;
string hailsURL;
string hailsHome;
string forceHomeURL = "https://hails.cc/";

integer debug = TRUE;           //DEBUG toggle, TRUE = ON | FALSE = OFF
integer linemax;
integer doPhantom = TRUE;        //Primitive Phantom Status, TRUE = ON | FALSE = OFF
integer doGrab = TRUE;           //Primitive Grab/Drag Functionality, TRUE = ON | FALSE = OFF
integer doSetup = TRUE;          //Whether to perform setup functionality
integer hailsStartSetup = FALSE; // LEAVE ALONE | Default State
integer mediaFace = 0;           // TOP = 0 | +X = 1 | +Y = 2 | -X = 3 | BOTTOM = 4

float hailsTimer = 2.25;         // Short pause timer
float hailsTimer2 = 10.75;
float hailsRandTimer;

vector black = <0,0,0>;          //Vector value for Black
vector white = <1.0,1.0,1.0>;

integer random_integer(integer min, integer max) { return min + (integer)(llFrand( max - min + 1 )); } //Random number generation

hailsSetup() //Setup Primitive
{
    hailsObjName = objectName + " v" + hailsVersion;
    if (llGetAlpha(5)) //Check face 4 for transparency to test for prior setup
    {
        hailsStartSetup = TRUE;
    }
    else {
        hailsStartSetup = FALSE;
    }
    if (hailsStartSetup & doSetup)
    {
        llSetObjectName(hailsObjName);
        if (debug) { llOwnerSay(hailsObjName + " Begin Setup/Optimization function..."); }
        llSetTexture(TEXTURE_BLANK, ALL_SIDES); //Set Primitive Texture to Blank
        llSetColor(black, ALL_SIDES);  //Set all faces to black
        llSetColor(white, 0);
        llSetAlpha(0.0, 5); //Set Prim Bottom Transparent
        llSetStatus(STATUS_BLOCK_GRAB_OBJECT, doGrab); //Lock/Unlock Grab/Drag Functionality and whether Primitive is Phantom
        llSetStatus(STATUS_PHANTOM, doPhantom);
        hailsStartSetup = FALSE;
        if (debug) { llOwnerSay(hailsObjName + " Setup is Complete."); }
        llSleep(0.27); //Take a nap ..zzZzz..
    }
    else {
        if (debug) { llOwnerSay(hailsObjName + " Skipping Setup Function. . ."); }
    }
}

media2Prim()
{
    llSetPrimMediaParams(mediaFace,                             // Side to display the media on.
            [PRIM_MEDIA_AUTO_PLAY,TRUE,                     // Show this page immediately
             PRIM_MEDIA_HOME_URL,hailsHome,       // The url if they hit 'home'
             PRIM_MEDIA_CURRENT_URL,hailsURL,    // The url currently showing
             PRIM_MEDIA_HEIGHT_PIXELS,1024,                  // Height/width of media texture will be
             PRIM_MEDIA_WIDTH_PIXELS,800,
             PRIM_MEDIA_PERMS_INTERACT,0x0,
             PRIM_MEDIA_CONTROLS,1,
             PRIM_MEDIA_AUTO_SCALE,1,
             PRIM_MEDIA_AUTO_LOOP,1]);
    if (debug) { llOwnerSay(hailsObjName + " has updated URL: (" + hailsURL + ") "); }
}

default {
    changed(integer change)
    {
        if (change & (CHANGED_OWNER | CHANGED_INVENTORY))
        {
            if (debug) { llOwnerSay(hailsObjName + " has detected a change, Rebooting. . ."); }
            llSleep(hailsTimer);
            llResetScript();
        }
    }
    state_entry() {
        linecountid = llGetNumberOfNotecardLines(card); //get the number of notecard lines
        if (debug) { llOwnerSay(hailsObjName + " is Performing Start up.."); }
        hailsURL = "https://hails.cc/";
        hailsHome = hailsURL;
        hailsSetup();
        media2Prim();
        llSleep(hailsTimer2); //allow initial URL to load
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
        hailsRandTimer = random_integer(89, 199);
        if (debug) { llOwnerSay(hailsObjName + " TimerEvent set for " + (string)hailsRandTimer); } //Debug
        llSetTimerEvent(hailsRandTimer);
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
            hailsURL = data;
            hailsHome = data;
            media2Prim();
            if (debug) { llOwnerSay(hailsObjName + " is Sleeping for " + (string)hailsTimer); } //Debug
            llSleep(hailsTimer);
        }
    }
}
