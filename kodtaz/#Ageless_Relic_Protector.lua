function event_death_complete(e)
  if e.self:GetID() == 293222 or e.self:GetID() == 293223 then
    eq.spawn2(29324,0,0,e.other:GetX() - 10, e.other:GetY(), e.other:GetZ(), e.other:GetHeading())
    eq.spawn2(29325,0,0,e.other:GetX() + 10, e.other:GetY(), e.other:GetZ(), e.other:GetHeading())
  end
end
