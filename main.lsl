//Script Created by Hailey Enfield
//Site: https://u.hails.cc/Links
//Github: https://github.com/Hailey-Ross/hails.media2Prim
//PLEASE LEAVE ALL CREDITS/COMMENTS INTACT

//TO USE THIS SCRIPT START BY CREATING A NOTECARD IN THE PRIM WITH THIS SCRIPT 
//NAME THE NOTECARD "hails.urls"
//ONLY PLACE ONE IMAGE/MP4 LINK PER LINE IN THE NOTECARD

key linecountid;
key lineid;

string hailsVersion = "0.1.0a";   //Version Number
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
integer mediaFace = 0;           // TOP = 0 | +X = 1 | +Y = 2 | -X = 3 | +X = 4 | BOTTOM = 5

float hailsTimer = 2.25;         // Short pause timer
float hailsTimer2 = 10.75;
float hailsRandTimer;

vector black = <0,0,0>;          //Vector value for Black
vector white = <1.0,1.0,1.0>;    //Vector value for White

integer random_integer(integer min, integer max) { return min + (integer)(llFrand( max - min + 1 )); } //Random number generation

hailsSetup() //Setup Primitive Function
{
    llSetObjectDesc("v" + hailsVersion);
    llSetObjectName(objectName);
    if (llGetAlpha(5)) //Check face 5 (bottom) for transparency to test for prior setup
    {
        hailsStartSetup = TRUE;
    }
    else {
        hailsStartSetup = FALSE;
    }
    if (hailsStartSetup & doSetup) //main function logic
    {
        if (debug) { llOwnerSay(hailsObjName + " Begin Setup/Optimization function..."); } //debug
        llSetTexture(TEXTURE_BLANK, ALL_SIDES); //Set Primitive Texture to Blankf from default wood texture
        llSetColor(black, ALL_SIDES);  //Set all faces to black
        llSetColor(white, mediaFace); //Set Media Face to white
        llSetAlpha(0.0, 5); //Set Prim Bottom Transparent
        llSetStatus(STATUS_BLOCK_GRAB_OBJECT, doGrab); //Lock/Unlock Grab/Drag Functionality
        llSetStatus(STATUS_PHANTOM, doPhantom); //whether Primitive is Phantom
        hailsStartSetup = FALSE; //Set variable to disable setup if called again during this run
        if (debug) { llOwnerSay(hailsObjName + " Setup is Complete."); } //debug
        llSleep(0.27); //Take a nap ..zzZzz..
    }
    else {
        if (debug) { llOwnerSay(hailsObjName + " SKIP Setup Function. . ."); }
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
        hailsObjName = objectName + ":";
        linecountid = llGetNumberOfNotecardLines(card); //get the number of notecard lines
        if (debug) { llOwnerSay(hailsObjName + " is Performing Start up.."); }
        hailsURL = "https://hails.cc/";
        hailsHome = hailsURL;
        hailsSetup();
        media2Prim();
        llSleep(hailsTimer2); //allow initial URL to load
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
        hailsRandTimer = random_integer(59, 199);
        if (debug) { llOwnerSay(hailsObjName + " TimerEvent set for " + (string)hailsRandTimer); } //Debug
        llSetTimerEvent(hailsRandTimer);
    }
    touch_start(integer total_number)
    {
        if (debug) { llOwnerSay(hailsObjName + " Touch Function has been Activated"); }
        hailsRandTimer = random_integer(59, 199);
        llSetTimerEvent(hailsRandTimer);
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
        if (debug) { llOwnerSay(hailsObjName + " TimerEvent set for " + (string)hailsRandTimer); } //Debug
        llSleep(0.25); //Take another nap ..zzZzz..
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
            hailsRandTimer = random_integer(59, 199);
            llSetTimerEvent(hailsRandTimer);
            if (debug) { llOwnerSay(hailsObjName + " TimerEvent set for " + (string)hailsRandTimer); } //Debug
            if (debug) { llOwnerSay(hailsObjName + " is Sleeping for " + (string)hailsTimer); } //Debug
            llSleep(hailsTimer);
        }
    }
}
