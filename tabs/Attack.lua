-- Attack

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is attack scene that shows if attacking or getting attacked

AttackScene = class()

local spellSpritePos

local size
local angle

local basicSprites


function AttackScene:init()
    -- you can accept and set parameters here
    
    spellSpritePos= vec2(WIDTH/2, HEIGHT/1.7)
    size= WIDTH/2.5
    angle= 0
    
    if Attacked==false then
        speech.language= "en-GB"
        speech.pitch= 1.2
        speech.rate= 0.5
        speech.voice= speech.voices[9]
        speech.say(SpellCasted["spell name"])--say spell
    end
    
    sound("A Hero's Quest:Defensive Cast 1")
    
    basicSprites= BasicSprites(Mode)
end

function AttackScene:draw()
    -- Codea does not automatically call this method
    background(62, 48, 48, 255)
    
    --background and wand
    basicSprites:draw()
    
    if Attacked==false then
        --if attacking, not getting attacked
        pushMatrix()
        if SpellCasted["type"]== "grow" then
            --light grows
            size= size+8
            sprite(SpellCasted["sprite"], spellSpritePos.x, spellSpritePos.y, size, size)
        else 
            --light turns
            translate(spellSpritePos.x, spellSpritePos.y) --move to orginal position
            angle= angle-3
            rotate(angle) --rotate
            sprite(SpellCasted["sprite"], spellSpritePos)
        end
        popMatrix()
               
        
        -- write spell
        fontSize (WIDTH/13)
        if SpriteEnemies==true then--color differs for each mode
            fill(242, 242, 242, 210)
        else
            fill(41, 41, 41, 210)
        end
        
        font("Zapfino")
        textMode (CENTER)
        textWrapWidth(WIDTH*0.9) --restrict range 
        text(SpellCasted["spell name"], spellSpritePos.x, spellSpritePos.y)--spell name
        
        
        if speech.speaking==false then --go back
            if mode=="practice" then
                --if practicing then
                Scene.Change("game")
            else
                Scene.Change("walk")
            end
        end
    end
    
end

function AttackScene:touched(touch)
    -- Codea does not automatically call this method
end
