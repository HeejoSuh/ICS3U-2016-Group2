-- Main Menu

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the main menu scene.

MainMenuScene = class()


local buttons


local centerButtonSize= vec2(WIDTH/2.5, HEIGHT/8)

function MainMenuScene:init()
    -- you can accept and set parameters here 
    local middleButtonSpace= HEIGHT/7
    local middleButtonOriginalY= HEIGHT/1.9
    
    buttons= {                                                                                 {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/2, middleButtonOriginalY), ["scene"]="maps",},                                                                                  {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/2, middleButtonOriginalY - 1*middleButtonSpace), ["scene"]="game", ["mode"]= "resume"},                                           {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/2, middleButtonOriginalY - 2*middleButtonSpace), ["scene"]="game", ["mode"]= "practice"},                                                                                 {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/2, middleButtonOriginalY - 3*middleButtonSpace), ["scene"]="spells"},                                                                                 {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH/8, HEIGHT/1.1), ["scene"]="settings"},                                                                                                                                                                 {["sprite"]= "Space Art:Part Yellow Hull 3", ["position"]= vec2(WIDTH-WIDTH/8, HEIGHT/1.1), ["scene"]="shop"},                                                                                 }
    

    for numberOfButtons= 1, #buttons do
        --put actual buttons into dictionary
        local buttonImage= buttons[numberOfButtons]["sprite"]
        local buttonPosition= buttons[numberOfButtons]["position"]
        buttons[numberOfButtons]["button"]= Button(buttonImage, vec2(buttonPosition.x, buttonPosition.y))
    end
    
end



function MainMenuScene:draw()
    -- Codea does not automatically call this method
    background(132, 83, 83, 255)
    
    for numberOfButtons= 1,#buttons do
        --draw the buttons
        buttons[numberOfButtons]["button"]:draw()
        fill(0, 0, 0, 255)
        text(buttons[numberOfButtons]["scene"], buttons[numberOfButtons]["position"].x, buttons[numberOfButtons]["position"].y)
    end
    
    sprite("Small World:Court", WIDTH/2, HEIGHT/1.2, WIDTH/2.5, WIDTH/2.5) -- game name sprite
    fontSize(WIDTH/18)
    fill(0, 0, 0, 255)
    text("Spell Caster", WIDTH/2, HEIGHT/1.2)
    
    fontSize (WIDTH/25)
    font("Papyrus")
    textMode (CENTER)
    pushStyle ()
    fill(228, 190, 101, 255)
    text("Coins: "..math.tointeger(MoneyHave), WIDTH/2, HEIGHT/1.6)
    fill(10, 10, 10, 255)
    
end


function MainMenuScene:touched(touch)
    -- Codea does not automatically call this method
    
    for numberOfButtons= 1,#buttons do
        local currentButtonDict= buttons[numberOfButtons]
        currentButtonDict["button"]:touched(touch)
        if currentButtonDict["button"].selected==true then
            -- if button touched then
            sound("A Hero's Quest:Arrow Shoot 2")
            
            if currentButtonDict["mode"]=="practice" then
                CurrentGameFloor=nil
                SpriteEnemies= false
            else
                SpriteEnemies= true
            end
            
            if currentButtonDict["mode"]=="resume" and CurrentGameFloor==nil then
                --if no resume then do nothing
            else 
                if currentButtonDict["mode"]=="practice" then
                    --practice scene
                    Mode= "practice"
                end
                print("Go to "..currentButtonDict["scene"])
                Scene.Change(currentButtonDict["scene"])
            end
        end
    end
    
end


