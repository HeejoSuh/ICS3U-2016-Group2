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
    print("Main menu")
    
    GoBackTo= "" --reset to nothing
    
    local middleButtonSpace= HEIGHT/7
    local middleButtonOriginalY= HEIGHT/1.9
    
    buttons= {                                                                                 {["sprite"]= "Cargo Bot:Dialogue Button", ["position"]= vec2(WIDTH/2, middleButtonOriginalY), ["scene"]="maps", ["name"]="Maps"},                                                                                  {["sprite"]= "Cargo Bot:Dialogue Button", ["position"]= vec2(WIDTH/2, middleButtonOriginalY - 1*middleButtonSpace), ["scene"]="game", ["mode"]= "resume",  ["name"]="Resume"},                                           {["sprite"]= "Cargo Bot:Dialogue Button", ["position"]= vec2(WIDTH/2, middleButtonOriginalY - 2*middleButtonSpace), ["scene"]="game", ["mode"]= "practice",  ["name"]="Practice"},                                                                                 {["sprite"]= "Cargo Bot:Dialogue Button", ["position"]= vec2(WIDTH/2, middleButtonOriginalY - 3*middleButtonSpace), ["scene"]="spells",  ["name"]="Spells"},                                                                                 {["sprite"]= "Cargo Bot:Title Large Crate 2", ["position"]= vec2(WIDTH/8, HEIGHT/1.1), ["scene"]="settings",  ["name"]="Settings"},                                                                                                                                                                 {["sprite"]= "Cargo Bot:Title Large Crate 2", ["position"]= vec2(WIDTH-WIDTH/8, HEIGHT/1.1), ["scene"]="shop",  ["name"]="Shop"},                                                                                 }
    

    for numberOfButtons= 1, #buttons do
        --put actual buttons into dictionary
        local buttonImage= buttons[numberOfButtons]["sprite"]
        local buttonPosition= buttons[numberOfButtons]["position"]
        buttons[numberOfButtons]["button"]= Button(buttonImage, vec2(buttonPosition.x, buttonPosition.y))
    end
    
end



function MainMenuScene:draw()
    -- Codea does not automatically call this method
    background(40, 60, 29, 255)
    
    for numberOfButtons= 1,#buttons do
        --draw the buttons
        buttons[numberOfButtons]["button"]:draw()
        fontSize(WIDTH/21)
        fill(0, 0, 0, 255)
        text(buttons[numberOfButtons]["name"], buttons[numberOfButtons]["position"].x, buttons[numberOfButtons]["position"].y)
    end
    
    sprite("Small World:Court", WIDTH/2, HEIGHT/1.2, WIDTH/2.5, WIDTH/2.5) -- game name sprite
    fontSize(WIDTH/18)
    fill(0, 0, 0, 255)
    text("The Wanderer", WIDTH/2, HEIGHT/1.2)
    
    fontSize (WIDTH/25)
    font("Papyrus")
    textMode (CENTER)
    pushStyle ()
    fill(228, 190, 101, 255)
    text("Coins: "..tostring(math.tointeger(MoneyHave)), WIDTH/2, HEIGHT/1.6)
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
            
            if currentButtonDict["mode"]=="resume" then
                --resume game
                if CurrentGameFloor==0 then
                    --if no data then do nothing
                else
                    if CurrentMonsters==nil then 
                        -- if no monsters then make new ones
                        CurrentGameFloor= 1
                        CurrentMonsters= Monsters()
                    end
                    Scene.Change("walk")
                end
            else 
                if currentButtonDict["mode"]=="practice" then
                    --practice scene
                    Mode= "practice"
                    CurrentGameFloor= 0
                end
                print("Go to "..currentButtonDict["scene"])
                Scene.Change(currentButtonDict["scene"])
            end
        end
    end
    
end


