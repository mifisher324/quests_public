local trials_task = 19
local kevren_task = 20
local tublik_task = 21
local trusik_task = 22

function event_say(e)
  if e.message:findi('hail') then
    if not e.other:IsTaskCompleted(trusik_task) then
      e.other:Message(MT.NPCQuestSay, "The Sentinel of the Altar ignores your every attempt to interact with it.")
    else
      get_expedition(e)
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  if item_lib.check_turn_in(e.trade, {item1 = 60173}) then
    get_expedition(e)
    e.other:SummonItem(60173)
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

function get_expedition(e)
  local dz_info = {
    expedition = { name="Ikkinz, Antechamber of Destruction", min_players=1, max_players=6 },
    instance = { zone="ikkinz", version=6, duration=eq.seconds("13h") },
    compass = { zone="kodtaz", x=1860, y=660, z=-447 },
    safereturn = { zone="kodtaz", x=1279, y=-2004, z=-349.375, h=336 },
    zonein = { x=1860, y=660, z=-447, h=0 },
  }
  local dz = e.other:CreateExpedition(dz_info)
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("14h"))
    e.other:Message(MT.NPCQuestSay, "The Sentinel of the Altar motions for you to enter the altar through the entrance behind him.")
  end
end
