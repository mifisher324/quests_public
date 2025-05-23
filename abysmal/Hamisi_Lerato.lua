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

function event_say(e)
  if e.message:findi('hail') then
    e.other:Message(MT.NPCQuestSay, "Hamisi Lerato looks despondent. 'I recently managed to escape from the city with my mother, but my sister is still stuck in there. She was too frightened to escape with us and now I fear she may be dead.'")
  end
  if e.message:findi('chiaka is alive') and e.other:IsTaskActivityActive(bic_barindu, 11) then
    e.other:Message(MT.NPCQuestSay, "A look of astonishment flashes across Hamisi's face. 'You've seen my sister? Is she ok? Where is she? Wait, there will be time to talk later. For now, you must return to her immediately. Our mother has been worrying herself to death and has grown very sick. I fear she won't last much longer. Please, take this shawl to my sister. It's our mother's. My sister will recognize it and know what it means. May the ocean speed your journey!'")
    e.other:SummonItem(64008)
    e.other:UpdateTaskActivity(bic_barindu, 11, 1)
  end
end
