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


function SplashScene:init()
    
    transitionTime= 2.2
    
    companyLogoSprite= "Project:white nothing"
    gameLogoSprite= ("Project:name")
    
    currentSprite= companyLogoSprite --first, set to company sprite
end


function SplashScene:draw()
    -- Codea does not automatically call this method
    background(0, 0, 0, 255)
    
    if (durationTime + 2*transitionTime < ElapsedTime) then 
        --if time twice passed, move scene
        if FirstGamePlay==false then
            Scene.Change("mainMenu")
        else
            print("Tutorials")
            Scene.Change("help")
        end
    elseif (durationTime + transitionTime < ElapsedTime) then
        --for the next few seconds, show game logo
        background(14, 14, 14, 255)
        currentSprite= gameLogoSprite
    else
        background(255, 255, 255, 255)
        fontSize(WIDTH/16)
        font("TimesNewRomanPS-BoldItalicMT")
        fill(0, 0, 0, 255)
        text("H company", WIDTH/2, 6*HEIGHT/7)
    end
    
    --Draw logo
    sprite(currentSprite, WIDTH/2, HEIGHT/2, WIDTH/1.2, WIDTH/1.2)
end


function SplashScene:touched(touch)
    -- Codea does not automatically call this method
end
