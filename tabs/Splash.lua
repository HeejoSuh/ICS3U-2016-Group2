-- Splash

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is splash scene that shows the company logo, then the game logo, then transitions to the main manu screen.

SplashScene = class()

local durationTime= ElapsedTime
local transitionTime

local companyLogoSprite
local gameLogoSprite

local currentSprite
local currentWords


function SplashScene:init()
    
    transitionTime= 1.8
    
    companyLogoSprite= "Planet Cute:Chest Closed"
    gameLogoSprite= "Planet Cute:Chest Open"
    
    currentSprite= companyLogoSprite --first, set to company sprite
    currentWords= "H Company"
end


function SplashScene:draw()
    -- Codea does not automatically call this method
    background(171, 171, 171, 255) -- White background
    
    if (durationTime + 2*transitionTime < ElapsedTime) then 
        --if time twice passed, move scene
        Scene.Change("mainMenu")
    elseif (durationTime + transitionTime < ElapsedTime) then
        --for the next few seconds, show game logo
        currentSprite= gameLogoSprite
        currentWords= "The Wanderer"
    end
    
    --Draw logo
    sprite(currentSprite, WIDTH/2, HEIGHT/1.5, WIDTH/1.5, WIDTH/1.5)
    fontSize(WIDTH/15)
    fill(0, 0, 0, 255)
    text(currentWords,WIDTH/2, HEIGHT/1.5)
end


function SplashScene:touched(touch)
    -- Codea does not automatically call this method
end
