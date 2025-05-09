function event_say(e)
  local tipt_flag = tonumber(e.other:GetAccountBucket("god.flags.tipt")) or 0
  local kt_flag = tonumber(e.other:GetAccountBucket("god.flags.kt")) or 0
  local has_kodtaz_access = (kt_flag == 2)
  local has_tipt_access = (tipt_flag == 2)

  if e.message:findi("hail") then
    -- this expedition gets locked so no need to track flagged count
    if has_kodtaz_access then
      e.other:Message(MT.NPCQuestSay, "Okkanu tells you, 'I'm afraid that I have already aided as many as I can, I do not have the strength to assist you further.")
    else
      -- live gives the same message whether it's a temporary or permanent flag
      e.other:Message(MT.NPCQuestSay, "Okkanu tells you, 'I'm sorry, I can do nothing for you my friend.  Your bravery is notable, but I'm sure you can understand that we just can't trust anyone with our ancient magic.  It would be far too dangerous for my people.'")
      if has_tipt_access then
        e.other:SetAccountBucket("god.flags.kt", "2")
      else
       e.other:Message(MT.Yellow, "You have gained a temporary character flag!  Seek the High Priest's Scribe to find out more information.")
       e.other:SetAccountBucket("god.flags.kt", "1")
      end
    end
  end
end
