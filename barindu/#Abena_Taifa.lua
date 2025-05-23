-- Task ID definitions
local bic_abysmal = 9
local bic_qinimi = 8
local bic_barindu = 10
local bic_riwwi = 11
local bic_ferubi = 12
local bic_sewers = 13
local bic_vxed = 14
local bic_tipt = 15
local bic_outer = 16
local bic_yxtta = 17
local bic_kodtaz = 18

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 64007}) then --poisoned fruit
		e.self:Say("Proteri sent word that you would be coming. I have bad news. It seems Ixvet has gotten wind of a plot on his life and has grown paranoid. He has started changing his personal servants on a regular basis and I was replaced by Chiaka Lerato yesterday. I'm afraid that I'm not going to be able to help you anymore. Please, keep the fruit for now.");
		e.other:SummonItem(64010); --poisoned fruit
    e.other:UpdateTaskActivity(bic_barindu, 8, 1)
  end
  if item_lib.check_turn_in(e.trade, {item1 = 64009}) then --Serving tray
    e.other:UpdateTaskActivity(bic_barindu, 14, 1)
    check_final_turnin(e)
  end
  if item_lib.check_turn_in(e.trade, {item1 = 64010}) then --Poisoned Fruit
    e.other:UpdateTaskActivity(bic_barindu, 13, 1)
    check_final_turnin(e)
  end
	item_lib.return_items(e.self, e.other, e.trade)
end

function check_final_turnin(e)
  if e.other:IsTaskActivityActive(bic_barindu, 15, 1) then
    e.self:Say("Just in time! Ixvet is due for his next meal in a few minutes. With Chiaka out of the way, I'll be able to serve him. I hope this poison isn't noticeable. Here, I've managed to secret this away from the guards up until now and I hate to think about those beasts getting their hands on it. Please hold onto it for me. If this goes well, I won't need it anymore.");
    e.other:QuestReward(e.self,0,0,0,0,64018,50000); --Item: Abena's Collar of Liberation
    eq.start(57);
    e.other:Faction(1761, 50); -- Faction: Nihil
	end
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
		e.self:Emote("glances at you, then goes back to her work, fear evident in her posture.")
	end
end
