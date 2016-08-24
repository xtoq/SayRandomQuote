srq_quotes = {}

srq_quotes["grats"] = {
  " /congrats",
  " /congratulations",
  " /grats",
  " /gratz",
  "congrats",
  "congrats!",
  "congratulations",
  "grats",
  "gratz",
  "GRATZ!",
  "gratz!",
  "way to go",
  "wtg",
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
    parameter = "INSTANCE";

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
