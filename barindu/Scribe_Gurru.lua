-- Scribe_Gurru NPCID:283052
local function convert_temp_flag(client, flag_name, flag_msg)
  -- Note: characters on live that received a temporary flag will forever receive
  -- "temporary" messages when repeating expeditions even after made permanent.
  -- Just a quirk in their priority flag checks (they probably use a separate flag)
  client:Message(MT.NPCQuestSay, string.format("Gurru tells you, 'I see that you have helped your friends accomplish things in %s.  I will tell the High Priest of your deeds.  You should seek an audience with him and see if there is anything else that you can help us with.'", flag_msg))
  client:SetAccountBucket(flag_name, "2")
  client:Message(MT.Yellow, "Your temporary character flag has been converted into a permanent flag!")
end

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scribe Gurru says, 'Please do not bother the High Priest with petty issues, he has enough on his mind.  If you have other [" .. eq.say_link("issues") .. "] to discuss let me know.'")
  elseif e.message:findi("issues") then
    -- converts temporary flags into permanent flags if at right point in progression
    -- temporary flags are from completing expeditions with others outside progression
    local tipt_flag = tonumber(e.other:GetAccountBucket('god.flags.tipt')) or 0
    local vxed_flag = tonumber(e.other:GetAccountBucket('god.flags.vxed')) or 0
    local has_vxed_access = (vxed_flag == 2)
    local has_tipt_access = (tipt_flag == 2)

    local sewers_flag = tonumber(e.other:GetAccountBucket('god.flags.sewers')) or 0
    local plant_flag = tonumber(e.other:GetAccountBucket('god.flags.plant')) or 0
    local lair_flag = tonumber(e.other:GetAccountBucket('god.flags.lair')) or 0
    local crem_flag = tonumber(e.other:GetAccountBucket('god.flags.crematory')) or 0
    local kt_flag = tonumber(e.other:GetAccountBucket('god.flag.kt')) or 0

    -- permanent flag for previous sewer indicates character is on that step

    if sewers_flag == 1 and plant_flag == 1 then
      convert_temp_flag(e.other, "god.flags.plant", "the Purifying Plant")
    elseif sewers_flag == 1 and plant_flag >= 2 and crem_flag == 1 then
      convert_temp_flag(e.other, "god.flags.crematory", "the Crematory")
    elseif sewers_flag == 1 and plant_flag >= 2 and crem_flag >= 2 and lair_flag == 1 then
      convert_temp_flag(e.other, "god.flags.lair", "the Lair of Trapped Ones")
    elseif sewers_flag == 1 and plant_flag >= 2 and crem_flag >= 2 and lair_flag >= 2 and pool_flag == 1 then
      convert_temp_flag(e.other, "god.flags.pool", "the Pool of Sludge")
    elseif sewers_flag == 1 and plant_flag >= 2 and crem_flag >= 2 and lair_flag >= 2 and pool_flag >= 2 and vxed_flag == 1 then
      convert_temp_flag(e.other, "god.flags.vxed", "Vxed")
    elseif has_vxed_flag and tipt_flag == 1 then
      convert_temp_flag(e.other, "god.flags.tipt", "Tipt")
    elseif has_tipt_flag and has_vxed_flag and kt_flag == 0 then
      e.other:Message(MT.NPCQuestSay, "Scribe Guru says, 'I see you have helped Apprentice Udranda with navigating the mountains.  I will tell the High Priest of your deeds.  Be careful in the mountains, there is a reason we exiled the Trusik there...'")
      e.other:Message(MT.LightBlue, "You have gained a character flag!")
      e.other:SetAccountBucket("god.flags.kt", "1")
    elseif kt_flag > 0 then
      e.other:Message(MT.NPCQuestSay, "Scribe Guru says, 'You have been a great help to the inhabitants of Barindu.  You should venture into the mountains and seek the temples there.  Please drive out these invaders from our land!")
    else
      e.other:Message(MT.NPCQuestSay, "Gurru tells you, 'I see that you have completed some deeds for our people and we appreciate it.  Before I can tell the High Priest of your work though, you will need to talk to him and finish some other tasks.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
