# What is this?
This is a mod for the flash game Madness Project Nexus, specifically made to improve the FPS and let players, even on lower devices, enjoy such a masterpiece of its time. While also allowing new players, on newer machines, play arena levels with many more units, while getting much less of the annoying FPS drops. 

I hope this project is one day enjoyed by all people!

## How do I play?
So there are 2 main ways to play with an SWF. Install the original **Flash Player**(which isn't really a security-first approach), or use Ruffle(which is a terrible choice because the performance improvements applied in this project do not improve your FPS at all).

You can install it right here: [click here](https://github.com/dyzqy/MPNc-Performance-Mod/raw/refs/heads/main/versions/Madness_Project_Nexus.swf)

## Known bugs
- Hands will flicker random skins(on certain weapons or actions)!
- Obstacles don't really obsticl-ate your passing
- Enemies flipping over?? (In the original game)
- Enemies passing through level boundaries
- Clips of guns ABOVE the gun? (In the original game)
- AI likes to cling to walls?
- Enemies facing right will have a default body skin

## What is to optimize?
So there is good news and bad news.

The good news? There are 2 functions that cause **all of the lag** inside the whole game.

The bad news? Those 2 functions are ginormous. One is 700+ lines long, the other is 500+ lines.

(There are some other functions that contribute to the lag but NOT AS MUCH AS THESE 2)

The main contributors to lag are as follows:
1. gotoAndStop()/nextFrame()
2. hitTest() 
3. Nested loops(2700+ checks when the function is ran!)
4. Garbage creaton(substr, new Object, localToGlobal, new Point, etc.)

Trying to separate and implement the performance improvements for these 2 functions isn't an easy task. It needs to be done gradually, fix by fix. Thankfully I already started doing some changes, but these changes, with me not knowing the whole scope of how everything works, eventually lead to bugs, so I would be thankful if you were to report them to me on discord. My username is **dyzqy**

## Current Progress
- adjustSprite(), causes lag the more units are present in the room. Approximately 75% of its performance improvements are done
- checkAttackHit(), FPS drops when a unit attacks using any type of weapon. About 2% of its performance improvements are done.
- ???, FPS drops when getting near units. 0% performance improvements have been done.
- ???, FPS drops when a unit desides to switch weapons. 0% performance improvements have been done.
- ???, FPS drops when entering a new or old room. 0% performance improvements have been done.
- ???, getting targeted(with the line of death or whatever it is called) causes huge lag spike in only some cases.

## Credits
- Main Programmer, Project Lead, Idea: dyzqy
- Helped with design and ideas: RinasSam
- Thanks to the Bros, they know who they are :x
- Testers: AnakinLuke0, E1820

Special thanks to RinasSam, for creating a way to program entirely on Visual Studio Code!
Special thanks to JPEXS for creating FFDEC, the tool used to modify the game!
Special thanks to the creators of the original MPNc! A beautiful game!
And finally, many thanks to whoever helped in the creation of this project!

## License
*Madness: Project Nexus (Classic)* and all original assets, art, audio, and base game code are the property of **Krinkels** (Matt Jolly) and **Swain** (Michael Swain). This is an unofficial, non-commercial fan modification and is not affiliated with or endorsed by the original creators. 

If you are a rights holder and would like this repository to be removed, please contact me on Discord (**dyzqy**) or open a GitHub issue.

All original code changes, patches, and documentation, and ONLY what was mentioned before, created for this performance mod are licensed under the [Apatche 2.0 License](LICENSE).