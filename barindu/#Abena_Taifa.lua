function event_trade(e)
	local item_lib = require("items");
  local bar_bic = tonumber(e.other:GetBucket("god.bic.barindu")) or 0
	if (item_lib.check_turn_in(e.trade, {item1 = 64007})) then --poisoned fruit
    if bar_bic == 6 then
			e.self:Say("Proteri sent word that you would be coming. I have bad news. It seems Ixvet has gotten wind of a plot on his life and has grown paranoid. He has started changing his personal servants on a regular basis and I was replaced by Chiaka Lerato yesterday. I'm afraid that I'm not going to be able to help you anymore. Please, keep the fruit for now.");
			e.other:SummonItem(64010); --poisoned fruit
      e.other:SetBucket("god.bic.barindu", "7")
    else
    	item_lib.return_items(e.self, e.other, e.trade)
    end
  end
  if (item_lib.check_turn_in(e.trade, {item1 = 64009,item2 = 64010})) then --serving tray / poisoned fruit
    if bar_bic == 9 then
      e.self:Say("Just in time! Ixvet is due for his next meal in a few minutes. With Chiaka out of the way, I'll be able to serve him. I hope this poison isn't noticeable. Here, I've managed to secret this away from the guards up until now and I hate to think about those beasts getting their hands on it. Please hold onto it for me. If this goes well, I won't need it anymore.");
      e.other:SummonItem(64018)
      eq.start(57);
      e.other:Faction(1761, 50); -- Faction: Nihil
      e.other:SetBucket("god.bic.barindu", "10")
    else
    	item_lib.return_items(e.self, e.other, e.trade)
		end
  end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
  if (e.wp == 9) then
    e.self:Say("Ikaav Ixvet Pox, I humbly present you with your meal.");
    eq.signal(283050,1,6000); --signal iip
    e.self:SetPseudoRoot(true)
  end
 end
      
function event_signal(e)
	if(e.signal == 1) then
        	e.self:SetAppearance(3);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.other:Message(MT.NPCQuestSay, "Abena Taifa glances at you, then goes back to her work, fear evident in her posture.")
	end
end
