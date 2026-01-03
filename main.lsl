//Script Created by Hailey Enfield
//Site: https://links.hails.cc
//Github: https://github.com/Hailey-Ross/hails.media2Prim
//PLEASE LEAVE ALL CREDITS/COMMENTS INTACT

//TO USE THIS SCRIPT, START BY CREATING A NOTECARD IN THE PRIM THAT WILL HOLD THIS SCRIPT 
//NAME THE NOTECARD "hails.urls"
//ONLY PLACE ONE IMAGE/MP4 LINK PER LINE IN THE NOTECARD

string objectName = "hails.media2Prim"; //Primitive name
string forceHomeURL = "https://hails.cc/";
string hailsTexture = "9d0c0e2d-852e-b2d0-9e5e-a64b2f78bc3a";

integer doPhantom = TRUE;        //Primitive Phantom Status, TRUE = ON | FALSE = OFF
integer doGrab = TRUE;           //Primitive Grab/Drag Functionality, TRUE = ON | FALSE = OFF
integer doSetup = TRUE;          //Whether to perform setup functionality

//------------ DON'T TOUCH BELOW HERE ------------//

key linecountid; key lineid; key MyKey;

string objDesc; string hailsObjName; string hailsURL; string hailsHome; string rcInfo;
string hailsVersion = "0.1.1b";
string card = "hails.urls";

integer linemax;
integer debug = FALSE;
integer debugIM = FALSE;
integer rc = FALSE;                
integer hailsStartSetup = FALSE; // LEAVE ALONE | Default State
integer mediaFace = 0;           // TOP = 0 | +X = 1 | +Y = 2 | -X = 3 | +X = 4 | BOTTOM = 5
integer oppositeFace = 5;        // Set to the opposite side of mediaFace variable
integer random_integer(integer min, integer max) { return min + (integer)(llFrand( max - min + 1 )); } //RNG

float hailsTimer = 2.25;
float hailsTimer2 = 10.75;
float hailsRandTimer;

vector black = <0,0,0>; vector white = <1.0,1.0,1.0>; vector navy = <0,0.122,0.247>; vector blue = <0,0.455,0.851>;
vector aqua = <0.498,0.859,1>; vector teal = <0.224,0.8,0.8>; vector olive = <0.239,0.6,0.439>; vector green = <0.18,0.8,0.251>;
vector lime = <0.004,1,0.439>; vector yellow = <1,0.863,0>; vector orange = <1,0.522,0.106>; vector red = <1,0.255,0.212>;
vector maroon = <0.522,0.078,0.294>; vector fuchsia = <0.941,0.071,0.745>; vector purple = <0.694,0.051,0.788>; vector gray = <0.667,0.667,0.667>;

checkDebug() {
    objDesc = llGetObjectDesc();
    if (objDesc == "v" + hailsVersion + " - DEBUG") { llOwnerSay(hailsObjName + " DEBUG enabled.. SKIP"); }
    else if (objDesc == "debug") { debug = TRUE; debugIM = TRUE; llOwnerSay(hailsObjName + " DEBUG mode Enabled.."); llInstantMessage(MyKey, "IM DEBUG mode Enabled.."); llSetObjectDesc("v" + hailsVersion + " - DEBUG"); llSetObjectName(objectName + " - DEBUG"); }
    else if (objDesc == "silent") { debug = FALSE; debugIM = TRUE; llSetObjectDesc("v" + hailsVersion); llSetObjectName(objectName); }
    else if (objDesc == "nosettext") { rc = FALSE; llSetText("", ZERO_VECTOR, 0.0); llSetObjectDesc("v" + hailsVersion); }
    else if (objDesc == "resetme") { llSetObjectDesc("v" + hailsVersion); llClearPrimMedia(mediaFace); hailsSetup(); llResetScript(); }
    else if (objDesc == "dosetup") { llSetObjectDesc("v" + hailsVersion); doSetup = TRUE; hailsStartSetup = TRUE; hailsSetup(); }
    else { llSetObjectDesc("v" + hailsVersion); llSetObjectName(objectName); } }

hailsSetup() {
    MyKey = llGetOwner(); llClearPrimMedia(mediaFace);
    if (rc) { llSetText("v" + hailsVersion + " - " + rcInfo, fuchsia, 0.71); llSetObjectDesc("v" + hailsVersion + " - " + rcInfo); } else { llSetText("", ZERO_VECTOR, 0.0); }
    if (llGetAlpha(oppositeFace)) { hailsStartSetup = TRUE; if (debug) { llOwnerSay(hailsObjName + " STARTSETUP set to TRUE"); } } else { hailsStartSetup = FALSE; if (debug) { llOwnerSay(hailsObjName + " STARTSETUP set to FALSE"); } } 
    if (hailsStartSetup & doSetup) {
        if (debug) { llOwnerSay(hailsObjName + " Begin Setup/Optimization function..."); } 
        llSetTexture(TEXTURE_BLANK, ALL_SIDES); llSetTexture(hailsTexture, mediaFace); llSetColor(black, ALL_SIDES); llSetColor(white, mediaFace); llSetAlpha(1.0, ALL_SIDES); llSetAlpha(0.0, oppositeFace); llSetStatus(STATUS_BLOCK_GRAB_OBJECT, doGrab); llSetStatus(STATUS_PHANTOM, doPhantom); llSetPrimitiveParams([PRIM_FULLBRIGHT, mediaFace, TRUE]); hailsStartSetup = FALSE;
        if (debug) { llOwnerSay(hailsObjName + " Setup is Complete."); }
        llSleep(0.27); }
    else {
        if (debug) { llOwnerSay(hailsObjName + " SKIP Setup Function. . ."); } } }

media2Prim() {
    llSetPrimMediaParams(mediaFace,[PRIM_MEDIA_AUTO_PLAY,TRUE, PRIM_MEDIA_HOME_URL,hailsHome, PRIM_MEDIA_CURRENT_URL,hailsURL, PRIM_MEDIA_HEIGHT_PIXELS,1024, PRIM_MEDIA_WIDTH_PIXELS,800, PRIM_MEDIA_PERMS_INTERACT,0x0, PRIM_MEDIA_CONTROLS,1, PRIM_MEDIA_AUTO_SCALE,1, PRIM_MEDIA_AUTO_LOOP,1]);
    if (debug) { llOwnerSay(hailsObjName + " has updated URL: (" + hailsURL + ") "); } }

checkSimPop() {
    integer numOfAvatars = llGetRegionAgentCount(); integer counter;
    if (debug) { llOwnerSay(hailsObjName + " is checking Sim Population.."); }
    while (numOfAvatars < 1) {
        if (counter < 1) { llSetTimerEvent(0.0); llClearPrimMedia(mediaFace); if (debugIM) { llInstantMessage(MyKey, "Sim is empty, hibernating.."); } }
        llSleep(2.5); 
        if (counter > 1000) { counter = 1; } else { ++counter; }
        numOfAvatars = llGetRegionAgentCount();
        if (debug) { llOwnerSay(hailsObjName + " is re-checking Sim Population.."); } }
    if (debug) { llOwnerSay(hailsObjName + " Sim Pop check PASSED."); }
    counter = 0; }

default {
    on_rez(integer start_param) {
        llClearPrimMedia(mediaFace);
        llSleep(0.75); llResetScript(); }
    changed(integer change) {
        if (change & (CHANGED_OWNER | CHANGED_INVENTORY | CHANGED_REGION)) {
            if (debug) { llOwnerSay(hailsObjName + " has detected a change, Rebooting. . ."); }
            checkDebug(); llClearPrimMedia(mediaFace); llSleep(hailsTimer); llResetScript(); } }
    state_entry() {
        if (debug & debugIM) { llSetObjectDesc("debug"); }
        hailsObjName = objectName + ":"; hailsSetup();
        linecountid = llGetNumberOfNotecardLines(card); 
        if (debug) { llOwnerSay(hailsObjName + " is Performing Start up.."); }
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
        hailsRandTimer = random_integer(59, 199);
        if (debug) { llOwnerSay(hailsObjName + " TimerEvent set for " + (string)hailsRandTimer); }
        llSetTimerEvent(hailsRandTimer); }
    touch_start(integer total_number) {
        checkDebug(); llSetTexture(hailsTexture, mediaFace); llClearPrimMedia(mediaFace);
        if (debug) { llOwnerSay(hailsObjName + " Touch Function has been Activated"); }
        hailsRandTimer = random_integer(59, 199); llSetTimerEvent(0.0);
        lineid = llGetNotecardLine(card, random_integer(0, linemax));
        llSleep(0.25); }
    timer() {  
        checkDebug(); checkSimPop();
        lineid = llGetNotecardLine(card, random_integer(0, linemax)); }
   dataserver(key id, string data) {
        if (id == linecountid) {
            linemax = (integer)data - 1; }
        else if (id == lineid) {
            hailsURL = data; hailsHome = data; media2Prim(); 
            hailsRandTimer = random_integer(59, 199); llSetTimerEvent(hailsRandTimer);
            if (debug) { llOwnerSay(hailsObjName + " TimerEvent set for " + (string)hailsRandTimer);  llOwnerSay(hailsObjName + " is Sleeping for " + (string)hailsTimer); }
            llSleep(hailsTimer); } } }
