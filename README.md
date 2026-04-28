# hails.media2Prim 📡  
*A Notecard-based LSL script that randomly selects URLs and displays media on a prim.*

![GitHub Repo stars](https://img.shields.io/github/stars/Hailey-Ross/hails.media2Prim?style=social)  
![GitHub forks](https://img.shields.io/github/forks/Hailey-Ross/hails.media2Prim?style=social)  
![GitHub last commit](https://img.shields.io/github/last-commit/Hailey-Ross/hails.media2Prim/main)  
![GitHub issues](https://img.shields.io/github/issues/Hailey-Ross/hails.media2Prim)

## Table of Contents  
- [Preview](#preview)  
- [Example Notecard](#example-notecard)  
- [Usage](#usage)  
- [Features](#features)  
- [To-Do](#to-do)  
- [Change Log](#change-log)  

## Preview  
[Preview](https://assets.hails.cc/i/m2p/preview.gif)  
*Click the image above to view a demonstration.*

## Example Notecard  
By default, the script requires a Notecard named **`hails.urls`** unless manually changed in the script.

Example contents of `hails.urls`:
```txt
https://example.com/media1.mp4
https://example.com/media2.png
https://example.com/media3.gif
```

---

## Usage  

### **Rez a Prim**  
- A `Box/Square` shape is **recommended** for best display results.  

### **Create a Notecard**  
- Name it **`hails.urls`**.  
- Add video/image URLs, one per line.  

### **Add the Script**  
- Create a new script inside the prim.  
- Copy & paste the contents of **`main.lsl`**.  
- Modify as needed.  
- Save the script.  

### **Adjust & Enjoy**  
- Position and resize the prim as desired.  
- The script will **randomly display** media from the Notecard.  

## Features  
- Supports **images, GIFs, and videos**  
- Uses a **randomized selection** of URLs  
- **Debug Mode** available via object description commands  
- **Low-impact performance** with automatic hibernation  
- **Customizable media face** settings  
- Optimized **timer events & touch interactions**  

## To-Do  
- **Additional customization settings**  
- **Performance improvements**  

# Change Log  

| **Version** | **Release Date** | **Changes & Improvements** |
|------------|----------------|-----------------------------|
| **0.1.1b** | 11/13/23 | Script optimizations, Fullbright setting, and README updates |
| **0.1.1a** | 10/14/23 | Timer event updates, Debug function improvements, and Sim population check |
| **0.1.0a** | 09/24/23 | Touch function fixes, setup optimizations, and color vector updates |
| **0.1.0**  | 09/22/23 | Initial release, media2Prim function implementation, and code cleanup |

For a detailed breakdown, see the **[full patch notes](#detailed-change-log).**

## Detailed Change Log  

### **Minor Patch 4** *(11/13/23 - v0.1.1b)*  
- **Optimized script size** (truncated lines & concatenated functions).  
- **Improved script comments** (proofreading & updates).  
- **Fixed setup functionality:**  
  - `Fullbright` now automatically enabled for `MediaFace`.  
- **README formatting & cleanup**.  

### **Minor Patch 3** *(10/14/23 - v0.1.1a)*  
- **Timer Events Update**  
  - Disabled when the **sim is empty** to save resources.  
  - General optimizations.  
- **Touch Function Enhancements**  
  - Checks for **user input** in the Object Description.  
  - **Improved event handling.**  
- **Setup Function Adjustments**  
  - Improved sequence and added Debug integration.  
- **New Debug Function**  
  - Commands via Object Description:  
    - `"resetme"` → Resets script  
    - `"nosettext"` → Disables `llSetText`  
    - `"silent"` → Mutes debug mode  
    - `"debug"` → Enables debug mode  
    - `"dosetup"` → Forces setup mode  

## Contributing  
Interested in contributing? Feel free to fork the repo and submit a pull request! 🎉  

## Author  
**Hailey (Hails)**   
  
  
💜 *If you found this useful, consider leaving a ⭐ on GitHub!*  
![GitHub Repo stars](https://img.shields.io/github/stars/Hailey-Ross/hails.media2Prim?style=social)
