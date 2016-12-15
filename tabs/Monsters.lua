-- Monsters

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the class for making monsters

Monsters = class()

--                                                                                                            {['monster name']='NameOfMonster', ['sprite']= spriteImage, ['health']= healthOfMonster(average=80), ['points']= pointOfMonster(average=10), ['speed']= timeItTakesToAttack(average=2.3), ['coins']= numberOfCoins(average=14), ['strength']= attackPower,(average=36), ['floor']= atLeastThisFlooraToSee, ['attack sound']= soundWhenAttacking, ['hurt sound']= soundWhenAttacked},                                                                                                                  
monstersDict= {                                                                                                            {['monster name']='Booo', ['sprite']= "Planet Cute:Character Cat Girl", ['health']= 10, ['points']= 8, ['speed']= 2, ['coins']= 10, ["strength"]= 30, ['floor']= 1, ['attack sound']= "A Hero's Quest:Bottle Break 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                  {['monster name']='Hi', ['sprite']= "Planet Cute:Character Princess Girl", ['health']= 100, ['points']= 10, ['speed']= 1.8, ['coins']= 5, ['strength']= 20, ['floor']= 1, ['attack sound']= "A Hero's Quest:Bottle Break 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                  {['monster name']='Hoo', ['sprite']= "Planet Cute:Character Pink Girl", ['health']= 50, ['points']= 5, ['speed']= 1, ['coins']= 25, ['strength']= 15, ['floor']= 2, ['attack sound']= "A Hero's Quest:Dig 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"}                                                                                                                                                                                                                              }

local monstersList= {}

local currentMonsterGageBar

function Monsters:init()
    -- you can accept and set parameters here
    createNewBatchOfMonsters()
    setNextMonster()
end

function Monsters:draw()
    -- Codea does not automatically call this method
    --draw monster
    sprite(currentMonster["sprite"], 3*WIDTH/5, HEIGHT/1.7)
    currentMonsterGageBar:draw()
end

function Monsters:touched(touch)
    -- Codea does not automatically call this method
end


function createNewBatchOfMonsters()
    --Create a new batch of monsters
    
    monstersList= {} --clear up array
    
    --how many monsters in a floor
    local numberOfMonsters= math.random(6,8)
    
    local randomNumber
    
    for monsters= 1, numberOfMonsters do
        repeat
            randomNumber= math.random(1, #monstersDict)--random number
        until monstersDict[randomNumber]["floor"]<= CurrentGameFloor
            --if monsters are available at that floor then
            table.insert(monstersList, randomNumber)--put number into array
    end
end


function Monsters:returnMonsterNames()
    -- return the names of the monsters, just for checking
    local namesStrings= ""
    for numberOfMonsters= 1, #monstersList do
        local currentMonsterName= monstersDict[monstersList[numberOfMonsters]]["monster name"]
        namesStrings= namesStrings..currentMonsterName..", " --add monster name to string
    end
    return namesStrings
end


function Monsters:checkIfAttacked()
    --get the time limit of current monster 
    local timeLimit= currentMonster["speed"]
    if (ElapsedTime-startTime > timeLimit) then
        --if time over then
        Attacked= true
        Scene.Change("attack")
    end
end

function Monsters:monsterIsAttacked(amount)
    --reduce monster health
    CurrentMonster["health"]= math.tointeger(CurrentMonster["health"]-amount)
    currentMonsterGageBar:recalculateHealth(amount)
end

function setNextMonster()
    --reset monster and gagebar
    
    local changes= {'health', 'points', 'speed', 'coins', "strength"}
    --the ones that will be changed
    
    CurrentMonster= monstersDict[monstersList[1]] --set current monster
    
    for numberOfDetails= 1, #changes do
        --replace with random numbers so they wouldnt be exact
        local orginalValueTimed= tonumber(CurrentMonster[changes[numberOfDetails]]) *10
        CurrentMonster[changes[numberOfDetails]]= math.random(orginalValueTimed-5, orginalValueTimed-5)/1000
        --slight changes
    end
    
    CurrentMonsterOrgHealth= CurrentMonster["health"] --save original health
    
    --gage bar
    currentMonsterGageBar= GageBar(CurrentMonster["health"], CurrentMonsterOrgHealth, vec2(WIDTH/25, HEIGHT/90), color(255, 0, 0, 255), WIDTH/1.06) --gage bar for monster
end
