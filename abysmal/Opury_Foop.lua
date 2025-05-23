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
  local item_lib = require("items")
  
  if item_lib.check_turn_in(e.trade, {item1 = 67514}) then --Talwin's Journal Page 1
    e.other:UpdateTaskActivity(bic_barindu, 0, 1)
    if e.other:IsTaskActivityActive(bic_barindu, 2, 1) then
      e.other:Message(MT.NPCQuestSay, "Opury Foop says 'What's this . . . Oh, you must be one of the adventurers helping us with our scout issue. Taminoa will be excited to see this. Talwin and Tam were really close before Talwin joined the brotherhood, but it is really not my place to give you any more details. I will leave that to him. Now, let me see. According to what Talwin has written here, the head slaver is a being known as Ixvet Pox who spends much of his time in the Stone Worker Yard. Apparently he forces the slaves to use their control over the stone workers to protect him. Sounds like that may be the best place to start looking for more Talwin clues. Wait a second. There are some more notes here on the second page. Seems Talwin was able to build a rapport with the head slave in the area. His name is Proterri and it says here that he was planning to poison the head slaver and try to start a slave revolt. While it seems you could easily go find the head slaver, I would suggest talking to Proterri first and asking him about Talwin. Either way, whatever information you find out regarding Talwin, please return it to Taminoa. I should have finished helping him get things in order by the time you return.'")
    end
  elseif item_lib.check_turn_in(e.trade, {item1 = 67515}) then -- Talwin's Journal Page 2
    e.other:UpdateTaskActivity(bic_barindu, 1, 1)
    if e.other:IsTaskActivityActive(bic_barindu, 2, 1) then
      e.other:Message(MT.NPCQuestSay, "Opury Foop says 'What's this . . . Oh, you must be one of the adventurers helping us with our scout issue. Taminoa will be excited to see this. Talwin and Tam were really close before Talwin joined the brotherhood, but it is really not my place to give you any more details. I will leave that to him. Now, let me see. According to what Talwin has written here, the head slaver is a being known as Ixvet Pox who spends much of his time in the Stone Worker Yard. Apparently he forces the slaves to use their control over the stone workers to protect him. Sounds like that may be the best place to start looking for more Talwin clues. Wait a second. There are some more notes here on the second page. Seems Talwin was able to build a rapport with the head slave in the area. His name is Proterri and it says here that he was planning to poison the head slaver and try to start a slave revolt. While it seems you could easily go find the head slaver, I would suggest talking to Proterri first and asking him about Talwin. Either way, whatever information you find out regarding Talwin, please return it to Taminoa. I should have finished helping him get things in order by the time you return.'")
    end
  end
end
