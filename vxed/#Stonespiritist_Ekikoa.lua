local flagged_count = 0

local function update_flags(client)
  local vxed_flag = tonumber(client:GetAccountBucket("god.flags.vxed")) or 0
  local pool_flag = tonumber(client:GetAccountBucket("god.flags.pool")) or 0
  local ferubi_flag = tonumber(client:GetAccountBucket("god.flags.ferubi")) or 0

  -- was able to flag 7 characters on live (2 permanent, 5 temporary) and didn't
  -- have enough characters to test limits. this is an assumption that live still
  -- has a limit to prevent excessive dzadd flagging
  eq.debug(string.format("flagged count [%s]", flagged_count))

  if flagged_count >= 8 then
    client:Message(MT.NPCQuestSay, "Ekikoa tells you, 'I'm afraid that I have already aided as many as I can, I do not have the strength to assist you further.'")
  elseif pool_flag == 3 or ferubi_flag == 1 then
    client:Message(MT.NPCQuestSay, "Ekikoa tells you, 'This stone behind me is a shard of an Attunement Obelisk.  With a unique and ancient magic, we can attune spirits to this farstone to allow travel.  When you touch it, the stone will be imprinted with your essence, because this is only a section of an obelisk, more must be done in order to have full use of these obelisks.  Now, when you touch this stone, you will be sent back to Udranda.  She will tell you what you must do next when you are ready.'")
    client:Message(MT.Yellow, "You feel at one with the Attunement Obelisk and feel the power of the earth moving through you.")
    client:SetAccountBucket('god.flags.vxed', '2')
    flagged_count = flagged_count + 1
  else
    client:Message(MT.NPCQuestSay, "Ekikoa tells you, 'I'm afraid I can do nothing to aid you.  You have not proven yourself to be a faithful friend of my people.  You must complete High Priest Diru's tasks before I can be permitted to grant you access to our sacred magic.'")
    client:Message(MT.Yellow, "You have gained a temporary character flag!  Seek out the High Priest's Scribe to find out more information.")
    client:SetAccountBucket('god.flags.vxed', '1')
    flagged_count = flagged_count + 1
  end
end

function event_spawn(e)
  eq.zone_emote(MT.Yellow, "A series of low chants comes to you from the Northeast, as Stonespiritist Ekikoa emerges from the shadows.")
end

function event_say(e)
  local tipt_flag = tonumber(e.other:GetAccountBucket("god.flags.tipt")) or 0
  local pool_flag = tonumber(e.other:GetAccountBucket("god.flags.pool")) or 0
  local has_tipt_access = (vxed_flag == 3)
  local from_sewers = (pool_flag == 3)

  if e.message:findi("hail") and not has_tipt_access then
    if from_sewers then 
      e.other:Message(MT.NPCQuestSay, "Ekikoa tells you, 'Ah, help has come.  I was told to expect friendly creatures from a distant land and here you are.  You are as alien as the others, but I know you have done good deeds for Udranda to send you here.  Now, I will tell you what you came for.  Obviously, the way to the temples is blocked. However, I [" .. eq.say_link("tend") .. "] to something very special here to overcome that problem.'")
    else
      update_flags(e.other)
    end
  elseif e.message:findi("tend") and not has_tipt_access then
    update_flags(e.other)
  end
end
