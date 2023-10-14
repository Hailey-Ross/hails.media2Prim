//Script Created by Hailey Enfield
//Site: https://u.hails.cc/Links
//Github: https://github.com/Hailey-Ross/hails.media2Prim
//PLEASE LEAVE ALL CREDITS/COMMENTS INTACT

//TO USE THIS SCRIPT START BY CREATING A NOTECARD IN THE PRIM WITH THIS SCRIPT 
//NAME THE NOTECARD "hails.urls"
//ONLY PLACE ONE IMAGE/MP4 LINK PER LINE IN THE NOTECARD

key linecountid;
key lineid;
key MyKey;

string hailsVersion = "0.1.1 - RC 2";   //Version Number
string card = "hails.urls";             //Notecard name
string objectName = "hails.media2Prim"; //Primitive name
string objDesc;
string hailsObjName;
string hailsURL;
string hailsHome;
string forceHomeURL = "https://hails.cc/";

integer debug = FALSE;            //DEBUG toggle, TRUE = ON | FALSE = OFF
integer debugIM = FALSE;          //Instant Messaging DEBUG toggle, TRUE = ON | FALSE = OFF
integer linemax;                 
integer doPhantom = TRUE;        //Primitive Phantom Status, TRUE = ON | FALSE = OFF
integer doGrab = TRUE;           //Primitive Grab/Drag Functionality, TRUE = ON | FALSE = OFF
integer doSetup = TRUE;          //Whether to perform setup functionality
integer hailsStartSetup = FALSE; // LEAVE ALONE | Default State
integer mediaFace = 0;           // TOP = 0 | +X = 1 | +Y = 2 | -X = 3 | +X = 4 | BOTTOM = 5
integer oppositeFace = 5;        // Set to the opposite side of mediaFace variable!

float hailsTimer = 2.25;         // Short pause timer
float hailsTimer2 = 10.75;
float hailsRandTimer;

vector black = <0,0,0>;          //Vector value for Black
vector white = <1.0,1.0,1.0>;    //Vector value for White

integer random_integer(integer min, integer max) { return min + (integer)(llFrand( max - min + 1 )); } //Random number generation

checkDebug()
{
    objDesc = llGetObjectDesc();
    if (objDesc == "v" + hailsVersion + " - DEBUG")
    {
        llOwnerSay(hailsObjName + " DEBUG enabled.. SKIP");
    }
    else if (objDesc == "debug")
    {
        debug = TRUE;
        debugIM = TRUE;
        llOwnerSay(hailsObjName + " DEBUG mode Enabled..");
        llInstantMessage(MyKey, "IM DEBUG mode Enabled..");
        llSetObjectDesc("v" + hailsVersion + " - DEBUG");
        llSetObjectName(objectName + " - DEBUG");
    }
    else if (objDesc == "silent")
    {
        debug = FALSE;
        llSetObjectDesc("v" + hailsVersion);
        llSetObjectName(objectName);
    }
    else 
    {
        llSetObjectDesc("v" + hailsVersion);
        llSetObjectName(objectName);
    }
}

hailsSetup() //Setup Primitive Function
{
    MyKey = llGetOwner();
    checkDebug();
    if (llGetAlpha(oppositeFace)) //Check face 5 (bottom) for transparency to test for prior setup
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
        llSetAlpha(1.0, ALL_SIDES); //Ensure every face is not transparent
        llSetAlpha(0.0, oppositeFace); //Set Prim Bottom Transparent
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
    llSetPrimMediaParams(mediaFace,[PRIM_MEDIA_AUTO_PLAY,TRUE, PRIM_MEDIA_HOME_URL,hailsHome, PRIM_MEDIA_CURRENT_URL,hailsURL, PRIM_MEDIA_HEIGHT_PIXELS,1024, PRIM_MEDIA_WIDTH_PIXELS,800, PRIM_MEDIA_PERMS_INTERACT,0x0, PRIM_MEDIA_CONTROLS,1, PRIM_MEDIA_AUTO_SCALE,1, PRIM_MEDIA_AUTO_LOOP,1]);
    if (debug) { llOwnerSay(hailsObjName + " has updated URL: (" + hailsURL + ") "); }
}

checkSimPop()
{
    integer numOfAvatars = llGetRegionAgentCount();
    integer counter;
    if (debug) { llOwnerSay(hailsObjName + " is checking Sim Population.."); }
    // if no avatars then hibernate
    while (numOfAvatars < 1)
    {
        if (counter < 1) { llSetTimerEvent(0.0); hailsURL = "https://hails.cc/"; hailsHome = hailsURL; media2Prim(); if (debugIM) { llInstantMessage(MyKey, "Sim is empty, hibernating.."); } }
        llSleep(15);
        if (counter > 1000) { counter = 1; } else { ++counter; }
        numOfAvatars = llGetRegionAgentCount();
        if (debug) { llOwnerSay(hailsObjName + " is re-checking Sim Population.."); }
        }
    if (debug) { llOwnerSay(hailsObjName + " Sim Pop has passed check."); }
    counter = 0;
    }

default {
    on_rez(integer start_param)
    {
        checkDebug();
        llSleep(0.75);
        llResetScript(); //ensure script startup state on rez
    }
    changed(integer change)
    {
        if (change & (CHANGED_OWNER | CHANGED_INVENTORY | CHANGED_REGION))
        {
            if (debug) { llOwnerSay(hailsObjName + " has detected a change, Rebooting. . ."); }
            checkDebug();
            llSleep(hailsTimer);
            llResetScript();
        }
    }
    state_entry() {
        if (debug) { llSetObjectDesc("debug"); }
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
        checkDebug();
        if (debug) { llOwnerSay(hailsObjName + " Touch Function has been Activated"); }
        hailsRandTimer = random_integer(59, 199);
        llSetTimerEvent(hailsRandTimer);
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
        if (debug) { llOwnerSay(hailsObjName + " TimerEvent set for " + (string)hailsRandTimer); } //Debug
        llSleep(0.25); //Take another nap ..zzZzz..
    }
    timer() 
    {  
        checkDebug();
        checkSimPop();
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
