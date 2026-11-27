# What is this?
This is a mod for the flash game **[Madness Project Nexus Classic](www.newgrounds.com/portal/view/592473)**. The goal for this mod is to improve the performance & FPS to let players, even on lower devices, enjoy such a masterpiece. While also enabling for more chaotic and smooth gameplay even when there are tens of enemies on the same screen.

This mod also plans to fix original game bugs, which in the code will be indicated in comments as `OG BUG`. These fixes, however, will be held off until most performance improvements are implemented. Perhaps even 2 different versions will be available, one with bug fixes and one without.

## How to play?
There are 2 main ways to play with an SWF. 
- **Standalone Adobe Flash Player 32** *(Recommended)*, allows you to experience the original game as intended, with all of the performance improvements having full effect.
- **Ruffle** *(Not Recommended)*, runs safely in modern browsers without any installs needed, **but** not all the optimizations in this mod will not improve your FPS on Ruffle(version 0.8.0).

Download **[Madness_Project_Nexus.swf](https://github.com/dyzqy/MPNc-Performance-Mod/raw/refs/heads/main/versions/Madness_Project_Nexus.swf)**
> Note: This version might include game breaking bugs, unfinished performance improvements, or crashes. You are HIGHLY advised to seek a download through the [Releases](https://github.com/dyzqy/MPNc-Performance-Mod/releases) page. 

<!--
## Known bugs
- Hands will flicker random skins(on certain weapons or actions)!
- Obstacles don't really obsticl-ate your passing
- Enemies flipping over?? (In the original game)
- Enemies passing through level boundaries
- Clips of guns ABOVE the gun? (In the original game)
- AI likes to cling to walls?
- Enemies facing right will have a default body skin -->

## The Difficulties
Before I started working on this project earnestly and only did changes here and there, I thought lag came from only 2 places: adjustSprite() & checkAttackHit(). And boy did I hope I was right. 

Finding the reason for the lag inside the game right at the start saves you alot of headache, but day after day of work, a realization became apparant... These 2 functions do not contribute to all of the FPS drops in the game. But I still had hope in Adobe Scout. So I asked my friend to turn it on and test it, and then I realized that because the game was written in AS2, it shows no method calls that are the reason for the lag.

And so this is where the real hardship of the project came to be. What is *really* difficult about this project isn't programming the fixes, those can be done with time. It is finding where lag originates from. *That* is what causes the most headache. Finding *where* exactly that pesky code is throwing you off is what separates you from having the day of your life and remaining homeless for the rest of your life. As you already know, 99% of gamblers quit before they win big. 

As time goes on, I will be able to identify more and more bottlenecks, but that isn't something that can be done overnight. The only supposed saving grace(s), Adobe Scout & Tracy, both do not offer following method calls for AS2, meaning everything needs to be done manually, from searching to fixing the oversights. 

AI, even if used as a tool, cannot handle such magnitude of a project either, and fails at the simplest instructions given. Either at finding, or implementing. Which means this mountain of work needs to be manually, with only the slightest help from Artificial Intelligence(not so intelligent however).

## Current Progress(estimates)
- `adjustSprite()`, approximately **40%** of its performance improvements are done
  - causes lag the more units are present in the room.
  - `ItemGenerator.setItemSprite()`, **100%** of its performance improvements are done
    - getting near enemy units causes lag spikes
- `checkAttackHit()`, FPS drops when a unit attacks using any type of weapon. About 10% of its performance improvements are done.
  - Whenever an enemy unit uses a melee attack, a lag spike is followed.
- ???, FPS drops when a unit decides to switch weapons. 0% performance improvements have been done.
  - NOT caused by `adjustSprite()`.
- ???, FPS drops when entering a new or old room. 0% performance improvements have been done.
- ???, getting targeted(with the line of death or whatever it is called) causes huge lag spike in only some cases.

## Credits
- **Main Programmer, Project Lead & Idea**: dyzqy
- **Profiling & Miscellaneous Help**: RinasSam
- **Testers**: AnakinLuke0, E1820
- **Special thanks to**: 
  - **RinasSam**, for creating a workflow to program entirely on Visual Studio Code!
  - **JPEXS** for creating FFDEC
  - **Krinkels & Swain**, for creating the original *Madness: Project Nexus (Classic)*

## License
*Madness: Project Nexus (Classic)* and all original assets, art, audio, and base game code are the property of **Krinkels** (Matt Jolly) and **Swain** (Michael Swain). This is an unofficial, non-commercial fan modification and is not affiliated with or endorsed by the original creators. 

If you are a rights holder and would like this repository to be removed, please contact me on Discord (**dyzqy**) or open a GitHub issue.

All original code changes, patches, and documentation created for this performance mod are licensed under the [Apatche 2.0 License](LICENSE).