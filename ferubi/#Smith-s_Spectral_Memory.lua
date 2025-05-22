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

function event_spawn(e)
	eq.set_timer("depop", 600 * 1000); --need confirmation
end

function event_say(e)
	if(e.message:findi("hail")) then
	  e.other:Message(MT.LightBlue, "You feel a chill surround your body as a voice enters your mind. 'Thank you for releasing me from an eternity of suffering. Now you must help the others on this continent whose fate I fear is much worse than mine. You must seek out Apprentice Udranda in Barindu. She can help you gain access to the temples beyond the mountain passes.")
    if e.other:IsTaskActivityActive(bic_ferubi, 4) then
  		e.other:SummonItem(67526); -- Item: Rondo's Report
      e.other:UpdateTaskActivity(bic_ferubi, 4, 1)
    end
    e.other:SetAccountBucket('god.flags.ferubi', '1')
		e.other:Message(MT.LightBlue, "You receive a character flag!")
	end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end
