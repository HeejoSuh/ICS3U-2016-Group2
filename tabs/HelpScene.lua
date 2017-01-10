-- Spells

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the help scene

HelpScene = class()

local backButton

local previousPageButton
local nextPageButton

local currentPage

local helpImages= {"Project:Monster 7", "Project:Monster 3"}


function HelpScene:init()
    -- you can accept and set parameters here

    
    backButton= Button("Project:button back", vec2(WIDTH/8, HEIGHT-WIDTH/9))
    
    
    --need sprites that are big
    previousPageButton= Button("Project:Page flip button", vec2(WIDTH/7, HEIGHT/2.5))
    
    
    nextPageButton= Button("Project:Page flip button", vec2(6*WIDTH/7, HEIGHT/2.5))
    
    currentPage= 1
    
    
    --dots position
    local dotMainPos= vec2(WIDTH/2, HEIGHT/2.4)
    local dotMoveAmount= 1.3
    local dotSpace= WIDTH/4.5
    dotPositions= {                                                             vec2(dotMainPos.x-dotSpace, dotMainPos.y+dotSpace),                                             vec2(dotMainPos.x, dotMainPos.y+dotSpace*dotMoveAmount),                                             vec2(dotMainPos.x+dotSpace, dotMainPos.y+dotSpace),              vec2(dotMainPos.x-dotSpace*dotMoveAmount, dotMainPos.y),                                             vec2(dotMainPos.x, dotMainPos.y),                                             vec2(dotMainPos.x+dotSpace*dotMoveAmount,dotMainPos.y),                     vec2(dotMainPos.x-dotSpace, dotMainPos.y-dotSpace),                                             vec2(dotMainPos.x, dotMainPos.y-dotSpace*dotMoveAmount), vec2(dotMainPos.x+dotSpace,dotMainPos.y-dotSpace)                                            }
    
end

function HelpScene:draw()
    -- Codea does not automatically call this method
    
    previousPageButton:draw()
    nextPageButton:draw()
    --hide the buttons
    
    background(40, 60, 29, 255)
    
    sprite(helpImages[currentPage], WIDTH/2, HEIGHT/2, WIDTH, HEIGHT)--bg
    
    
    backButton:draw()
end


function HelpScene:touched(touch)
    -- Codea does not automatically call this method
    
    -- go back
    backButton:touched(touch)
    if backButton.selected==true then
        Scene.Change("settings")
    end
    
    --previous page
    previousPageButton:touched(touch)
    if previousPageButton.selected==true then
        if currentPage-1 > 0 then
            --if not the first page then turn page
            currentPage=currentPage-1
        end
    end
    --next page
    nextPageButton:touched(touch)
    if nextPageButton.selected==true then        
        if currentPage+1 <= #helpImages then
            --if not the last page then turn page
            currentPage=currentPage+1
        end
    end
end