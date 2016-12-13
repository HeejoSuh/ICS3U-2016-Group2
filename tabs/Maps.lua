-- Maps

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the maps scene

MapsScene = class()

local maps= {}
local backButton


function MapsScene:init()
    -- you can accept and set parameters here
    buttons= {                                                                                                                                                    {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/4, HEIGHT/1.7 ), ["map"]= "A1"},                                                                                {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/4, HEIGHT/1.7 - 1*HEIGHT/5), ["map"]= "A2"},                                                                                {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/4, HEIGHT/1.7 - 2*HEIGHT/5), ["map"]= "A3"},                                                                                {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(3*WIDTH/4, HEIGHT/2), ["map"]= "B1"},                                                                                }
    for numberOfButtons= 1, #buttons do
        --put actual buttons into dictionary
        local buttonImage= buttons[numberOfButtons]["sprite"]
        local buttonPosition= buttons[numberOfButtons]["position"]
        buttons[numberOfButtons]["button"]= Button(buttonImage, vec2(buttonPosition.x, buttonPosition.y))
    end
    
    
    backButton= BackButton()
end

function MapsScene:draw()
    -- Codea does not automatically call this method
    background(178, 91, 91, 255)
    
    for numberOfButtons= 1,#buttons do
        --draw the buttons
        buttons[numberOfButtons]["button"]:draw()
    end
    
    backButton:draw()
end

function MapsScene:touched(touch)
    -- Codea does not automatically call this method
    backButton:touched(touch)
    
    for numberOfButtons= 1,#buttons do
        local currentButtonDict= buttons[numberOfButtons]
        currentButtonDict["button"]:touched(touch)
        
        if currentButtonDict["button"].selected==true then
            -- if button touched then
            sound("A Hero's Quest:Arrow Shoot 2")
            --go to walk scene
            NewFloor= currentButtonDict["map"]
            EnemyDefeated= ""
            print(EnemyDefeated)
            Scene.Change("walk")
        end
    end
end
