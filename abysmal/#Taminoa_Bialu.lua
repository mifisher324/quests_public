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
  if e.other:IsTaskCompleted(bic_abysmal) or (e.other:IsTaskCompleted(bic_qinimi) and e.other:IsTaskCompleted(bic_barindu) and e.other:IsTaskCompleted(bic_riwwi) and e.other:IsTaskCompleted(bic_ferubi)) then
    e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Thank you for all of your help, " .. e.other:GetCleanName() .. ".  I've reported your activities to Fezbin and he is eager to speak to you once you've helped the other scout masters.'")
  elseif not e.other:IsTaskActive(bic_abysmal) then
    e.other:Message(MT.NPCQuestSay, "Tamina Bialu says 'I don't mean to be rude, but I am really busy at the moment. Unless you have something important to tell me, I must ask that you leave me be.'")
  else
    if e.message:findi('hail') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Greetings. You must be one of the adventurers that Fezbin told me about. It is a pleasure to meet such a brave individual. Where are my manners? My name is Taminoa Bialu and I compile all the information from our scouts in the [" .. eq.say_link('city') .. "] area of Taelosia.'")
    end
    if e.message:findi('city') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Well, it appears the native inhabitants of Taelosia lived in a grand city once. This city is made up of four different areas named in their language. They are [" .. eq.say_link('Qinimi') .. "], [" .. eq.say_link('Riwwi') .. "], [" .. eq.say_link('Barindu') .. "], and [" .. eq.say_link('Ferubi') .. "]. Based off of early information, we believe each area had a specific purpose. I am still trying to decipher the native language to figure out what the names mean, but going off of visual information I can assume that Qinimi served as their court, Riwwi is where they held games, Barindu was a lush garden, and Ferubi was a central place of worship once. That is about the extent of my information as far as the intended purpose of each area. What they are now used for I can explain in further detail. Which area would you like to hear more about?'")
    end
    if e.message:findi('qinimi') and not e.other:IsTaskActive(bic_qinimi) then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'It appears the Muramites have made this some sort of stronghold. Destroying many of the native symbols, the invaders have converted the building that once served as the court into fortified headquarters. It is here you will find a structure called the Chamber of Souls, various pens to hold ukun, and a moat of sickly black sludge. The structures that the nihil once called home are all but destroyed now. Very sad indeed. That's where the legion keeps the bulk of the [" .. eq.say_link('slaves') .. "]. I believe that the scout for this area was caught sneaking around the housing district, but I have no proof. If you were to search this area, maybe you would find some sort of sign or marker he may have left. That would be helpful.'")
      e.other:AssignTask(bic_qinimi)
    end
    if e.message:findi('slaves') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'I see Fezbin saved some of the more dismal news for me. The legion has enslaved the natives of the continent. In the city area, these slaves are used mainly for menial tasks. Due to their fragile bodies, they cannot do any heavy lifting, but their knowledge of shaping stone makes them perfect for building new structures for the legion to use as well as altering current ones. They command the stone workers. I am not sure how the slaves are used in the temple areas. That information is held by L`diava.'")
    end
    if e.message:findi('ferubi') then
      e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'The area called Ferubi was once a Taelosian temple. Now it is a place that reeks of pain and suffering. The invading army has desecrated the temple and the slaves within endure unimaginable torture. Based on the information our scout Smith Rondo sent to me before his disappearance, the invaders use this area to craft weaponry and conduct strange experiments. Smith's ability to sneak in and out of places quickly made him the ideal choice for this job, but like most of our other scouts he eventually got caught trying to reveal a vital piece of information. We have confirmed that he is still alive and I need you to go find him and give him this. It is a special farstone attuned to his aura so only he can use it. Please make haste in your mission, but be careful. You are entering the lion's den and if you are caught, I cringe to think what will happen.'")
      e.other:SummonItem(67519)
      e.other:AssignTask(bic_ferubi)
    end
  end
end

function event_trade(e)
  local item_lib = require("items")

  if item_lib.check_turn_in(e.trade, {item1 = 67397}) then --Kreshin's Journal Page
    e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Yes. This is exactly what I needed. Excellent job. Okay, now give me one moment to decipher this . . . hm. It seems that just before he was captured he was trying to communicate with the slaves in the area. The text is very hard to make out, but it looks like he may have been trying to get into the main headquarters. He was interacting with a particular slave named Sislono Nislan. This slave promised him a way into the headquarters only if he promised to rid the area of a tyrant, named Tixxrt. The rest of the parchment is undecipherable. I would suggest finding this slave and showing him this to see if he knows what happened.'")
    e.other:UpdateTaskActivity(bic_qinimi, 1, 1)
    e.other:SummonItem(67700)
  end

  if item_lib.check_turn_in(e.trade, {item1 = 67401}) then --Writ of the Magi
    e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Finally, you have returned and with some information I see. Kreshin contacted me in advance to let me know of your daring rescue. We are indebted to you. Now, back to business. While I cannot make out most of it, Kreshin has translated some of it and it appears to be a description of a ritual one of the head ikaav performs regularly. Apparently she has been trying to absorb the geomantic powers of the natives of Taelosia. The details are kind of sketchy as Kreshin was only able to translate so much, but some information is better than none, I always say. Anyway, it says here that the ritual is conducted in the Chamber of Souls. It used to be a large tower which the natives used to watch the shores. The tower was destroyed when the invaders took over the area and converted it to a ritual chamber. They used it in experiments centered on the extraction of magic. The head ikaav, known as Xictic, has been trying to use the powers of the native Taelosians to build an army of stone workers that he can directly control instead of relying on the ability of slaves. During the ritual, Xictic stands atop a platform which is suspended over a circle of platforms. The center platform holds an inanimate stone worker while eight ikaav stand on smaller platforms around the center. What happens next is not really known, but the end result is three lifeless slave corpses. According to this, she has not yet been successful, which I would say is good news. But if we do not stop her, she could easily reinforce the numbers with stone workers tainted by the touch of this legion. I know you have accomplished your goal, but I must ask that you find a way into this ritual and silence Xictic for good. Show this to Nislan. He should be able to decipher the images. I believe this is the key to getting into the ritual chamber. Now, hurry please and return to me with proof of Xictic's death so that I can make a final report on the Qinimi area to Fezbin.'")
    e.other:UpdateTaskActivity(bic_qinimi, 9, 1)
    e.other:SummonItem(67403)
  end

  if item_lib.check_turn_in(e.trade, {item1 = 67511}) then --Xictic's Bloody Robes
    e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'You have returned bruised, but not broken I see. I am disappointed to hear that he got away, but you are not at fault. We could not foresee how crafty these beings would be. The information you have given us will be invaluable. Fezbin will be pleased. Kreshin told me to give this to you. He believes it may be one of the fragments that will fit into the stone Fezbin gave you. Who knows, if you help me find the rest of our scouts we may yet find more fragments.'")
    e.other:UpdateTaskActivity(bic_qinimi, 13, 1)
    e.other:UpdateTaskActivity(bic_abysmal, 0, 1)
  end

  if item_lib.check_turn_in(e.trade, {item1 = 67520}) then --Sealed Report
    e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'Ah. Glad to see you return and report that you found Smith. Let me see, what does it say here . . . oh my, I can't believe this. These beings are truly insane. This is a detailed account of the experiments the Muramites have been conducting on the natives and on Smith. If what is listed here is true, we must find out more about this. It says that this is one of two reports he wrote, so we must assume he still has the other one on him. It also says here that the weapon master has access to the mountain area that leads to a secret way into the temples where they conduct these experiments. Oh, poor Smith. As soon as he figured out what was going on he documented it, hoping that he could somehow get it back to us without them finding out. Hm . . . here at the bottom he gives details about the weapon master. Seems he only enters the Ferubi area to fix the weapons that his four elite guards use. Knowing this, I am sure we can trick him into appearing. You must return to Ferubi and find his elite guards and collect a different weapon from each of them, but remember the weapon has to be damaged. Sounds like this is pretty durable stuff they use, so it may take some time to accomplish this. Either way, once it is done I would suggest giving the pieces to Smith and asking him to help.'")
    e.other:UpdateTaskActivity(bic_ferubi, 1, 1)
  end

  if item_lib.check_turn_in(e.trade, {item1 = 67526}) then --Rondo's Report
    e.other:Message(MT.NPCQuestSay, "Taminoa Bialu says 'You have now finished the scouting of the city.  Take this as a reward.'")
    e.other:UpdateTaskActivity(bic_ferubi, 5, 1)
    e.other:UpdateTaskActivity(bic_abysmal, 3, 1)
  end

  item_lib.return_items(e.self, e.other, e.trade)
end

