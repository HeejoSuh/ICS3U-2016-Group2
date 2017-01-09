-- Paused scene

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the paused scene for game

PausedScene = class()

local mainMenuButton
local resumeButton

function PausedScene:init()
    -- you can accept and set parameters here
    mainMenuButton= Button("Project:onoff button", vec2(2*WIDTH/7, HEIGHT/3))
    resumeButton= Button("Project:onoff button", vec2(5*WIDTH/7, HEIGHT/3))
    
end

function PausedScene:draw()
    -- Codea does not automatically call this method
    sprite("Project:bg", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT) -- draw background
    sprite("Cargo Bot:Dialogue Button", WIDTH/2, HEIGHT/2, WIDTH/1.2, HEIGHT/1.2)
    
    font("Zapfino")
    textMode (CENTER)
    textWrapWidth(WIDTH*0.9) --restrict range 
    fill(0, 0, 0, 255)
    fontSize(WIDTH/15)
    text("Game Paused", WIDTH/2, HEIGHT/1.4)
    
    
    mainMenuButton:draw()
    resumeButton:draw()
    font("Papyrus-Condensed")
    fontSize(WIDTH/26)
    text("Main Menu", 2*WIDTH/7, HEIGHT/3)
    text("Resume", 5*WIDTH/7, HEIGHT/3)
end

function PausedScene:touched(touch)
    -- Codea does not automatically call this method
    mainMenuButton:touched(touch)
    if mainMenuButton.selected==true then
        --go to main menu
        Scene.Change("mainMenu")
    end
    
    
    resumeButton:touched(touch)
    if resumeButton.selected==true then
        if Mode=="game" then
            --go back to game
            Scene.Change("game")
        else
            --go back to walking scene
            Scene.Change("walk")
        end
    end
end

