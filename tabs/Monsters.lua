-- Monsters

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the class for making monsters

Monsters = class()


--NO DECIMALS OR THE PROGRAM DIES
--                                                                                                            {['monster name']='NameOfMonster', ['sprite']= spriteImage, ['health']= healthOfMonster(average=80), ['points']= pointOfMonster(average=10), ['speed']= timeItTakesToAttack(average=2.3), ['coins']= numberOfCoins(average=14), ['strength']= attackPower,(average=36), ['floor']= atLeastThisFlooraToSee, ['attack sound']= soundWhenAttacking, ['hurt sound']= soundWhenAttacked},                                                                                                                  
monstersDict= {                                                                                                            {['monster name']='Fluffy', ['sprite']= "Project:Monster bushy", ['health']= 20, ['points']= 8, ['speed']= 2.5, ['coins']= 10, ["strength"]= 30, ['floor']= 1, ['attack sound']= "A Hero's Quest:Monster Die 2", ['hurt sound']= "A Hero's Quest:Monster Die 1"},                                                                                                                  {['monster name']='Dustball', ['sprite']= "Project:monster dust", ['health']= 70, ['points']= 10, ['speed']= 3.3, ['coins']= 5, ['strength']= 8, ['floor']= 1, ['attack sound']= "A Hero's Quest:Monster Hit 2", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                  {['monster name']='Mysterious egg', ['sprite']= "Project:monster egg", ['health']= 90, ['points']= 5, ['speed']= 1.8, ['coins']= 50, ['strength']= 15, ['floor']= 2, ['attack sound']= "A Hero's Quest:Dig 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                       {['monster name']='Nightmare', ['sprite']= "Project:Monster 4", ['health']= 100, ['points']= 8, ['speed']= 1.6, ['coins']= 20, ['strength']= 5, ['floor']= 2, ['attack sound']= "A Hero's Quest:Dig 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                                   {['monster name']='Chirpy', ['sprite']= "Project:Monster 7", ['health']= 80, ['points']= 20, ['speed']= 2.1, ['coins']= 10, ['strength']= 20, ['floor']= 3, ['attack sound']= "A Hero's Quest:Dig 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                                                 {['monster name']='Ghoastasgast', ['sprite']= "Project:Monster 5", ['health']= 30, ['points']= 6, ['speed']= 2.4, ['coins']= 20, ['strength']= 40, ['floor']= 3, ['attack sound']= "A Hero's Quest:FireBall Blast 2", ['hurt sound']= "A Hero's Quest:FireBall Blast 1"},                                                                                                                             {['monster name']='HoHoHoo', ['sprite']= "Project:Monster 6", ['health']= 100, ['points']= 7 ,['speed']= 1.9, ['coins']= 10, ['strength']= 18, ['floor']= 3, ['attack sound']= "A Hero's Quest:Dig 1", ['hurt sound']= "A Hero's Quest:Dig 2"}                                                                                                                                                                                           }

--sprite("4")
--sound("A Hero's Quest:FireBall Blast 1")

local __monstersList= {}
local __currentMonsterGageBar


function Monsters:init()
    -- you can accept and set parameters here
    createNewBatchOfMonsters()
    setNextMonster()
end

function Monsters:draw()
    -- Codea does not automatically call this method
    --draw monster
    if Attacked== false then
        --normal size
        sprite(CurrentMonster["sprite"], WIDTH/2, HEIGHT/1.6, WIDTH/1.3, WIDTH/1.3)
    else
        sprite(CurrentMonster["sprite"], WIDTH/2, HEIGHT/1.8, WIDTH, WIDTH)
    end
    
    __currentMonsterGageBar= GageBar(CurrentMonster["health"], currentMonsterOrgHealth, vec2(WIDTH/23, HEIGHT- HEIGHT/25), color(0, 195, 255, 255), WIDTH/1.1) --gage bar for monster
    --draw gage bar
    __currentMonsterGageBar:draw()
end


function Monsters:touched(touch)
    -- Codea does not automatically call this method
end


function createNewBatchOfMonsters()
    --Create a new batch of monsters
    
    __monstersList= {} --clear up array
    
    --how many monsters in a floor
    local numberOfMonsters= math.random(3,5)
    
    local randomNumber
    
    for monsters= 1, numberOfMonsters do
        repeat
            randomNumber= math.random(1, #monstersDict)--random number
        until monstersDict[randomNumber]["floor"]<= CurrentGameFloor
            --if monsters are available at that floor then
            table.insert(__monstersList, randomNumber)--put number into array
    end
end


function Monsters:returnMonsterNames()
    -- return the names of the monsters, just for checking
    local namesStrings= ""
    for numberOfMonsters= 1, #__monstersList do
        local currentMonsterName= monstersDict[__monstersList[numberOfMonsters]]["monster name"]
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
    
   -- local changes= {'health', 'points', 'coins', "strength"}
    --the ones that will be changed
    
    CurrentMonster= monstersDict[__monstersList[1]] --set current monster
    
   -- for numberOfDetails= 1, #changes do
        --replace with random numbers so they wouldnt be exact
        
       -- local currentChanging= changes[numberOfDetails] --what value is currently changing     
      --  print(CurrentMonster[currentChanging])
                
       -- CurrentMonster[currentChanging]= math.tointeger(tonumber(CurrentMonster[currentChanging])*math.random(50,CurrentGameFloor*100)/100)
        --slight variations for each one
       -- print(CurrentMonster[currentChanging])
   -- end
    
    
    
    --differs for every monster
    --40%~150%
    local percent= math.random(4, 15*CurrentGameFloor)/10

    
    CurrentMonster["health"]= tonumber(string.format("%.f", tonumber(CurrentMonster["health"]) * percent))
    
    CurrentMonster["coins"]= tonumber(string.format("%.f", tonumber(CurrentMonster["coins"]) * percent))
    
    CurrentMonster["points"]= tonumber(string.format("%.f", tonumber(CurrentMonster["points"]) * percent))
    
    CurrentMonster["strength"]= tonumber(string.format("%.f", tonumber(CurrentMonster["strength"]) * percent))

    print("\n\n\n\n\n\n")

    currentMonsterOrgHealth= CurrentMonster["health"] --save original health    
    
end



function Monsters:nextMonsterUp()
    --see if can get next monster
    
    --add coins, exp points and such
    print("Coins earned: "..tostring(CurrentMonster["coins"]))
    print("Exp earned: "..tostring(CurrentMonster["points"]))
    
    MoneyHave= MoneyHave + CurrentMonster["coins"]
    ExpPoints= ExpPoints + CurrentMonster["points"]
    
    
    
    local expLevelAmount= ExpNeedAmount/Level
    local healthTimesAmount= 1.05
    
    --check if there needs to be a new level
    if ExpPoints>= ExpNeedAmount and GotCoinsAndExp==false then
        ExpPoints= ExpPoints- ExpNeedAmount --take away exp points
        Level= Level+1 -- level up
        ExpNeedAmount= ExpNeedAmount + expLevelAmount --increase in needed exp
        sound("A Hero's Quest:Level Up")
        HealthLevelAmount= HealthLevelAmount*1.1 --more health
        UserHealth= HealthLevelAmount --more health
    end
    
    
    --then delete the current monster
    if #__monstersList==1 then
        --if only one left then
        print("No more Monsters on this floor")
        CurrentMonsters= nil
        
    else
        for numberOfMonsters= 1, #__monstersList do
            if numberOfMonsters== #__monstersList then
                --get rid of the last one
                table.remove(__monstersList, #__monstersList)
                setNextMonster() --set current monster
            else
                __monstersList[numberOfMonsters]= __monstersList[numberOfMonsters+1] --set to next one
            end
        end
        print(Monsters:returnMonsterNames())
    end
    
end
