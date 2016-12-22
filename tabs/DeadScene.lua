-- dead scene

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the dead scene for game


DeadScene = class()

local mainMenuButton

function DeadScene:init()
    -- you can accept and set parameters here
    mainMenuButton= Button("Cargo Bot:Stop Button", vec2(WIDTH/2, HEIGHT/2.5))
    CurrentGameFloor= 0 --delete current data, start over.
end

function DeadScene:draw()
    -- Codea does not automatically call this method
    background(188, 161, 161, 255)
    
    fill(0, 0, 0, 255)
    font("Zapfino")
    textMode (CENTER)
    fontSize(WIDTH/17)
    text("You died!", WIDTH/2, HEIGHT/1.5)
    
    mainMenuButton:draw()
end

function DeadScene:touched(touch)
    -- Codea does not automatically call this method
    
    mainMenuButton:touched(touch)
    if mainMenuButton.selected==true then
        --go to main menu
        Scene.Change("mainMenu")
    end
end
