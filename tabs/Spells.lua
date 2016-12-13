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

function SpellsScene:init()
    -- you can accept and set parameters here
    backButton= BackButton()
    
    --need sprites that are big
    previousPageButton= Button("Documents:Hallway", vec2(WIDTH/7, HEIGHT/2.5))
    nextPageButton= Button("Documents:Hallway", vec2(6*WIDTH/7, HEIGHT/2.5))
    
    currentPage= 0
    print(currentPage)
end

function SpellsScene:draw()
    -- Codea does not automatically call this method
    
    previousPageButton:draw()
    nextPageButton:draw()
    --hide the buttons
    
    background(160, 101, 149, 255)
    
    if currentPage==0 then
         --book sprite
        tint(85, 31, 31, 255)
        sprite("Documents:양피지", WIDTH/2, HEIGHT/2, WIDTH/1.1, HEIGHT/1.1)
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
        sprite("Documents:양피지", WIDTH/2, HEIGHT/2, WIDTH/1.1, HEIGHT/1.1)
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
        font("Papyrus")
        fontSize(WIDTH/20)
        fill(22, 32, 21, 190)
        local spell= Spells[currentPage]["spell"]
        text(spell, WIDTH/2, HEIGHT/2)
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
    backButton:touched(touch)
    
    previousPageButton:touched(touch)
    if previousPageButton.selected==true then
        if currentPage-1 >= 0 then
            --if not the first page then turn page
            currentPage=currentPage-1
            print(currentPage)
            sound("A Hero's Quest:Page Turn")
        end
    end
    
    nextPageButton:touched(touch)
    if nextPageButton.selected==true then
        if currentPage+2 < #Wands then
            --if not the last page then turn page
            currentPage=currentPage+1
            print(currentPage)
            sound("A Hero's Quest:Page Turn")
        end
    end
end
