-- Game

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the game scene

GameScene = class()


local goBackButton

local touchLight
local touchLightPosition

local dots
local touchedDots=""

local whooshSounds={"A Hero's Quest:Swing 1", "A Hero's Quest:Swing 2", "A Hero's Quest:Swing 3"}


local userHealth
local userGage

local potionButton
local pauseButton

local basicSprites



function GameScene:init()
    -- you can accept and set parameters here
    
    
    --dots position
    local dotMainPos= vec2(WIDTH/2, HEIGHT/2.4)
    local dotSpace= WIDTH/7
    local dotPositions= {                                                             vec2(dotMainPos.x-dotSpace, dotMainPos.y+dotSpace),                                             vec2(dotMainPos.x, dotMainPos.y+dotSpace),                                             vec2(dotMainPos.x+dotSpace, dotMainPos.y+dotSpace),              vec2(dotMainPos.x-dotSpace, dotMainPos.y),                                             vec2(dotMainPos.x, dotMainPos.y),                                             vec2(dotMainPos.x+dotSpace,dotMainPos.y),                     vec2(dotMainPos.x-dotSpace, dotMainPos.y-dotSpace),                                             vec2(dotMainPos.x, dotMainPos.y-dotSpace), vec2(dotMainPos.x+dotSpace,dotMainPos.y-dotSpace)                                            }
    
    dots={}
    for numberOfDots= 1, 9 do
        --put in dots
        table.insert(dots, SpriteObject("Platformer Art:Crate", dotPositions[numberOfDots]))
        dots[numberOfDots].draggable= false --not draggable
    end
    
    --touchLight
    touchLightPosition= vec2(0,0)
    
    
    userHealth= UserHealth
    userGage= GageBar(userHealth, 100, vec2(WIDTH/25, HEIGHT/90), color(255, 0, 0, 255), WIDTH/1.06)
    
    
    potionButton= Potion()

    basicSprites= BasicSprites(Mode)
    
    goBackButton= BackButton()
    
    pauseButton= Button("Cargo Bot:Stop Button", vec2(WIDTH-WIDTH/8, HEIGHT-WIDTH/9))
end


function GameScene:draw()
    -- Codea does not automatically call this method
    background(0, 39, 255, 255)
    
    basicSprites:draw() --draw background and wand
    
    --gage bar
    userGage:draw()
    
    --potions bottle
    potionButton:draw()
    
    
    --draw dots
    tint(255, 255, 255, 120) --translucent
    for everyDots= 1, 9 do
        dots[everyDots]:draw()
    end 

    --draw touch light
    touchLight= SpriteObject("Small World:Bush", touchLightPosition)
    tint(127, 127, 127, 100)
    touchLight:draw()
    popStyle()
    
    if Mode~="game" then
        --draw go back button
        goBackButton:draw()
    else
        --draw pause button
        pauseButton:draw()
    end
end



function GameScene:touched(touch)
    -- Codea does not automatically call this method
    
    goBackButton:touched(touch)
    
    --move touch light
    if touch.state==ENDED then
        --if finger off of the screen
        local spellCasted= touchedDots --set to spell
        for numberOfSpells= 1, #Spells do
            if Spells[numberOfSpells]["spell"]== spellCasted then
                SpellCasted= Spells[numberOfSpells]
                Scene.Change("attack")
            end
        end
        touchedDots= ""
        touchLightPosition= vec2(-100,-100) --move out of screen
    else
        touchLightPosition= vec2(touch.x, touch.y)--move to touch location
    end
       
    
    --get spell  
    for numberOfDots=1, 9 do
        if ((touchLight:isTouching(dots[numberOfDots]))==true and string.sub(touchedDots, #touchedDots)~=tostring(numberOfDots))  then
            --if touching a dot and the dot isn't previously touched or nothing has been touched then
            sound(whooshSounds[math.random(#whooshSounds)]) --play a random whoosh sound
            
            touchedDots= touchedDots..tostring(numberOfDots)
            print(touchedDots)
        end
    end
    
    
    --pause button
    pauseButton:touched(touch)
    if pauseButton.selected== true then
        Scene.Change("pause")
    end
    
    userGage:recalculateHealth(potionButton:touched(touch)) --see if change in health
end
    