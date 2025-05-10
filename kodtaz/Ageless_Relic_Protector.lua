function event_death_complete(e)
  eq.spawn2(29322,0,0,e.other:GetX() - 10, e.other:GetY(), e.other:GetZ(), e.other:GetHeading())
  eq.spawn2(29323,0,0,e.other:GetX() + 10, e.other:GetY(), e.other:GetZ(), e.other:GetHeading())
end
