function event_click_door(e)
  if e.door:GetDoorID() == 1 then
    kt_flag = tonumber(e.self:GetAccountBucket('god.flags.kt')) or 0
    vxed_flag = tonumber(e.self:GetAccountBucket('god.flags.vxed')) or 0
    tipt_flag = tonumber(e.self:GetAccountBucket('god.flags.tipt')) or 0
    has_kt_access = (kt_flag >= 1)
    has_vxed_access = (vxed_flag == 2)
    has_tipt_access = (tipt_flag == 2)

    if has_kt_access and has_vxed_access and has_tipt_access then
      if not e.self:HasZoneFlag(293) then
	eq.debug('Updating zone flag')
        e.self:SetZoneFlag(293)
      end
    end
  end
end

function event_loot(e)
  if(e.self:HasClass(Class.DRUID) and e.item:GetID() == 62889) then --Energized Noc Blood
    local qglobals = eq.get_qglobals(e.self);
    if(qglobals["druid_epic"] == "5") then
      chest = tonumber(qglobals["druid_chest_natimbi"]) or 0
      if chest == 0 then
        e.other:SetGlobal("druid_chest_natimbi", "1", 5, "F");
	local x = e.self:GetX()
	local y = e.self:GetY()
	local z = e.self:GetZ()
        eq.spawn2(283157,0,0,x,y,z,0)
      end
      return 0
    else
      return 1
    end
  end
end
