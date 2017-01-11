-- Main

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is main program for the CPT game



------------------------------------------------------------------------


--Set global variables

--Default level one, 100 coins to start with
Level= 1
MoneyHave= 100

CurrentWandNumber= 1

CurrentGameMap= 1
CurrentGameFloor= 0
CurrentMonsters= nil
CurrentMonster= {}



Attacked= false

NextWords= "o" --set to nothing

UserHealth= 100
HealthLevelAmount= 100

ExpPoints= 0
ExpNeedAmount= 50

--Used for going back to different scenes
GoBackTo= ""

--checks if given exp and everything
GotCoinsAndExp= true




Maps= {                                                                                                      {["floor"]= 1, ["unlocked"]= true},                                                                              {["floor"]=2, ["unlocked"]= false},                                                                              {["floor"]= 30, ["unlocked"]= false},                                                                                                                                                        {["floor"]= 100, ["unlocked"]= false},                                                                              }

--                                                                 {["spell name"]= "spellName", ["power"]=spellAttackPoints(average=15), ["type"]= "GrowTurn", ["spell"]= "spellNumbers", ["sprite"]= spellSpriteImage, ["level"]=3, ["description"]= "Spell strength: Medium   Difficulty: Medium"},                                                                                                                         

Spells= {{["spell name"]= "Dividi Bavidiboo", ["power"]= 18, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Project:spell 1", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"},                                                                                                                   {["spell name"]= "Abracadabra", ["power"]= 10, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "Project:spells 2", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"},                                                                                             {["spell name"]= "Thunder lash", ["power"]= 20, ["type"]= "turn", ["spell"]= "258789", ["sprite"]= "Project:spells 3", ["level"]=1, ["description"]= "Spell strength: Low   Difficulty: Low"},                           {["spell name"]= "Fire blast", ["power"]= 30, ["type"]= "grow", ["spell"]= "321478963", ["sprite"]= "Project:spells 4", ["level"]=2, ["description"]= "Spell strength: Low Medium   Difficulty: Low Medium"},                                              {["spell name"]= "Cloud kill", ["power"]=40, ["type"]= "grow", ["spell"]= "9317", ["sprite"]= "Project:spells 5", ["level"]=2, ["description"]= "Spell strength: Low Medium   Difficulty: Low Medium"},                                                           {["spell name"]= "Wall of fire", ["power"]=60, ["type"]= "turn", ["spell"]= "987654321", ["sprite"]= "Project:spells 6", ["level"]=3, ["description"]= "Spell strength: Medium   Difficulty: Medium"},                                                                 }


--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Project:Wand 1", ["cost"]=0, ["level"]= 1, ["unlocked"]= true, ["power"]= 1},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Project:Wand 3", ["cost"]=100, ["level"]= 2, ["unlocked"]= false, ["power"]= 2},                                                                     {["wand name"]="Advanced wand", ["sprite"]="Project:Wand 2", ["cost"]=500, ["level"]= 5, ["unlocked"]= false, ["power"]= 3},                                                                     {["wand name"]="Expert's wand", ["sprite"]="Project:Wand 4", ["cost"]=1000, ["level"]= 10, ["unlocked"]= false, ["power"]= 7},                                                                                                                           }


SpellCastedNumber= 0
Attacked= false


CurrentMonster= ""

MonsterDefeated= ""


NumberOfPotions= 3

MusicMuted= false

Mode= "game"


--for tutorials
FirstGamePlay= true

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
    FirstGamePlay= false
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
