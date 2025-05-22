function event_loot(e)
	if(e.self:HasClass(Class.DRUID) and e.item:GetID() == 62870) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["druid_epic"] == "10") then
			if(qglobals["druid_epic_qin"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.0)
				eq.set_global("druid_epic_qin","1",5,"F");
			end
		else
			return 1;
		end		
	end
end

function event_player_pickup(e)
  if e.item:GetID() == 67397 then
    e.self:UpdateTaskActivity(8, 0, 1) --Update task 8, activity 0
  end
end
