-- Walking scene

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the walking scene for game

WalkingScene = class()

local backgroundImage= "Documents:Hallway"
local backgroundSprite

local beginTime
local endWalkTime

local moveHorrizontally
local moveVertically

local moveLeftOrRight
local moveUpOrDown

local scaleSize
local popUpY

local userGage
local potionButton
local pauseButton

local wand

local monsterDeafeatWords



function WalkingScene:init()
    -- you can accept and set parameters here
    print("Walk scene")
    if CurrentMonster["health"]<=0 then
        CurrentMonsters:nextMonsterUp() -- next monster
        if CurrentMonsters=="nothing" then
            --if a floor cleared then
            CurrentGameFloor= CurrentGameFloor-1 --new floor
            CurrentMonsters= Monsters() --sprite new patch
            
            for numberOfMaps= 1,#Maps do
                --floor unlocked
                if CurrentGameFloor==Maps[numberOfMaps]["floor"] then
                    Maps[numberOfMaps]["unlocked"]= true
                end
            end
            
            endWalkTime= 6--time it takes to walk
            NextWords= "Floor number "..tostring(CurrentGameFloor)
            endWalkTime= 3 --new floor
            
            
        else
            endWalkTime= math.random(10, 35)/10--time it takes to walk
        end
        
        
    else
        endWalkTime= 5 --beginning game, slightly longer
    end

    
    
    monsterDeafeatWords= tostring(MonsterDefeated).." defeated!"
    
    moveHorrizontally= 0
    moveVertically= 0
    moveLeftOrRight= "left"
    moveLeftOrRight= "down"
    
    scaleSize= vec2(WIDTH*1.1, HEIGHT*1.1)
    popUpY= 0
    
    sound("A Hero's Quest:Walk",  0.7) --play sound
    
    userGage= GageBar(UserHealth, 100, vec2(WIDTH/25, HEIGHT/30), color(255, 0, 0, 255), WIDTH/1.06)
    
    potionButton= Potion()
    wand= BasicSprites()
    
    pauseButton= Button("Cargo Bot:Stop Button", vec2(WIDTH-WIDTH/8, HEIGHT-WIDTH/9))
    
    beginTime= ElapsedTime
end


function WalkingScene:draw()
    -- Codea does not automatically call this method
    background(0, 0, 0, 255)
    
    --move left or right
    if moveHorrizontally < -WIDTH/22 then
        moveLeftOrRight= "right"
    elseif moveHorrizontally > WIDTH/22 then
        moveLeftOrRight= "left"
    end
    
    if moveLeftOrRight== "right" then
        moveHorrizontally= moveHorrizontally + 2
    else
        moveHorrizontally= moveHorrizontally - 2
    end
    
    
    --move up or down
    if moveVertically < -HEIGHT/37 then
        moveUpOrDown= "up"
    elseif moveVertically > HEIGHT/60 then
        moveUpOrDown= "down"
    end
    
    if moveUpOrDown== "up" then
        moveVertically= moveVertically + 3
    else
        moveVertically= moveVertically - 3
    end
    
    scaleSize.x= scaleSize.x + 1
    scaleSize.y= scaleSize.y + 1
    
    sprite("Project:bg", WIDTH/2+ moveHorrizontally, HEIGHT/2+ moveVertically, scaleSize.x, scaleSize.y) --draw background
    
    
    
      --draw wand
    wand:drawWand()
    
    --user gage bar
    userGage:draw()

    --draw potion button
    potionButton:draw()
    
    
    --pop up
    --create sprite
    
    sprite("Documents:양피지 2", WIDTH/2, popUpY, WIDTH/1.5, WIDTH/2.5) --draw popup
    
    --draw text
    textMode (CENTER)
    font("Papyrus")
    pushStyle ()
    if NextWords~= "" then
        --if new floor then
        fontSize (WIDTH/26)
        fill(42, 28, 24, 255)
        text(NextWords, WIDTH/2, popUpY)
    end
    if MonsterDefeated~="" then
        --enemy defeated
        fontSize (WIDTH/25)
        fill(0, 0, 0, 255)
        text(monsterDeafeatWords, WIDTH/2, popUpY-WIDTH/15)
    end
    
    
    --move popup up
    popUpY= popUpY+ (HEIGHT-popUpY)/60
       
    
    --change scene
    
    if (beginTime + endWalkTime) < ElapsedTime then
        --turn mode back to game
        Mode="game"
        MonsterDefeated= "" --reset to nothing
        NextWords= ""
        Scene.Change("game")
    end
    
    
    pauseButton:draw()
end

function WalkingScene:touched(touch)
    -- Codea does not automatically call this method
    
    --pause button
    pauseButton:touched(touch)
    if pauseButton.selected== true then
        Scene.Change("pause")
    end
end
