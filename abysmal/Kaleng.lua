function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("You looking for protection?  I gots da best.  Hard shell for soft ".. e.other:GetRaceName() .." body.");
	end
	if e.message:findi("assistance") then
		e.self:Say("You needs da smithin' help?  I gots you, friend.  I bet you needs da [" .. eq.say_link('Inferno Scepter') .. "] made.")
	end
	if e.message:findi("inferno scepter") then
		e.self:Say("Yep, no problem, " .. e.other:GetCleanName() .. "! You bring da Blazin Torch, Flarestone, Flarin Coals, and Mold, and me payment of five thousand platinum, and I make you for you!")
	end
end

function event_signal(e)
	if e.signal == 1 then
        e.self:Emote("laughs loudly.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 60184, item2 = 60182, item3 = 60183, item4 = 60186, platinum = 5000}) then
		e.other:Message(MT.NPCQuestSay, "Kaleng nudges you out of the way of the forge, then almost carelessly throws the items you've given him into it.  There is an explosion of flame as he hammers away, and in a short time, produces a fiery looking scepter.  He grins at you, 'Here you go, thanks for the monies!'")
		e.other:SummonItem(60181)
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
