-- Main

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is main program for the CPT game

--RESET DATA
--clearLocalData()
------------------------------------------------------------------------

--Set global variables

--Default level one, 100 coins to start with
LevelGlobal= readLocalData("level", 1)
Level= LevelGlobal

MoneyHaveGlobal= readLocalData("money", 100)
MoneyHave= MoneyHaveGlobal



--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Project:Wand 1", ["cost"]=0, ["level"]= 1, ["power"]= 1},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Project:Wand 3", ["cost"]=100, ["level"]= 1, ["power"]= 2},                                                                     {["wand name"]="Advanced wand", ["sprite"]="Project:Wand 2", ["cost"]=500, ["level"]= 3, ["power"]= 3},                                                                     {["wand name"]="Expert's wand", ["sprite"]="Project:Wand 4", ["cost"]=1000, ["level"]= 5, ["power"]= 7},                                                                                                                           }

CurrentWandNumberGlobal= readLocalData("wandNumber", 1)
CurrentWandNumber= CurrentWandNumberGlobal


WandUnlockedGlobal={}
table.insert(WandUnlockedGlobal, 1, readLocalData("wandUnlocked1", true))
for numberOfWands= 2, #Wands do
    --Wands unlocked or not
    table.insert(WandUnlockedGlobal,numberOfWands, readLocalData("wandUnlocked"..tostring(numberOfWands), false))
end
WandUnlocked= WandUnlockedGlobal




Mode= "game"
CurrentGameFloorGlobal= readLocalData("gameFloor", 0)
CurrentGameFloor= CurrentGameFloorGlobal


CurrentMonsterGlobal= readLocalData("currentMonster", {})
CurrentMonster= CurrentMonsterGlobal
CurrentMonsters= {}


SpellCastedNumber= 0
Attacked= false
NextWords= "o" --set to nothing



UserHealthGlobal= readLocalData("userHealth", 100)
UserHealth= UserHealthGlobal
HealthLevelAmountGlobal= readLocalData("healthLevel", 100)
HealthLevelAmount= HealthLevelAmountGlobal


ExpPointsGlobal= readLocalData("expPoints", 0)
ExpPoints= ExpPointsGlobal

ExpNeedAmountGlobal= readLocalData("expNeedAmount", 50)
ExpNeedAmount= ExpNeedAmountGlobal


--Used for going back to different scenes
GoBackTo= ""

--checks if given exp and everything
GotCoinsAndExpGlobal= readLocalData("gotThings", true)
GotCoinsAndExp= GotCoinsAndExpGlobal




Maps= {                                                                                                      {["floor"]= 1},                                                                                                                                                                                                                                                              {["floor"]= 5},                                                                                                                                                                                                                     {["floor"]= 10},                                                                                                                                                                                                                      {["floor"]= 20},                                                                                                                                                                                                                                                        {["floor"]= 30},                                                                                                                                                                                                                      {["floor"]= 40},                                                                                                                                                                                                                      {["floor"]= 50},                                                                                                                                                                                                                      {["floor"]= 60},                                                                                                                                                                                                                      {["floor"]= 70},                                                                                                                                                                                                                      {["floor"]= 80},                                                                                                                                                                                                                      {["floor"]= 90},                                                                                                                                                                                                                      {["floor"]= 100},                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      }

MapsUnlockedGlobal={}
table.insert(MapsUnlockedGlobal, 1, readLocalData("mapsUnlocked1", true))
for numberOfMaps= 2, #Maps do
    --Wands unlocked or not
    table.insert(MapsUnlockedGlobal,numberOfMaps, readLocalData("mapsUnlocked"..tostring(numberOfMaps), false))
end
MapsUnlocked= MapsUnlockedGlobal



--                                                                 Spells[hdjdjdj]={["spell name"]= "spellName", ["power"]=spellAttackPoints(average=15), ["type"]= "GrowTurn", ["spell"]= "spellNumbers", ["sprite"]= spellSpriteImage, ["level"]=3, ["description"]= "Spell strength: Medium   Difficulty: Medium"}

Spells= {}

Spells[1]= {["spell name"]= "Dividi Bavidiboo", ["power"]= 18, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Tyrian Remastered:Explosion Huge", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"}

Spells[2]= {["spell name"]= "Abracadabra", ["power"]= 10, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "Project:spells 2", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"} 

Spells[3]= {["spell name"]= "Icpears", ["power"]= 15, ["type"]= "turn", ["spell"]= "4569", ["sprite"]= "Tyrian Remastered:Space Ice 3", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"} 

Spells[4]= {["spell name"]= "Thunder lash", ["power"]= 20, ["type"]= "turn", ["spell"]= "258789", ["sprite"]= "Project:spells 3", ["level"]=2, ["description"]= "Spell strength: Low   Difficulty: Low"} 

Spells[5]= {["spell name"]= "Fire blast", ["power"]= 30, ["type"]= "grow", ["spell"]= "321478963", ["sprite"]= "Project:spells 4", ["level"]=2, ["description"]= "Spell strength: Low Medium   Difficulty: Low Medium"}

Spells[6]= {["spell name"]= "Cloud kill", ["power"]=40, ["type"]= "grow", ["spell"]= "9317", ["sprite"]= "Tyrian Remastered:Space Ice 5", ["level"]=2, ["description"]= "Spell strength: Low Medium   Difficulty: Low Medium"}

Spells[7]= {["spell name"]= "Wall of fire", ["power"]=60, ["type"]= "turn", ["spell"]= "987654321", ["sprite"]= "Project:spells 6", ["level"]=3, ["description"]= "Spell strength: Medium   Difficulty: Medium"}


MonsterDefeated= ""


NumberOfPotionsGlobal= readLocalData("potionNumber", 3)
NumberOfPotions= NumberOfPotionsGlobal

MusicMutedGlobal= readLocalData("musicMuted", false)
MusicMuted= MusicMutedGlobal




--for tutorials
FirstGamePlay= readLocalData("tutorials", true)

------------------------------------------------------------------------

function setup()
    supportedOrientations(PORTRAIT)
    --displayMode(FULLSCREEN_NO_BUTTONS)
    displayMode(FULLSCREEN)
    noFill()
    noSmooth()
    noStroke()
    pushStyle()
    
    
    if MusicMuted==false then
        music("Project:GameBgm", true, 1)
    else
        music.paused= true
    end
    
    --define scenes
    Scene("splash", SplashScene)
    Scene("mainMenu", MainMenuScene)
    Scene("spells", SpellsScene)
    Scene("shop", ShopScene)
    Scene("settings", SettingsScene)
    Scene("maps", MapsScene)
    Scene("game", GameScene)
    Scene("walk", WalkingScene)
    Scene("attack", AttackScene)
    Scene("pause", PausedScene)
    Scene("dead", DeadScene)
    Scene("help", HelpScene)
    
    
    --go to splash scene first
    --Scene.Change("splash")
    Scene.Change("splash")
end
 
------------------------------------------------------------------------

function draw()
    background(0, 0, 0, 255) 
    Scene:Draw()
end

------------------------------------------------------------------------

--Touched needed in the main.
function touched(touch)
    Scene.Touched(touch)
end
