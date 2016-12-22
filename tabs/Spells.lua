-- Spells

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the spells scene

SpellsScene = class()

local backButton

local previousPageButton
local nextPageButton

local currentPage

local eachDotShowTime= 0.2
local nowTime

local dotShown
local dotShownNumber= 0
local dotTable= {}

local dotPositions


function SpellsScene:init()
    -- you can accept and set parameters here

    
    backButton= Button("Project:Blue Back Circle Button", vec2(WIDTH/8, HEIGHT-WIDTH/9))
    
    --need sprites that are big
    previousPageButton= Button("Dropbox:Page flip button", vec2(WIDTH/7, HEIGHT/2.5))
    
    nextPageButton= Button("Dropbox:Page flip button", vec2(6*WIDTH/7, HEIGHT/2.5))
    
    currentPage= 0
    
    
    --dots position
    local dotMainPos= vec2(WIDTH/2, HEIGHT/2.4)
    local dotSpace= WIDTH/7
    dotPositions= {                                                             vec2(dotMainPos.x-dotSpace, dotMainPos.y+dotSpace),                                             vec2(dotMainPos.x, dotMainPos.y+dotSpace),                                             vec2(dotMainPos.x+dotSpace, dotMainPos.y+dotSpace),              vec2(dotMainPos.x-dotSpace, dotMainPos.y),                                             vec2(dotMainPos.x, dotMainPos.y),                                             vec2(dotMainPos.x+dotSpace,dotMainPos.y),                     vec2(dotMainPos.x-dotSpace, dotMainPos.y-dotSpace),                                             vec2(dotMainPos.x, dotMainPos.y-dotSpace), vec2(dotMainPos.x+dotSpace,dotMainPos.y-dotSpace)                                            }
    
end

function SpellsScene:draw()
    -- Codea does not automatically call this method
    
    previousPageButton:draw()
    nextPageButton:draw()
    --hide the buttons
    
    background(40, 60, 29, 255)
    
    if currentPage==0 then
         --book sprite
        tint(85, 31, 31, 255)
        sprite("Cargo Bot:Goal Area", WIDTH/2, HEIGHT/2, WIDTH/1.1, HEIGHT/1.1)
        font("TimesNewRomanPS-BoldMT")
        --title
        textMode (CENTER)
        fontSize(WIDTH/15)
        fill(210, 176, 13, 220)
        text("Book of Spells", WIDTH/2, HEIGHT/1.5)
        
        font("HoeflerText-Italic")
        fill(0, 0, 0, 230)
        fontSize(WIDTH/26)
        text("Touch left or right to turn the page", WIDTH/2, HEIGHT/3.5) 
        
        popStyle()
    elseif currentPage> 0 then
        --page sprite
        sprite("Cargo Bot:Goal Area", WIDTH/2, HEIGHT/2, WIDTH/1.1, HEIGHT/1.1)
        textWrapWidth(WIDTH/1.3) --restrict range 
        
        --name of spell
        font("SnellRoundhand-Black")
        textMode (CENTER)
        fontSize(WIDTH/18)
        fill(79, 33, 31, 190)
        local nameOfSpell= Spells[currentPage]["spell name"]
        text(nameOfSpell, WIDTH/2, HEIGHT/1.2)
        
        --level to unlcok
        font("Papyrus")
        fontSize(WIDTH/40)
        fill(22, 32, 21, 180)
        local levelRequired= Spells[currentPage]["level"]
        text("Requires level "..levelRequired.." or more.", WIDTH/2, HEIGHT/1.3)
        
        --spell
        for numberOfDots=1,9 do
            --draw nine dots
            fill(255, 255, 255, 90)
            sprite("Planet Cute:Gem Orange", dotPositions[numberOfDots].x, dotPositions[numberOfDots].y, WIDTH/18, WIDTH/18)
        end
        drawDot()
        
        --description
        textMode(LEFT)
        font("Zapfino")
        fontSize(WIDTH/40)
        fill(0, 0, 0, 160)
        local description= Spells[currentPage]["description"]
        text(description, WIDTH-WIDTH/1.3, HEIGHT/5)      
        popStyle()
    end
    
    backButton:draw()
end

function SpellsScene:touched(touch)
    -- Codea does not automatically call this method
    
    -- go back
    backButton:touched(touch)
    if backButton.selected==true then
        if GoBackTo == "" then
            --if didnt come from practice mode then
            Scene.Change("mainMenu")
        else
            -- go back to practice scene
            GoBackTo= "" --reset to nothing
            Scene.Change("game")
        end
    end
    
    --previous page
    previousPageButton:touched(touch)
    if previousPageButton.selected==true then
        if currentPage-1 >= 0 then
            --if not the first page then turn page
            currentPage=currentPage-1
            newSpellSet()
        end
    end
    --next page
    nextPageButton:touched(touch)
    if nextPageButton.selected==true then
        if currentPage+1 < #Wands then
            --if not the last page then turn page
            currentPage=currentPage+1
            newSpellSet()
        end
    end
end


function newSpellSet()
    --set spell things
    print("Current page "..tostring(currentPage))
    sound("A Hero's Quest:Page Turn")
    if currentPage> 0 then
        --if not first page
        nowTime=ElapsedTime  
        dotTable= {}
        --dots
        for numbers = 1, string.len(Spells[currentPage]["spell"]) do
            table.insert(dotTable, tonumber(string.sub(Spells[currentPage]["spell"], numbers, numbers)))
        end --put into table
    
        dotShown= dotTable[1]
        dotShownNumber= 1
    end
end


function drawDot()
    --draw next dot
    if nowTime + eachDotShowTime < ElapsedTime then
        --if time passed then
        dotShownNumber= dotShownNumber + 1
        if dotShownNumber== #dotTable+1 then         
            --if last number then give a few seconds
            nowTime= ElapsedTime
            dotShownNumber= -1
        else
            nowTime= ElapsedTime
            dotShown= dotTable[dotShownNumber]
        end
    end
       
    if dotShownNumber > 0 then
        print("dot shown"..tostring(dotShown))
        sprite("Platformer Art:Guy Standing", dotPositions[dotShown].x, dotPositions[dotShown].y, WIDTH/14, WIDTH/14)
    end
end
