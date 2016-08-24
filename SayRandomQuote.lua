srq_quotes = {}

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

srq_quotes["guildgratz"] = {
"/g gratz!",
"/g congrats!",
}

srq_quotes["gratz"] = {
"gratz!",
"congrats!",
"way to go",
"you want a cookie or something? jk gratz",
"congratulations are the civility of envy...so congrats lol",
"jesus how many times do i have to say this in one day? gratz!",
"congratulations",
"grats",
"gratz",
"gratz!",
"gratz",
"the virtue of deeds lies in completing them...congratulations",
"Gratz, but remember: 'There are basically two types of people. People who accomplish things, and people who claim to have accomplished things. The first group is less crowded.' - Mark Twain",
"'Don't measure yourself by what you have accomplished, but what you should have accomplished with your ability.' - John Wooden",
"grats. 'There is no happiness except in the realization that we have accomplished something.' - Henry Ford",
"It is not the mountain we conquer but ourselves. - Edmund Hillary",
" /congratulations",
"it's always the adventurous that accomplish great things",
}

srq_quotes["random"] = {
"Roses are red, violets are blue, all of my base are belong to you.",
"Every fight is a food fight when you're a cannibal.",
"Friendship is like peeing on yourself: everyone can see it, but only you get the warm feeling that it brings.",
"There are no stupid questions, just stupid people.",
"It takes 46 muscles to frown but only 4 to flip 'em the bird.",
"A hippie is someone who looks like Tarzan, walks like Jane and smells like Cheetah.",
"Outside of a dog, a book is man's best friend. Inside of a dog, it's too dark to read.",
"Drawing upon my fine command of language, I say nothing. ",
"I know that you believe you understand what you think I said, but I'm not sure you realize that what you heard is not what I meant.",
"I'm so clever that sometimes I don't understand a single word of what I'm saying.",
"Everyone has a photographic memory, some just don't have film.",
"Friends are like bras, close to your heart and there for support.",
"Just because no one complains doesn't mean all parachutes are perfect.",
"I used to think I was indecisive but now I'm not so sure.",
"Since light travels faster than sound, some people appear bright until they speak.",
"On the other hand, you have different fingers.",
"You're only young once, but you can be immature forever.",
"I started out with nothing and I still have most of it.",
"A thunderstorm is God's way of saying you spend too much time playing WoW.",
"I've never had a problem with drugs, I've only had problems with the police.",
"The problem with political jokes is that they always get elected.",
"Fighting for peace is like screwing for virginity.",
}

srq_quotes["facepalm"] = {
"You're turning me emo.",
"Oh how the not so mighty have slipped further.",
"One day, I will be able to point at you and you will die. That's not a threat, it's religious prophecy.",
}

srq_quotes["bye"] = {
"Farewell, metaphors be with you.",
"See ya later.",
"All good things must come to an end, but all bad things can continue forever.",
}

srq_quotes["drain"] = {
"Don't cross the streams!!",
"I suck....your soul!",
"Get over here!",
"It is better for civilization to be going down the drain than to be coming up it.",
"I put my heart and my soul into my work, and have lost my mind in the process.",
"Your own soul is nourished when you are kind; it is destroyed when you are cruel.",
"Whatever satisfies the soul is truth.",
"A soul you say? Give my pocketwatch to a savage and he'll think it has a soul!",
"The finest souls are those that have the most variety and suppleness.",
"There's nothing that cleanses your soul like getting the hell kicked out of you.",
"Defeat may serve as well as victory to shake the soul and let the glory out.",
"If you're losing your soul and you know it, then you've still got a soul left to lose.",
"To be somebody you must last.",
"To possess taste, one must have some soul. Let me have yours.",
"Your soul will be dead even before your body; fear nothing further.",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
}

function srq_OnLoad()

  SlashCmdList["SRQ"] = srq_SlashCommand;
  SLASH_SRQ1="/srq";
  SLASH_SRQ2="/sayrandomquote";

end

function srq_SlashCommand(var1)

  -- Declare what we'll be using as local, so it doesn't mess
  -- with another addon's global variables

  local q, command, parameter, index

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

  index = string.find(var1, " ");

  -- If there were parameters found, separate them from the command

  if ( index ) then

    command = string.sub(var1, 1, index-1);
    parameter = string.sub(var1, index+1);

  -- Otherwise, we just have a command, so set our parameter to the
  -- default chat type of "say"

  else

    command = var1;
    parameter = "SAY";

  end

  q=srq_quotes[command];

  -- When sending the chat message, make sure the parameter is uppercase

  if(q~=nil) then
    SendChatMessage(q[math.random(#q)], string.upper(parameter));
  else
    DEFAULT_CHAT_FRAME:AddMessage("That quote set doesn't exist! ("..command..")");
  end

end
