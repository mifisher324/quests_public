function event_say(e)
  local aby_bic = tonumber(e.other:GetBucket("god.bic.abysmal")) or 0
  local qin_bic = tonumber(e.other:GetBucket("god.bic.qinimi")) or 0
  local bar_bic = tonumber(e.other:GetBucket("god.bic.barindu")) or 0
  local riw_bic = tonumber(e.other:GetBucket("god.bic.riwwi")) or 0
  local fer_bic = tonumber(e.other:GetBucket("god.bic.ferubi")) or 0

  if aby_bic == 1 then
    if e.message:findi('hail') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Greetings. You must be one of the adventurers that Fezbin told me about. It is a pleasure to meet such a brave individual. Where are my manners? My name is Taminoa Bialu and I compile all the information from our scouts in the [" .. eq.say_link("city") .. "] area of Taelosia.'")
    end
    if e.message:findi('city') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Well, it appears the native inhabitants of Taelosia lived in a grand city once. This city is made up of four different areas named in their language. They are [" .. eq.say_link("Qinimi") .. "], [" .. eq.say_link("Riwwi") .. "], [" .. eq.say_link("Barindu") .. "], and [" .. eq.say_link("Ferubi") .. "]. Based off of early information, we believe each area had a specific purpose. I am still trying to decipher the native language to figure out what the names mean, but going off of visual information I can assume that Qinimi served as their court, Riwwi is where they held games, Barindu was a lush garden, and Ferubi was a central place of worship once. That is about the extent of my information as far as the intended purpose of each area. What they are now used for I can explain in further detail. Which area would you like to hear more about?'")
    end

    -- Qinimi
    if e.message:findi('qinimi') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'It appears the Muramites have made this some sort of stronghold. Destroying many of the native symbols, the invaders have converted the building that once served as the court into fortified headquarters. It is here you will find a structure called the Chamber of Souls, various pens to hold ukun, and a moat of sickly black sludge. The structures that the nihil once called home are all but destroyed now. Very sad indeed. That's where the legion keeps the bulk of the [" .. eq.say_link("slaves") .. "]. I believe that the scout for this area was caught sneaking around the housing district, but I have no proof. If you were to search this area, maybe you would find some sort of sign or marker he may have left. That would be helpful.'")
    end
    if e.message:findi('slaves') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'I see Fezbin saved some of the more dismal news for me. The legion has enslaved the natives of the continent. In the city area, these slaves are used mainly for menial tasks. Due to their fragile bodies, they cannot do any heavy lifting, but their knowledge of shaping stone makes them perfect for building new structures for the legion to use as well as altering current ones. They command the stone workers. I am not sure how the slaves are used in the temple areas. That information is held by L`diava.'")
      if qin_bic == 0 then
        e.other:SetBucket("god.bic.qinimi", "1")
      end
    end

    -- Barindu
    if e.message:findi('barindu') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'This area holds the remains of what was once a place to build stone workers. We can only guess what purpose this part of the city served and all we know now is that it is home to some of the cruelest acts of violence against the nihil. I assigned this area to Talwin, a young wood elf new to the brotherhood. He was a proven scout eager to assist. Initially things were going well, but the information he was sending was not helping much. I think this worried him and resulted in him pushing his luck a little far. Ever since I told him his reports were lacking the vital evidence we needed I have not heard from him. Before Falcin passed on, I asked him if he had found anything out about Talwin and he shook his head. I know Talwin is still alive . . . he has to be . . . and I know that there must be some clues in the area of Barindu somewhere. He was diligent about recording what he found so I would assume that if he has been captured that his writings must be lying around the area somewhere. See if you can find two of his journal entries and bring them back to me. When you return please give what you find to my assistant Opury Foop. She is trying to help me organize my reports a little better.'")
      e.other:SetBucket("god.bic.barindu", "1")
    end
  end

  if aby_bic == 0 then
    if e.message:findi('hail') then
      e.other:Message(MT.NPCQuestSay, "I don't mean to be rude, but I am really busy at the moment. Unless you have something important to tell me, I must ask that you leave me be.")
    end
  end
end

function event_trade(e)
  local aby_bic = tonumber(e.other:GetBucket("god.bic.abysmal")) or 0
  local qin_bic = tonumber(e.other:GetBucket("god.bic.qinimi")) or 0
  local bar_bic = tonumber(e.other:GetBucket("god.bic.barindu")) or 0
  local riw_bic = tonumber(e.other:GetBucket("god.bic.riwwi")) or 0
  local fer_bic = tonumber(e.other:GetBucket("god.bic.ferubi")) or 0
  local item_lib = require("items")

  -- Barindu Turn Ins
  if item_lib.check_turn_in(e.trade, {item1 = 67516}) then
    if bar_bic == 10 then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu looks at the final report before bowing his head for a second. 'While I had accepted Talwin's passing as reality, I still hoped you would save him in time. Either way, I thank you for your effort and for delivering this vital piece of information contained in this report. Please take this. I found it wrapped up in the report. Talwin would have wanted you to have it as it appears to be a gem fragment that could fit into the stone Fezbin gave you. Now that you have finished all that was needed for Barindu, there is still more of the city left to explore and I won't be able to complete my report until it is done.'")
      e.other:SummonItem(67517)
      e.other:SetBucket("god.bic.barindu", "11")
    end
  end

  -- Qinimi Turn Ins
  if item_lib.check_turn_in(e.trade, {item1 = 67397}) then
    if qin_bic == 1 then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Yes. This is exactly what I needed. Excellent job. Okay, now give me one moment to decipher this . . . hm. It seems that just before he was captured he was trying to communicate with the slaves in the area. The text is very hard to make out, but it looks like he may have been trying to get into the main headquarters. He was interacting with a particular slave named Sislono Nislan. This slave promised him a way into the headquarters only if he promised to rid the area of a tyrant, named Tixxrt. The rest of the parchment is undecipherable. I would suggest finding this slave and showing him this to see if he knows what happened.'")
      e.other:SummonItem(67700)
      e.other:SetBucket("god.bic.qinimi", "2")
    else
      item_lib.return_items(e.self, e.other, e.trade)
    end
  end
  if item_lib.check_turn_in(e.trade, {item1 = 67401}) then
    if qin_bic == 5 then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Finally, you have returned and with some information I see. Kreshin contacted me in advance to let me know of your daring rescue. We are indebted to you. Now, back to business. While I cannot make out most of it, Kreshin has translated some of it and it appears to be a description of a ritual one of the head ikaav performs regularly. Apparently she has been trying to absorb the geomantic powers of the natives of Taelosia. The details are kind of sketchy as Kreshin was only able to translate so much, but some information is better than none, I always say. Anyway, it says here that the ritual is conducted in the Chamber of Souls. It used to be a large tower which the natives used to watch the shores. The tower was destroyed when the invaders took over the area and converted it to a ritual chamber. They used it in experiments centered on the extraction of magic. The head ikaav, known as Xictic, has been trying to use the powers of the native Taelosians to build an army of stone workers that he can directly control instead of relying on the ability of slaves. During the ritual, Xictic stands atop a platform which is suspended over a circle of platforms. The center platform holds an inanimate stone worker while eight ikaav stand on smaller platforms around the center. What happens next is not really known, but the end result is three lifeless slave corpses. According to this, she has not yet been successful, which I would say is good news. But if we do not stop her, she could easily reinforce the numbers with stone workers tainted by the touch of this legion. I know you have accomplished your goal, but I must ask that you find a way into this ritual and silence Xictic for good. Show this to Nislan. He should be able to decipher the images. I believe this is the key to getting into the ritual chamber. Now, hurry please and return to me with proof of Xictic's death so that I can make a final report on the Qinimi area to Fezbin.'")
      e.other:SummonItem(67403)
      e.SetBucket("god.bic.qinimi", "6")
    else
      item_lib.return_items(e.self, e.other, e.trade)
    end
  end
  if item_lib.check_turn_in(e.trade, {item1 = 67511}) then
    if qin_bic == 7 then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'You have returned bruised, but not broken I see. I am disappointed to hear that he got away, but you are not at fault. We could not foresee how crafty these beings would be. The information you have given us will be invaluable. Fezbin will be pleased. Kreshin told me to give this to you. He believes it may be one of the fragments that will fit into the stone Fezbin gave you. Who knows, if you help me find the rest of our scouts we may yet find more fragments.'")
      e.other:SummonItem(67513)
      e.other:SetBucket("god.bic.qinimi", "8")
    else
      item_lib.return_items(e.self, e.other, e.trade)
    end
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

