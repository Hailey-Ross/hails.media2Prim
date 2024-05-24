## hails.media2Prim

Notecard-based (LSL) script that randomly grabs urls and displays the media on a primitive  

### Table of Contents
- [Preview](#example)
- [Example Notecard](#example-notecard)
- [Usage](#usage)
- [Change-log](#change-log)
   - [Minor Patch 4](#minor-patch-4) 
   - [Minor Patch 3](#minor-patch-3) 
   - [Minor Patch 2](#minor-patch-2)
   - [Minor Patch 1](#minor-patch)


### Example

<a href="https://i.imgur.com/lMoRjGc.gif">Preview</a>

### Example Notecard:

Unless you change it in the script, Notecard **MUST** be named `hails.urls`  
These are example URLs to test out the script.
```
https://i.imgur.com/cc957Ax.mp4
https://i.imgur.com/7iq48DN.mp4
https://i.imgur.com/S02CemU.mp4
https://i.imgur.com/fU7pIfg.mp4
https://i.imgur.com/xjGh9cM.mp4
https://i.imgur.com/HZ1YIsp.mp4
https://i.imgur.com/dg1UUQ3.mp4
https://i.imgur.com/dc9RNYg.mp4
```

### Usage:

- Rez a new `Box/Square` Prim (*recommended shape*)
- Create a Notecard, name it `hails.urls`
  - In the Notecard, paste your Video/Image URL's **(One per line)**
- Create a new script and copy/paste the code from `main.lsl` or `smol.lsl` over the default script.
  - Make any personal adjustments to the script
  - Save  
- Adjust the Shape/Position to your liking
- Enjoy

### TODO:

- *TBD*

  
## Change-log

### Minor Patch 4
*RELEASED* - **11/13/23**  
__Version__: *0.1.1b*  
-  -  -  -  -  -  -  -  -  -
- Script Optimization
   - Lines Truncated to reduce script size
   - Similar Functions/Code Concatenated
- Script Commenting
   - General Fixes/Proofreading/updates
- Setup Functionality Fixes
   - Added Fullbright to on for MediaFace variable
- README Cleanup/Additions
-  -  -  -  -  -  -  -  -  -
### Minor Patch 3
*RELEASED* - **10/14/23**  
__Version__: *0.1.1a*  
-  -  -  -  -  -  -  -  -  -
- Updated TimerEvents
   - Optimizations
   - Disabled when the Sim is empty
- Updated Touch Function
   - Checks for user input in Object Description
   - additional optimizations
- Updated Setup Function
   - Optimizations
   - Checks new Debug function
- NEW Debug function
   - Checks Object Description for user input
   - Can Reset script with 'resetme'
   - Can disable Release Candidate llSetText with 'nosettext'
   - Can silence debug mode with 'silent'
   - Can ENABLE debug mode with 'debug'
   - Can FORCE Setup mode with 'dosetup'
- NEW Sim Population Function
   - Checks the Simulators population then hibernates if less than 1
   - Sends IM notification to Script Owner during Debug
- Added Additional Color Vectors
   - Provided for customization by user(s)
-  -  -  -  -  -  -  -  -  -
### Minor Patch 2
*RELEASED* - **09/24/23**  
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
