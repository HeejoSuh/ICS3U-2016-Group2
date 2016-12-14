WalkingScene = class()

local backgroundImage= "Documents:Hallway"
local backgroundSprite

local startTime= ElapsedTime
local endWalkTime

local moveHorrizontally
local moveVertically

local moveLeftOrRight
local moveUpOrDown

local scaleSize

local popUpY


local userGage
local potionButton

local wand

function WalkingScene:init()
    -- you can accept and set parameters here
    
    --time it takes to walk
    if NewFloor~="" then
        endWalkTime= 5
    else
        endWalkTime= 4.5
    end
    
    moveHorrizontally= 0
    moveVertically= 0
    
    moveLeftOrRight= "left"
    moveLeftOrRight= "down"
    
    scaleSize= vec2(WIDTH*1.1, HEIGHT*1.1)
    
    popUpY= 0
    
    sound("A Hero's Quest:Walk",  0.7) --play sound
    
    userGage= GageBar(UserHealth, 100, vec2(WIDTH/25, HEIGHT/90), color(255, 0, 0, 255), WIDTH/1.06)
    potionButton= Potion()
    
    wand= BasicSprites("walking")
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
    
    sprite("SpaceCute:Background", WIDTH/2+ moveHorrizontally, HEIGHT/2+ moveVertically, scaleSize.x, scaleSize.y) --draw background
    
    
    
      --draw wand
    wand:draw()
    
    --user gage bar
    userGage:draw()

    --draw potion button
    potionButton:draw()
    
    
    --pop up
    if EnemyDefeated~= "" or NewFloor~= "" then 
        --create sprite
    
        sprite("Documents:양피지 2", WIDTH/2, popUpY, WIDTH/1.5, WIDTH/2.5) --draw popup
    
        --draw text
        textMode (CENTER)
        font("Papyrus")
        pushStyle ()
        if NewFloor~= "" then
            --floor
            fontSize(WIDTH/24)
            fill(0, 0, 0, 255)
            text(NewFloor, WIDTH/2, popUpY+WIDTH/24)
        end
        fontSize (WIDTH/26)
        fill(42, 28, 24, 255)
        text("hsjejej", WIDTH/2, popUpY-WIDTH/26)
    
    
        --move popup up
        popUpY= popUpY+ (HEIGHT-popUpY)/60
    end
    
    
    --change scene
    if (startTime + endWalkTime < ElapsedTime) then
        Scene.Change("game")
    end
    
end

function WalkingScene:touched(touch)
    -- Codea does not automatically call this method
    userGage:recalculateHealth(potionButton:touched(touch)) --see if change in health
end
