srq_quotes = {}

function srq_OnLoad()

  SlashCmdList["SRQ"] = srq_SlashCommand;
  SLASH_SRQ1="/srq";
  SLASH_SRQ2="/sayrandomquote";

end

function srq_SlashCommand(var1)
  if var1=="" then var1="random"
  end
  q=srq_quotes[var1];
  if(q~=nil) then
    SendChatMessage(q[math.random(#q)],"SAY");
  else
    DEFAULT_CHAT_FRAME:AddMessage("That quote set doesn't exist! ("..var1..")");
  end
end
