-- Basic sprites

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is class for drawing basic things such as background and wands

BasicSprites = class()



function BasicSprites:init()
    -- you can accept and set parameters here
end

function BasicSprites:draw()
    -- Codea does not automatically call this method
    
    --draw background
    if Mode== "practice" then
        sprite("Planet Cute:Stone Block Tall", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT) -- draw background
        sprite("Planet Cute:Icon", WIDTH/2, HEIGHT/1.8, WIDTH/1.2, WIDTH/1.2) -- draw dummy
    elseif Mode== "game" then
        sprite("SpaceCute:Background", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT) -- draw background
    end
    
    --draw wand
    sprite(Wands[CurrentWandNumber]["sprite"], WIDTH/2, HEIGHT/2.8, WIDTH/3, HEIGHT/1.5)
    
end

function BasicSprites:touched(touch)
    -- Codea does not automatically call this method
end
