-- Gage bar

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is class for health gage bars

GageBar = class()

local health
local fullHealth
local position
local colour

local lineWidth
local barlength
local barWidth



function GageBar:init(healthAmount, fullHealthAmount, barPosition, colourSet, widthOfBar)
    -- you can accept and set parameters here
    health= healthAmount
    fullHealth= fullHealthAmount
    position= barPosition
    colour= color(colourSet.r, colourSet.g, colourSet.b, 80) --make colour translucent
    
    lineWidth= 3
    barlength= HEIGHT/43
    barWidth= widthOfBar
end



function GageBar:draw()
    -- Codea does not automatically call this method
    
    --outline
    fill(0, 0, 0, 255)
    rect(position.x-lineWidth, position.y-lineWidth, barWidth+ 2*lineWidth, barlength+2*lineWidth)
    
    --bar
    fill(colour)
    rect(position.x, position.y, health*barWidth/health, barlength)
    
    --dividing lines
    fill(0, 0, 0, 250)
    for numberOfLines=1, 10 do--gage lines
        rect(position.x+numberOfLines*barWidth/10, position.y, lineWidth-1, barlength)
    end
    
end

function GageBar:recalculateHealth(newHealth)
    --recalculate health
    health= newHealth
end

function GageBar:touched(touch)
    -- Codea does not automatically call this method
end
