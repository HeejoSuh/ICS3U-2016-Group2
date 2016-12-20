-- potion

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is class for potions


Potion = class()

local potionWaitTime= 0 --potion cool time, set it to zero as default
local potionHealAmount= 15
local potionCoolTimeSeconds= 1

function Potion:init()
    -- you can accept and set parameters here
    potionButton= Button("Planet Cute:Heart", vec2(WIDTH/8, WIDTH/6))
end

function Potion:draw()
    -- Codea does not automatically call this method
    --set cool time for potions and draw potion button
    if NumberOfPotions>0 then --if have potions
        if potionWaitTime>0 then
            potionWaitTime= potionWaitTime-0.01
        end
        --draw potion
        tint(255, 255, 255, 255-(255/2*potionWaitTime))
        potionButton:draw()
        
        fill(0, 0, 0, 220)
        font("Papyrus-Condensed")
        fontSize(WIDTH/22)
        text(math.tointeger(NumberOfPotions), WIDTH/8+20, WIDTH/6.5-20)
    end
end

function Potion:touched(touch)
    -- Codea does not automatically call this method
    if potionWaitTime<=0 then
        --if not in time limit
        potionButton:touched(touch)
        if potionButton.selected==true and NumberOfPotions>0 then
            sound("A Hero's Quest:Drink 2")
            NumberOfPotions= NumberOfPotions-1
            print(numberOfPotionsHave)
            potionWaitTime= potionCoolTimeSeconds --potion cooltime
            return potionHealAmount
        else
            return 0
        end
    else
        return 0
    end
end
