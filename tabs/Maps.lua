-- Maps

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the maps scene

------------------------------------------------------------------------

MapsScene = class()
------------------------------------------------------------------------


local buttons= {}
local backButton

------------------------------------------------------------------------

function MapsScene:init()
    -- you can accept and set parameters here
    
    buttonPosition= {vec2(WIDTH/4, HEIGHT/1.5 ), vec2(WIDTH/4, HEIGHT/1.5 - 1*HEIGHT/5), vec2(WIDTH/4, HEIGHT/1.5 - 2*HEIGHT/5), vec2(3*WIDTH/4, HEIGHT/2)}
    
    for numberOfButtons= 1, #Maps do
        --put actual buttons into dictionary
        buttons[numberOfButtons]= Button("Project:brown dot", vec2(buttonPosition[numberOfButtons].x, buttonPosition[numberOfButtons].y))
    end
    
    
    backButton= BasicSprites()
end
------------------------------------------------------------------------


function MapsScene:draw()
    -- Codea does not automatically call this method
    sprite("Project:parchment old", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT)--bg
    
    for numberOfButtons= 1,#buttons do
        --draw the buttons
        buttons[numberOfButtons]:draw()
        if Maps[numberOfButtons]["unlocked"]==false then
            --if not unlocked then draw locks
            sprite("Project:Lock", buttonPosition[numberOfButtons].x, buttonPosition[numberOfButtons].y, WIDTH/7, WIDTH/7) --locks
        end
        font("Papyrus-Condensed")
        fontSize(WIDTH/23)
        fill(116, 65, 35, 255)
        text("Floor "..tostring(Maps[numberOfButtons]["floor"]), buttonPosition[numberOfButtons].x, buttonPosition[numberOfButtons].y-40)
    end
    
    font("Papyrus")
    fontSize(WIDTH/12)
    fill(36, 24, 22, 255)
    text("Maps", WIDTH/2, HEIGHT/1.2)
    
    
    backButton:drawBackButton()
end
------------------------------------------------------------------------


function MapsScene:touched(touch)
    -- Codea does not automatically call this method
    backButton:touched(touch)
    
    for numberOfButtons= 1,#buttons do
        buttons[numberOfButtons]:touched(touch)
        
        if buttons[numberOfButtons].selected==true then
            -- if button touched then
            sound("A Hero's Quest:Arrow Shoot 2")
            --go to walk scene
            if Maps[numberOfButtons]["unlocked"]==true then
                --if unlocked then
                UserHealth= 100
                CurrentGameFloor= Maps[numberOfButtons]["floor"]
                NextWords= "Floor "..tostring(CurrentGameFloor)
                print(NextWords)
                Mode= "walk"
                MonsterDefeated= ""
                CurrentMonsters= Monsters()
                Scene.Change("walk")
            end
        end
    end
end
