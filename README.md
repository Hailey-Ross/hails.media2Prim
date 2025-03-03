# **hails.media2Prim**  
*A Notecard-based LSL script that randomly selects URLs and displays media on a prim.*  

## **Table of Contents**
- [Preview](#preview)
- [Example Notecard](#example-notecard)
- [Usage](#usage)
- [To-Do](#to-do)
- [Change Log](#change-log)
  - [Minor Patch 4](#minor-patch-4)
  - [Minor Patch 3](#minor-patch-3)
  - [Minor Patch 2](#minor-patch-2)
  - [Minor Patch 1](#minor-patch-1)

---

## **Preview**
[Preview](https://assets.hails.cc/i/hm2p-preview.gif)  
_Click to view a demonstration._

---

## **Example Notecard**
By default, the script expects a Notecard named **`hails.urls`** unless changed in the script.

---

## **Usage**
1. **Rez a Prim**  
   - A `Box/Square` shape is recommended.
   
2. **Create the Notecard**  
   - Name it **`hails.urls`**.
   - Add video/image URLs, one per line.

3. **Add the Script**  
   - Create a new script inside the prim.  
   - Copy/paste the contents of `main.lsl`.  
   - Modify the script as needed.  
   - Save.

4. **Adjust & Enjoy**  
   - Position/resize the prim as desired.  
   - The script will randomly display media from the Notecard.

---

## **To-Do**
- *TBD*

---

# **Change Log**

### **Minor Patch 4** 
*(Released: 11/13/23 - Version: 0.1.1b)*
- **Optimized script size** by truncating lines and consolidating functions.  
- **Improved script comments** for readability and clarity.  
- **Fixed setup functionality**:  
  - `Fullbright` is now automatically enabled for the `MediaFace` variable.  
- **README improvements** for better structure and clarity.  

---

### **Minor Patch 3** 
*(Released: 10/14/23 - Version: 0.1.1a)*
- **Timer Events Update**  
  - Now disabled when the sim is empty.  
  - General optimizations.  
- **Touch Function Enhancements**  
  - Checks for user input in the object description.  
  - Additional performance improvements.  
- **Setup Function Adjustments**  
  - Optimized setup sequence.  
  - Integrated with the new Debug function.  
- **New Debug Function**  
  - Accepts specific commands via object description:  
    - `"resetme"` → Resets script.  
    - `"nosettext"` → Disables release candidate `llSetText`.  
    - `"silent"` → Disables debug mode.  
    - `"debug"` → Enables debug mode.  
    - `"dosetup"` → Forces setup mode.  
- **Sim Population Function**  
  - Hibernates script if the simulator is empty.  
  - Sends an IM notification to the script owner in debug mode.  
- **Additional Color Vectors** for further customization.  

---

### **Minor Patch 2** 
*(Released: 09/24/23 - Version: 0.1.0a)*
- **Timer Events**  
  - Properly reset on touch.  
  - Adjusted event length dynamically on media change.  
- **Touch Function Fixes**  
  - Resets timer events correctly.  
  - Randomized URL selection.  
- **Setup Function Overhaul**  
  - Cleaned up function ordering.  
  - Ensures object name always updates.  
  - Improved color handling via `mediaFace` and `oppositeFace` variables.  
- **Debug Mode Enhancements**  
  - More verbose output for touch interactions and URL randomization.  
  - Fixed inconsistent debug variables.  
- **Code Optimization**  
  - Improved script readability.  
  - Removed redundant/unnecessary code.  

---

### **Minor Patch 1** 
*(Released: 09/22/23 - Version: 0.1.0)*
- **Implemented `media2Prim()` Function**  
  - Sets variables and executes media display function.  
- **New Customization Variables**  
- **General Code Cleanup**  
  - Compact debug lines.  
  - Optimized variable names and structure.  
  - Improved commenting and crediting.  
- **`hailsSetup()` Function Enhancements**  
  - Automatically applies appropriate prim face settings (black, transparent, blank texture).  
  - Updates object name and version.  
  - Adjusts physics state (phantom, drag function).  
- **Setup Verification**  
  - Checks for proper setup and reinitializes if necessary.  
  - Can be disabled via a script variable.  
