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
  if e.other:IsTaskActive(bic_outer) then
    if e.message:findi('hail') then
      e.other:Message(MT.NPCQuestSay, "Clockwork Scout Model XIII says 'Access code?'")
    end
    if e.message:findi('040703') then
      e.other:Message(MT.NPCQuestSay, "Clockwork Scout Model XIII says 'Verifying password and user identity . . .'")
      e.other:Message(MT.NPCQuestSay, "Clockwork Scout Model XIII says 'Identity verified as " .. e.other:GetCleanName() .. ". Processing scout report. Please return report to Vaifan.'")
      e.other:SummonItem(67536)
      e.self:SetTimer('depop', 60)
    end
  else
    e.other:Message(MT.NPCQuestSay, "Clockwork Scout Model XIII does not seem to respond to your command.")
  end
end

function event_timer(e)
  e.self:Say("Power cells low.  SHutting down to reserve power.")
  e.self:Depop()
end
