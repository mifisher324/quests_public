function event_say(e)
  local bar_bic = tonumber(e.other:GetBucket("god.bic.barindu")) or 0

  if e.message:findi('hail') then
    e.other:Message(MT.NPCQuestSay, "Hamisi Lerato looks despondent. 'I recently managed to escape from the city with my mother, but my sister is still stuck in there. She was too frightened to escape with us and now I fear she may be dead.'")
  end

  if bar_bic == 8 then
    if e.message:findi('alive') then
      e.other:Message(MT.NPCQuestSay, "A look of astonishment flashes across Hamisi's face. 'You've seen my sister? Is she ok? Where is she? Wait, there will be time to talk later. For now, you must return to her immediately. Our mother has been worrying herself to death and has grown very sick. I fear she won't last much longer. Please, take this shawl to my sister. It's our mother's. My sister will recognize it and know what it means. May the ocean speed your journey!'")
      e.other:SummonItem(64008)
    end
  end
end

function event_trade(e)
  local item_lib = require("items")

  item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
  e.other:Message(MT.NPCQuestSay, "Hamisi Lerato looks indecisive for a moment, then says, 'I'll try the malt beer, thanks.'")
end
