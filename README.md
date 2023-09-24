## hails.media2Prim

Notecard-based (LSL) script for randomly grabbing urls and displaying media objects on a primitive face(s)

### Example

<a href="https://i.imgur.com/lMoRjGc.gif">Preview</a>

### Example Notecard:

Unless you change it in the script, Notecard **MUST** be named `hails.urls`
```
https://some-url.tld/link-here/image.png
https://some-url.tld/link-here/animation.gif
https://some-url.tld/link-here/video.mp4
https://some-url.tld/website.html
https://some-url.tld/another-site.php
Etc..
```

### Usage:

- Rez a new `Box/Square` Prim (*recommended shape*)
- Create a Notecard, name it `hails.urls`
- Place your personal Links to Images/Sites/Animations/Video **One per line**
- Create a new script and copy/paste the code over the default script
- Make any personal adjustments
- Save the script
- Adjust the prim shape/position
- Enjoy

### TODO:

- *TBD*

  
## Change-log

### Minor Patch 2
*RELEASED*: **09/24/23**  
__Version__: *0.1.0a*  
-  -  -  -  -  -  -  -  -  -
- TimerEvents
   - Now properly reset on Touch
   - Now trigger new TimerEvent length on image/page changes
- Touch Function Fixes
   - Properly Resets TimerEvents
   - Randomized TimerEvent length(s) after Touch
   - Added proper randomization to url choice
- Setup Function
   - Cleaned up function ordering
   - Moved llSetObjectName() functionality to always run
   - llSetColor(white, 0) now uses mediaFace variable to always match customization
   - New oppositeFace variable for customization
- Verbose Debug
   - Added additional Debug output to Touch Function
   - Added additional Debug output to RNG for NC line choice
   - Fixed Debug variables that were not matching the variable being called by functions
- Optimizations to Code workflow
   - Cleaned up the ordering of script functionality
   - Cleaned up readability
   - Removed unused/superfluous code
-  -  -  -  -  -  -  -  -  -
### Minor Patch  
*RELEASED* - **09/22/2023**  
__Version__: *0.1.0*  
-  -  -  -  -  -  -  -  -  -
- media2Prim() function fully implemented
   - Sets Variable then runs Function
- New variables for easier customization
- Minor code cleanup
   - Compact debug lines
   - Compact random_integer variable
   - Commenting/Credits
   - *most* Redundant Code Removed
   - Variable names cleaned up
- hailsSetup() Function
   - Set Prim side faces to black
   - Set Prim bottom face to Transparent
   - Set Texture for remaining Faces to `BLANK_TEXTURE`
   - Set Object Name + Version
   - Set Phantom State
   - Set Grab/Drag Functionality State
- Check prior Setup
   - Checks for setup and if it cannot find transparency on the bottom it runs the function
   - can be disabled by a variable at the top of the script
-  -  -  -  -  -  -  -  -  -
