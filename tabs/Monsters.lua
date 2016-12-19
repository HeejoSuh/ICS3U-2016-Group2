-- Monsters

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the class for making monsters

Monsters = class()

--                                                                                                            {['monster name']='NameOfMonster', ['sprite']= spriteImage, ['health']= healthOfMonster(average=80), ['points']= pointOfMonster(average=10), ['speed']= timeItTakesToAttack(average=2.3), ['coins']= numberOfCoins(average=14), ['strength']= attackPower,(average=36), ['floor']= atLeastThisFlooraToSee, ['attack sound']= soundWhenAttacking, ['hurt sound']= soundWhenAttacked},                                                                                                                  
monstersDict= {                                                                                                            {['monster name']='Booo', ['sprite']= "Planet Cute:Character Cat Girl", ['health']= 10, ['points']= 8, ['speed']= 2, ['coins']= 10, ["strength"]= 30, ['floor']= 1, ['attack sound']= "A Hero's Quest:Monster Die 2", ['hurt sound']= "A Hero's Quest:Monster Die 1"},                                                                                                                  {['monster name']='Hi', ['sprite']= "Planet Cute:Character Princess Girl", ['health']= 100, ['points']= 10, ['speed']= 2, ['coins']= 5, ['strength']= 20, ['floor']= 1, ['attack sound']= "A Hero's Quest:Monster Hit 2", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                  {['monster name']='Hoo', ['sprite']= "Planet Cute:Character Pink Girl", ['health']= 50, ['points']= 5, ['speed']= 1, ['coins']= 25, ['strength']= 15, ['floor']= 2, ['attack sound']= "A Hero's Quest:Dig 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"}                                                                                                                                                                                                                              }

--sound("A Hero's Quest:Monster Hit 2")

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
    sprite(CurrentMonster["sprite"], WIDTH/2, HEIGHT/1.5, WIDTH/1.3, WIDTH/1.3)
    
    currentMonsterGageBar= GageBar(CurrentMonster["health"], currentMonsterOrgHealth, vec2(WIDTH/23, HEIGHT- HEIGHT/25), color(131, 0, 255, 255), WIDTH/1.1) --gage bar for monster
    --draw gage bar
    currentMonsterGageBar:draw()
end


function Monsters:touched(touch)
    -- Codea does not automatically call this method
end


function createNewBatchOfMonsters()
    --Create a new batch of monsters
    
    monstersList= {} --clear up array
    
    --how many monsters in a floor
    local numberOfMonsters= math.random(3,5)
    
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


function Monsters:checkIfAttacked(startTime)
    --get the time limit of current monster 
    local timeLimit= CurrentMonster["speed"]
    if (ElapsedTime-startTime > timeLimit) then
        --if time over then
        Attacked= true
        Scene.Change("attack")
    end
end


function setNextMonster()
    --reset monster and gagebar
    
    local changes= {'health', 'points', 'speed', 'coins', "strength"}
    --the ones that will be changed
    
    CurrentMonster= monstersDict[monstersList[1]] --set current monster
    
    for numberOfDetails= 1, #changes do
        --replace with random numbers so they wouldnt be exact
        
        local currentChanging= changes[numberOfDetails] --what value is currently changing     
        local changingValue= CurrentMonster[currentChanging]
        
        CurrentMonster[currentChanging]= tonumber(CurrentMonster[currentChanging]) + math.random(changingValue, 2*changingValue) - changingValue + 1
        --slight changes
        
    end
    
    currentMonsterOrgHealth= CurrentMonster["health"] --save original health    
end



function Monsters:nextMonsterUp()
    --see if can get next monster
    
    --add coins, exp points and such
    print("Coins earned: "..tostring(CurrentMonster["coins"]))
    print("Exp earned: "..tostring(CurrentMonster["points"]))
    
    MoneyHave= MoneyHave + CurrentMonster["coins"]
    ExpPoints= ExpPoints + CurrentMonster["points"]
    
    
    
    local expLevelAmount= 250 
    local healthTimesAmount= 1.05
    
    --check if there needs to be a new level
    if ExpPoints>= ExpNeedAmount then
        ExpPoints= ExpPoints- ExpNeedAmount --take away exp points
        Level= Level+1 -- level up
        ExpNeedAmount= ExpNeedAmount + expLevelAmount --increase in needed exp
        HealthLevelAmount= HealthLevelAmount*1.1 --more health
        UserHealth= HealthLevelAmount --more health
    end
    
    
    --then delete the current monster
    if #monstersList==1 then
        --if only one left then
        print("No more Monsters on this floor")
        CurrentMonsters= nil
        
    else
        for numberOfMonsters= 1, #monstersList do
            if numberOfMonsters== #monstersList then
                --get rid of the last one
                table.remove(monstersList, #monstersList)
                setNextMonster() --set current monster
            else
                monstersList[numberOfMonsters]= monstersList[numberOfMonsters+1] --set to next one
            end
        end
        print(Monsters:returnMonsterNames())
    end
    
end
