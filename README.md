# Description

Have you ever wanted to have a list of random sayings to say in WoW, but don't want 10 different macros to say them? Need to congratulate your guildies, but don't want to always say the same old boring "Grats!"? Need a way to announce that you're rezzing someone, but don't want to say the same thing everytime and don't want a bloated addon that does more than what you need? SayRandomQuote could be for you! Simply create a set (or many sets) of random quotations or sayings and call them in-game with a simple slash command.

# Usage

* `/srq` - Says a random quote from the random quote list in your current chat. Current chat is determined in this order: Instance, Raid, Party, Say.
* `/srq [quotelist]` - Says a random quote from the specified quote list in your current chat. Current chat is determined in this order: Instance, Raid, Party, Say.
* `/srq [quotelist] [channel]` - Says a random quote from the specified quote list in the specified channel. Only default chat channels are supported at this time.

## Macros

To use these in a macro, simply include the slash command before or after the item/spell in your macro. The speech will fire at the same time as the item/spell:

```
#showtooltip
/srq rez
/cast Revive
```

# Use cases

* `/srq grats` - Say congratulations in your current chat. Great for guildies.
* `/srq pull` - Announces that you're pulling your target in your group chat.
* `/srq rez` - Announces that you're rezzing your target in your group chat.
* `/srq summon` - Announces who you are currently summoning to your group chat.

# Editing/adding quotesets and quotations

## Quotesets

A few generic quotesets with some quotes are included in the addon, but creating your own is super easy. Simply open `SayRandomQuote.lua` in a plain text editor such as Notepad and create a new set as below:

```
srq_quotes["setname"] = {
  "Your quotation goes here.",
  "Another quotation.",
  "Make sure your lines end with commas after the end quotation mark.",
}
```

## Quotations

Likewise, if you just want to add a new quotation to an existing quoteset, simply open `SayRandomQuote.lua` in a plain text editor such as Notepad and add your quotation using the following format:

```
"QUOTATION",
```

Don't forget the comma at the end of the line!

# Limitations

* Currently only default chat channels are supported. Custom chat channels are coming soon(tm).
* If you want to edit/add/remove quotations, you'll need to edit the LUA file. The ability to edit quotations in-game is on my list of things to potentially do maybe in the future probably.
* No LDB support. If you don't know what this is, it's not a limitation for you. If you do, it's definitely on my todo list.

# Bug reports

Please submit tickets via the [CurseForge system](https://wow.curseforge.com/addons/srq/tickets/) or [GitHub](https://github.com/xtoq/SayRandomQuote/issues). I prefer GH but I check both. If you need immediate assistance, you can try me on Twitter at [@xtoq](https://twitter.com/xtoq) or in-game as Mosrael at Hydraxis-US (Horde).

# Thanks

* Bleric, the original author of the addon. I have his/her permission to continue their work.
* Moongaze, for helping me with the ability to say things in different channels.
* Katzmew, for unknowingly encouraging me to get off my ass and update this thing.
* Spydir, for being a trooper when I test this and other addons. Also for the feedback. <3
