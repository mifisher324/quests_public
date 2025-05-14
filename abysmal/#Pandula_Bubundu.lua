function event_say(e)
  local riw_bic = tonumber(e.other:GetBucket("god.bic.riwwi")) or 0
  local rep = e.other:GetFaction(e.self)

  if rep > 2 then
    e.other:Message(MT.NPCQuestSay, "Pandula Bubundu looks at you with tired eyes, but refuses to speak.  Perhaps she would speak to you if you were to gain the trust of her people somehow?")
  else
    if e.message:findi('hail') then
      e.other:Message(MT.NPCQuestSay, "Pandula Bubundu says 'What can I do for you? I'm waiting to hear word from the Wayfarer scouts. My niece has been captured by the Muramites and I only wish to discover if she is still alive. I can't take this, not knowing. I would much rather endure a thousand of those beast's whips than be kept in the dark. Please find her for me.'")
    end
  end
end

function event_trade(e)
  local riw_bic = tonumber(e.other:GetBucket("god.bic.riwwi")) or 0
  local rep = e.other:GetFaction(e.self)
  local item-lib = require("items")

  if rep > 2 then
    e.other:Message(MT.NPCQuestSay, "Pandula Bubundu shies away from the items you are trying to hand her.  Perhaps she would be more receptive if you were to gain the trust of her people somehow?")
  else
    if item_lib.check_turn_in(e.trade, {item1 = 52179}) then
      if riw_bic >= 2 then
        e.other:Message(MT.NPCQuestSay, "Pandula Bubundu sobs uncontrollably, tears welling up in her eyes, 'So my little one is still out there. This is wonderful news. I can now die in peace. The Wayfarers have transcribed my final wishes onto this parchment. Please deliver this to Namosa.'")
        e.other:SummonItem(52178)
        e.other:Faction(1770, 1)
        e.other:Faction(1771, -1)
      else
        item_lib.return_items(e.self, e.other, e.trade)
      end
    end
    if item_lib.check_turn_in(e.trade, {item1 = 52177}) then
      if riw_bic >= 2 then
        e.other:Message(MT.NPCQuestSay, "Pandula Bubundu looks quizzically at the symbol and rubs it in her hands. She smiles as if realizing something, 'Ah, Tentric, you are always right. I can't give up on this world or my family. I'm not sure why I was behaving so selfishly. Take this flower to my niece, she will know what it means.'")
        e.other:SummonItem(52175)
        e.other:Faction(1770, 1)
        e.other:Faction(1771, -1)
      else
        item_lib.return_items(e.self, e.other, e.trade)
      end
    end
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

