# Balatro AP Mod

This is a Mod for [Balatro](https://store.steampowered.com/app/2379780/Balatro/) that provides Integration for [Archipelago Multi World](https://archipelago.gg)

# Gameplay

After generating a seed every joker, voucher, booster pack, consumable (spectral, tarot, planet) is locked. You can unlock them by finding them in the world as AP items. 

Checks are beating a boss blind at a specific ante with a specific deck at a specific stake. This makes around 900 locations, but it is recommended to limit the amount of stakes that are considered locations (which is possible in the yaml). There are also buyable checks in the shop. 

There are bonus items, for example permanent bonus hand, permanent bonus starting money and more.
There are a few traps, for example lose one hand (for the current run), lose all money and more. 

There are a few more options, just check out the yaml that is bundled with the newest [release](https://github.com/BurndiL/BalatroAP/releases).

# Requirements

Needs [Steamodded (Alpha)](https://github.com/Steamopollys/Steamodded?tab=readme-ov-file#how-to-install-the-alpha) which is the 1.0 version there **MAKE SURE TO DOWNLOAD THE ALPHA**. You will have to install [Lovely](https://github.com/ethangreen-dev/lovely-injector/releases/tag/v0.5.0-beta5) as described there and then install the Steamodded Alpha. 

After installing that, you will also have to download `lua51.7z` from [lua apclient](https://github.com/black-sliver/lua-apclientpp/releases). 

From the `lua51.7z` extract the file `lua51-clang64-dynamic > lua-apclientpp.dll` and put it into your Balatro installation folder (the same folder you put the lovely dll). 
![Your Balatro Folder should look something like this (highlighted files should be there)](https://i.imgur.com/Pe5uTX4.png).

# Installation

To install this mod create a new folder in `%AppData%/Roaming/Balatro/Mods/` called `BalatroAP` and put the files from this repository in there. You can get those from the latest release. 

![Your AppData Folder should look something like this](https://i.imgur.com/3JzrdlV.png).

You should be good to go then! You can start the game normally over Steam and it should load the mod. If there are any issues, consider going to the [Archipelago After Dark Discord](https://discord.com/invite/fqvNCCRsu4) server, there is a Balatro thread somewhere. Or message me on Discord @Burndi. 

# Connecting

In Balatro you can simply connect by selecting the profile "Archipelago" in the profile selector. 
If you have a save file from a different AP session (so an entirely different multiworld) you **have to** delete the old save. 
It is adviced that you backup your existing save files, even though they should not be modified or deleted by this mod. 
