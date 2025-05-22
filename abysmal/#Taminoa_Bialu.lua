function event_say(e)
  if e.message:findi('qinimi') then
    e.other:AssignTask(8)
  end
end

function event_trade(e)
  local item_lib = require("items")

  if item_lib.check_turn_in(e.trade, {item1 = 67397}) then
    e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Yes. This is exactly what I needed. Excellent job. Okay, now give me one moment to decipher this . . . hm. It seems that just before he was captured he was trying to communicate with the slaves in the area. The text is very hard to make out, but it looks like he may have been trying to get into the main headquarters. He was interacting with a particular slave named Sislono Nislan. This slave promised him a way into the headquarters only if he promised to rid the area of a tyrant, named Tixxrt. The rest of the parchment is undecipherable. I would suggest finding this slave and showing him this to see if he knows what happened.'")
    e.other:UpdateTaskActivity(8, 1, 1) --Update task 8, activity 1
    e.other:SummonItem(67700)
  end

  item_lib.return_items(e.self, e.other, e.trade)
end

