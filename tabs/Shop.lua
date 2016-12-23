-- Shop

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the shop scene

ShopScene = class()



local buyPotionButton
local potionCost= 100

local backButton


--local zeroWidth= 0
local wandSpace
local wandChooseButtons={}

local shopType

local allowTouch= true
local popUp


function ShopScene:init()
    -- you can accept and set parameters here
    
    buyPotionButton= Button("Cargo Bot:Dialogue Button", vec2(2*WIDTH/3, HEIGHT/5.5))
    
    
    backButton= BasicSprites()
    
    wandSpace= WIDTH/5
    
    shopType= "shop"
    
    --wands
    for numberOfWands= 1, #Wands do
        --use buttons
        table.insert(wandChooseButtons, Button("Planet Cute:Character Boy", vec2(numberOfWands*wandSpace, HEIGHT/2)))
    end
    
    popUp= Buy(1) --set to random at first
end

function ShopScene:draw()
    -- Codea does not automatically call this method
    background(40, 60, 29, 255)
    
    --top block
    sprite("Cargo Bot:Dialogue Button", WIDTH/2, HEIGHT/1.1, WIDTH, HEIGHT/5.5)
    --bottom block
    sprite("Planet Cute:Brown Block", WIDTH/2, HEIGHT/5, WIDTH, HEIGHT/2.5)
    
    --potion
    sprite("Project:potion", WIDTH/3, HEIGHT/5.5, WIDTH/4, WIDTH/4)
    
    buyPotionButton:draw()
    
    --potion cost
    fill(18, 17, 14, 220)
    font("Papyrus-Condensed")
    textWrapWidth(WIDTH/3)
    fontSize(WIDTH/25)
    text(potionCost.." each", 2.5*WIDTH/5, HEIGHT/4)
    --potion number
    fill(18, 17, 14, 220)
    font("Papyrus-Condensed")
    fontSize(WIDTH/27)
    text(math.tointeger(NumberOfPotions), 2.5*WIDTH/5, HEIGHT/6)
    
    text("Buy", 2*WIDTH/3, HEIGHT/5.6)
    
    
    --back button
    backButton:drawBackButton()
    
    --money
    fill(64, 51, 29, 220)
    font("Papyrus-Condensed")
    textWrapWidth(WIDTH/1.4)
    fontSize(WIDTH/20)
    text(math.tointeger(MoneyHave).." coins", WIDTH/2, HEIGHT/1.1)
    
    for numberOfWands= 1, #Wands do
        tint(255, 255, 255, 255)
        
        sprite(Wands[numberOfWands]["sprite"], numberOfWands*wandSpace, 3.3*HEIGHT/5, WIDTH/7.5, WIDTH/3.5) --draw wands   
        if Wands[numberOfWands]["unlocked"]==false then
            --draw locks
            sprite("Project:Lock", numberOfWands*wandSpace, 3.3*HEIGHT/5, WIDTH/5, WIDTH/5)
        end
        if CurrentWandNumber== numberOfWands then
            --if using it
            tint(26, 155, 66, 255)
        end
        wandChooseButtons[numberOfWands]:draw()
        tint(255, 255, 255, 255)
    end
    
    
    
    if allowTouch==false then
        --draw popup
        popUp:draw()
        
        if popUp:done()==true then
            allowTouch=true
        end
    end
end

function ShopScene:touched(touch)
    -- Codea does not automatically call this method
    
    popUp:touched(touch)
    backButton:touched(touch)
    
    --if not buying anything then
    if allowTouch==true then
        buyPotionButton:touched(touch)
        if buyPotionButton.selected== true then
            --play music
            sound("Game Sounds One:Reload 1")
            --see if can buy
            if MoneyHave>= potionCost then 
                --take away money
                MoneyHave= MoneyHave- potionCost
                --add a number of potion
                NumberOfPotions= NumberOfPotions +1
            end
        end
    
        for numberOfWands= 1, #Wands do
            local touchedButton= wandChooseButtons[numberOfWands]
            touchedButton:touched(touch)
            if touchedButton.selected==true then
                if Wands[numberOfWands]["unlocked"]==true then 
                    --if unlocked then
                    CurrentWandNumber= numberOfWands
                else
                    --not unlocked
                    allowTouch= false
                    print("Buy?")
                    popUp= Buy(numberOfWands)     
                end
            end
        end
    end
    
    
    --screen moving
    --if zeroWidth+touch.deltaX < (#Wands+1)*wandSpace and zeroWidth+touch.deltaX>0 then 
        --if in the righ domain, move screen left and right
        --zeroWidth=zeroWidth+touch.deltaX
    --end
end
