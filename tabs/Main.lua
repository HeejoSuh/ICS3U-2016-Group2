-- Main

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is main program for the CPT game



------------------------------------------------------------------------

--Set global variables

--Default level one, 100 coins to start with
LevelGlobal= readGlobalData("level", 1)
Level= LevelGlobal
MoneyHaveGlobal= readGlobalData("money", 100)
MoneyHave= MoneyHaveGlobal


--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Project:Wand 1", ["cost"]=0, ["level"]= 1, ["power"]= 1},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Project:Wand 3", ["cost"]=100, ["level"]= 1, ["power"]= 2},                                                                     {["wand name"]="Advanced wand", ["sprite"]="Project:Wand 2", ["cost"]=500, ["level"]= 3, ["power"]= 3},                                                                     {["wand name"]="Expert's wand", ["sprite"]="Project:Wand 4", ["cost"]=1000, ["level"]= 5, ["power"]= 7},                                                                                                                           }

CurrentWandNumberGlobal= readGlobalData("wandNumber", 1)
CurrentWandNumber= CurrentWandNumberGlobal

WandUnlockedGlobal={}
table.insert(WandUnlockedGlobal, 1, readGlobalData("wandUnlocked1", true))
for numberOfWands= 2, #Wands do
    --Wands unlocked or not
    table.insert(WandUnlockedGlobal,numberOfWands, readGlobalData("wandUnlocked"..tostring(numberOfWands), false))
end
WandUnlocked= WandUnlockedGlobal



Mode= "game"
CurrentGameFloorGlobal= readGlobalData("gameFloor", 0)
CurrentGameFloor= CurrentGameFloorGlobal


CurrentMonsterGlobal= readGlobalData("currentMonster", {})
CurrentMonster= CurrentMonsterGlobal
CurrentMonsters= {}

CurrentMonsterNumberGlobal= readGlobalData("monsterNumber", nil)
CurrentMonsterNumber= CurrentMonsterNumberGlobal
CurrentMonsterHealthGlobal= readGlobalData("monsterHealth", nil)
CurrentMonsterHealth= CurrentMonsterHealthGlobal
CurrentMonsterOrgHealthGlobal= readGlobalData("monsterHealth", nil)
CurrentMonsterOrgHealth= CurrentMonsterOrgHealthGlobal




SpellCastedNumber= 0
Attacked= false
NextWords= "o" --set to nothing



UserHealthGlobal= readGlobalData("userHealth", 100)
UserHealth= UserHealthGlobal
HealthLevelAmountGlobal= readGlobalData("healthLevel", 100)
HealthLevelAmount= HealthLevelAmountGlobal

ExpPointsGlobal= readGlobalData("expPoints", 0)
ExpPoints= ExpPointsGlobal
ExpNeedAmountGlobal= readGlobalData("expNeedAmount", 50)
ExpNeedAmount= ExpNeedAmountGlobal

--Used for going back to different scenes
GoBackTo= ""

--checks if given exp and everything
GotCoinsAndExpGlobal= readGlobalData("gotThings", true)
GotCoinsAndExp= GotCoinsAndExpGlobal




Maps= {                                                                                                      {["floor"]= 1},                                                                                                                                                                                                                                                              {["floor"]= 20},                                                                                                                                                                                                                     {["floor"]= 50},                                                                                                                                                                                                                      {["floor"]= 70},                                                                                                                                                                                                                                                        {["floor"]= 100},                                                                              }

MapsUnlockedGlobal={}
table.insert(MapsUnlockedGlobal, 1, readGlobalData("mapsUnlocked1", true))
for numberOfMaps= 2, #Maps do
    --Wands unlocked or not
    table.insert(MapsUnlockedGlobal,numberOfMaps, readGlobalData("mapsUnlocked"..tostring(numberOfMaps), false))
end
MapsUnlocked= MapsUnlockedGlobal



--                                                                 {["spell name"]= "spellName", ["power"]=spellAttackPoints(average=15), ["type"]= "GrowTurn", ["spell"]= "spellNumbers", ["sprite"]= spellSpriteImage, ["level"]=3, ["description"]= "Spell strength: Medium   Difficulty: Medium"},                                                                                                                         

Spells= {{["spell name"]= "Dividi Bavidiboo", ["power"]= 18, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Tyrian Remastered:Explosion Huge", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"},                                                                                                                   {["spell name"]= "Abracadabra", ["power"]= 10, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "Project:spells 2", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"},                                                                                             {["spell name"]= "Thunder lash", ["power"]= 20, ["type"]= "turn", ["spell"]= "258789", ["sprite"]= "Project:spells 3", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"},                           {["spell name"]= "Fire blast", ["power"]= 30, ["type"]= "grow", ["spell"]= "321478963", ["sprite"]= "Project:spells 4", ["level"]=2, ["description"]= "Spell strength: Low Medium   Difficulty: Low Medium"},                                              {["spell name"]= "Cloud kill", ["power"]=40, ["type"]= "grow", ["spell"]= "9317", ["sprite"]= "Tyrian Remastered:Space Ice 5", ["level"]=2, ["description"]= "Spell strength: Low Medium   Difficulty: Low Medium"},                                                           {["spell name"]= "Wall of fire", ["power"]=60, ["type"]= "turn", ["spell"]= "987654321", ["sprite"]= "Project:spells 6", ["level"]=3, ["description"]= "Spell strength: Medium   Difficulty: Medium"},                                                                 }



MonsterDefeated= ""


NumberOfPotionsGlobal= readGlobalData("potionNumber", 3)
NumberOfPotions= NumberOfPotionsGlobal

MusicMutedGlobal= readGlobalData("musicMuted", false)
MusicMuted= MusicMutedGlobal




--for tutorials
FirstGamePlay= readGlobalData("tutorials", true)

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
    Scene.Change("mainMenu")
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
