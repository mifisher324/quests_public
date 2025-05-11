--KT fern click for Berserker 1.5
-- items: 16949
function event_click_door(e)
  local door_id = e.door:GetDoorID();
	if(door_id == 25 or door_id == 26 or door_id == 27) then
	  local qglobals = eq.get_qglobals(e.self);
		if(e.self:HasClass(Class.BERSERKER) and qglobals["kt_" .. door_id .. "fern"] == nil) then
				e.self:SummonItem(16949); --Taelosian Fern Sample 
				eq.set_global("kt_" .. door_id .. "fern","1",3,"H1")
		end
	end
end

function event_enter_zone(e)
  local kt_flag = tonumber(e.self:GetAccountBucket("god.flags.kt")) or 0
  if kt_flag == 33 and e.self:HasItem(60176) and e.self:HasItem(60252) and not e.self:HasZoneFlag(Zone.qvic) then
    e.self:SetZoneFlag(Zone.qvic)
    e.self:SetAccountBucket("god.flags.kt", "34")
    e.self:Message(MT.LightBlue, "The magical barrier protecting Qvic appears to have weakened, allowing access.")
  elseif kt_flag == 34 and not e.self:HasZoneFlag(Zone.qvic) then
    e.self:SetZoneFlag(Zone.qvic)
    e.self:Message(MT.LightBlue, "The magical barrier protecting Qvic appears to have weakened, allowing access.")
  end
end
