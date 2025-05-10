function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  I have a fair selection of leather armor, if you have need of such things.  I've also picked up a trinket or two from other travelers, though they didn't find them so valuable that they couldn't sell them to me,' Adsame smiles.");
	end
	if e.message:findi("assistance") then
		e.other:Message(MT.NPCQuestSay, "Adsame Leing says 'Oh?  What can I help you in crafting?  A [".. eq.say_link("muramite needle") .. "] or perhaps some hynid hair [" .. eq.say_link("thread") .. "]?'")
	end
	if e.message:findi("muramite needle") then
		e.self:Say("Hmm, a muramite needle you say?  A few adventurers passed through here recently and told me how to make one.  I do not think it will give me much trouble, but you'll need to get met the materials.  I'll need a Muramite Residue and three bone chips to make it.  I will charge you five thousand platinum coins for this service.")
	end
	if e.message:findi("thread") then
		e.self:Say("Thread made from hynid hair is quite strong, but difficult to create.  If you can provide me with three hynid hair strands and a muramite needle, however, I should be able to produce what you need.  I'll be using some of my hard earned skills at tailoring, so I'll also ask for a sum of five thousand platinum coins as well.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 60179, item2 = 60179, item3 = 60179, item4 = 60187, platinum = 5000}) then
	  e.other:Message(MT.NPCQuestSay, "Adsame Leing bows slightly as he takes the items from you, then works quickly to fashion some tough looking thread.  'Here you are my friend, good luck on your travels!'")
	  e.other:SummonItem(60188)
	end
	if item_lib.check_turn_in(e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 60178, platinum = 5000}) then
	  e.other:Message(MT.NPCQuestSay, "Adsame Leing bows slightly as he takes the items from you, then works quickly to create a sharp, rugged needle.  'Here you are my firend, good luck on your travels!'")
	  e.other:SummonItem(60187)
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
