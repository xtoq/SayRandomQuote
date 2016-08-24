srq_quotes = {}

srq_quotes["grats"] = {
  " /congrats",
  " /congratulations",
  " /grats",
  " /gratz",
  " /hi5",
  " /hifuqing5",
  " /high5",
  " /highfive",
  " /highfuckingfive",
  " /highphive",
  " /hiphive",
  "'Don't measure yourself by what you have accomplished, but what you should have accomplished with your ability.' - John Wooden",
  "GRATZ!",
  "Gratz, but remember: 'There are basically two types of people. People who accomplish things, and people who claim to have accomplished things. The first group is less crowded.' - Mark Twain",
  "It is not the mountain we conquer but ourselves. - Edmund Hillary",
  "It's always the adventurous that accomplish great things",
  "OMG GRATZ! ;)",
  "There is only one measurement for success in WoW: BOSS is DEAD = WIN!",
  "V(-.-)V grats",
  "V(-.o)V grats",
  "\\/\\/ O 0 +",
  "\\m/ >.< \\m/ ROCK ON!",
  "\\o/ yay!",
  "comhghairdeas (congratulations in Irish)",
  "congrats!",
  "congrats",
  "congratu-freaking-lations",
  "congratulations are the civility of envy...so congrats lol",
  "congratulations",
  "congratulazioni (congratulations in Italian)",
  "felicidades (congratulations in Spanish)",
  "felicitaties (congratulations in Dutch)",
  "felicitations (congratulations in French)",
  "garzibalizik (congratulations that I made up just for Furry)",
  "gluckwunsche (congratulations in German)",
  "grats dude",
  "grats!",
  "grats",
  "grats. 'There is no happiness except in the realization that we have accomplished something.' - Henry Ford",
  "gratz dude",
  "gratz!",
  "gratz",
  "here's a cookie",
  "here's a cookie: O",
  "here's a cookie: {circle}",
  "hongera (congratulations in Swahili)",
  "if i seem impressed, i'm not. jk! grats. =)",
  "its ggggggggggggggggratz!",
  "jesus how many times do i have to say this in one day? gratz! =)",
  "jesus how many times do i have to say this in one day? gratz!",
  "o / \\ o High five!",
  "onnitlused (congratulations in Estonian)",
  "parabens (congratulations in Galician, no its not an alien language)",
  "starg",
  "the virtue of deeds lies in completing them...congratulations",
  "urime (congratulations in Albanian)",
  "w00+",
  "w00t",
  "way to go",
  "well done",
  "woot!",
  "wtg",
  "you want a cookie or something? jk gratz!",
}

srq_quotes["mount"] = {
  "Regulators...mount up.",
  "I'll get you my pretty, and your little dog too!",
  "Ding dong the witch ain't dead!",
  "Why walk when you can ride?",
  "You like it?  Thank the boys at 'Pimp my Mount.'",
  "Don't you wish your mount was hot like mine?",
  "I'm out of here.",
  "",
  "",
  "",
  "",
  "",
  "",
}

srq_quotes["pull"] = {
  ">>> Pulling %t <<<",
  "<<< Pulling %t >>>",
  "Pulling %t!",
}

srq_quotes["rez"] = {
  ">>> Rezzing %t <<<",
  "<<< Rezzing %t >>>",
  "Incoming rez for %t",
  "Rez: %t",
}

srq_quotes["random"] = {
  "Roses are red, violets are blue, all of my base are belong to you.",
}

srq_quotes["summon"] = {
  "Summoning %t, please click.",
  "%t needs a summon, click please.",
  "Summoning %t.  Clicky clicky por favor.",
}

function srq_OnLoad()

  SlashCmdList["SRQ"] = srq_SlashCommand;
  SLASH_SRQ1="/srq";
  SLASH_SRQ2="/sayrandomquote";

end

function srq_SlashCommand(var1)

  -- Declare what we'll be using as local, so it doesn't mess
  -- with another addon's global variables

  -- q = slash command?
  -- command = quoteset?
  -- parameter = channel?
  -- index = counter for separating the variables?

  local q, command, parameter, index

  -- If no quoteset is passed, say one from the quoteset named "random."
  -- FUTURE: allow user to set default quoteset via saved variables.

  if var1=="" then var1="random"
  end

  -- Find the position of the parameters, if they exist. For
  -- a chat command, you will have this typical setup:
  --
  -- /trigger command parameter
  --
  -- But when the slash handler gets this information, the
  -- string passed is "command parameter" which is why
  -- we need to split it up. For this code, command
  -- will represent the quote group to use, and parameter
  -- will be the chat type to use.
  --
  -- /srq [quoteset] [channel]

  index = string.find(var1, " ");

  -- If there were parameters found, separate them from the command

  if ( index ) then

    command = string.sub(var1, 1, index-1);
    parameter = string.sub(var1, index+1);

    -- Otherwise, we just have a command, so set our parameter to whatever chat channel fits.

    -- Instance group

  elseif IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
    command = var1;
    parameter = "INSTANCE_CHAT";

    -- Raid group

  elseif IsInRaid() then
    command = var1;
    parameter = "RAID";

    -- Party

  elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
    command = var1;
    parameter = "PARTY";

    -- Say

  else
    command = var1;
    parameter = "SAY";

  end

  q=srq_quotes[command];

  -- When sending the chat message, make sure the parameter is uppercase

  if(q~=nil) then
    SendChatMessage(q[math.random(#q)], string.upper(parameter));
  else
    ChatFrame1:AddMessage("That quote set doesn't exist! ("..command..")");
  end

end
