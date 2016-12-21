-- Basic sprites

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is class for drawing basic things such as background and wands

BasicSprites = class()

local backButton
local userGage

function BasicSprites:init()
    -- you can accept and set parameters here
    backButton= Button("Project:Blue Back Circle Button", vec2(WIDTH/8, HEIGHT-WIDTH/9))
    userGage= GageBar(UserHealth, HealthLevelAmount, vec2(WIDTH/25, HEIGHT/30), color(255, 0, 0, 255), WIDTH/1.06)
end

function BasicSprites:drawBackground()
    -- Codea does not automatically call this method
    
    --draw background
    if Mode== "practice" then
        sprite("Planet Cute:Stone Block Tall", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT) -- draw background
        sprite("Planet Cute:Icon", WIDTH/2, HEIGHT/1.8, WIDTH/1.2, WIDTH/1.2) -- draw dummy
    else
        sprite("Project:bg", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT) -- draw background
    end
end


function BasicSprites:drawWand()
    -- Codea does not automatically call this method
    --draw wand
    sprite(Wands[CurrentWandNumber]["sprite"], WIDTH/2, HEIGHT/4, WIDTH/6, HEIGHT/1.9)
end


function BasicSprites:drawBackButton()
    -- Codea does not automatically call this method
    --draw back button
    backButton:draw()
end

function BasicSprites:drawUserGage()
    -- Codea does not automatically call this method
    --draw user gage bar
    userGage= GageBar(UserHealth, HealthLevelAmount, vec2(WIDTH/25, HEIGHT/30), color(255, 0, 0, 255), WIDTH/1.06)
    userGage:draw()
end


function BasicSprites:touched(touch)
    -- Codea does not automatically call this method
    backButton:touched(touch)
    if backButton.selected==true then
        sound(SOUND_HIT, 8992)
        Scene.Change("mainMenu")
    end
end
