function event_spawn(e)
	eq.set_timer("depop", 600 * 1000); --need confirmation
end

function event_say(e)
  local fer_bic = tonumber(e.other:GetBucket("god.bic.ferubi")) or 0
	if e.message:findi("hail") then
		e.other:Message(MT.LightBlue, "You feel a chill surround your body as a voice enters your mind. 'Thank you for releasing me from an eternity of suffering. Now you must help the others on this continent whose fate I fear is much worse than mine. You must seek out Apprentice Udranda in Barindu. She can help you gain access to the temples beyond the mountain passes.");
    if fer_bic == 3 then
			e.other:SummonItem(67526); -- Item: Rondo's Report
      e.other:SetBucket("god.bic.ferubi", "4")
		end
    e.other:SetAccountBucket("god.flags.ferubi", "1");
    e.other:Message(MT.LightBlue, "You receive a character flag!");
	end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end
