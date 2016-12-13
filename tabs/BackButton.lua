-- back button

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is class for back button


BackButton = class()

local backButton

function BackButton:init()
    -- you can accept and set parameters here
    backButton= Button("Cargo Bot:Command Left", vec2(WIDTH/8, HEIGHT-WIDTH/9))
end

function BackButton:draw()
    -- Codea does not automatically call this method
    backButton:draw()
end

function BackButton:touched(touch)
    -- Codea does not automatically call this method
    backButton:touched(touch)
    if backButton.selected==true then
        sound(SOUND_HIT, 8992)
        Scene.Change("mainMenu")
    end
end
