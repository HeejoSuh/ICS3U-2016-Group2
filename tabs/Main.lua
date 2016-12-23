-- Main

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is main program for the CPT game


Level= 1
MoneyHave= 0


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
ExpNeedAmount= 200

GoBackTo= ""



Maps= {                                                                                                      {["floor"]= 1, ["unlocked"]= true},                                                                              {["floor"]=2, ["unlocked"]= false},                                                                              {["floor"]= 30, ["unlocked"]= false},                                                                                                                                                        {["floor"]= 100, ["unlocked"]= false},                                                                              }

--                                                                 {["spell name"]= "spellName", ["power"]=spellAttackPoints(average=15), ["type"]= "GrowTurn", ["spell"]= {spellNumbers}, ["sprite"]= spellSpriteImage, ["lv"]=3, ["description"]= "Spell strength: Medium \nDifficulty: Medium"},                                                                                                                         

Spells= {{["spell name"]= "Dividi Bavidiboo", ["power"]= 4, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Cargo Bot:Smoke Particle", ["level"]=1, ["description"]= "Spell strength: Low \nDifficulty: Low"},                                                                                                                   {["spell name"]= "Abracadabra", ["power"]= 5, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "SpaceCute:Collision Circle", ["level"]=1, ["description"]= "Spell strength: Low \nDifficulty: Low"},                                                                                             {["spell name"]= "Thunder lash", ["power"]= 8, ["type"]= "turn", ["spell"]= "258789", ["sprite"]= "SpaceCute:Collision Circle", ["level"]=1, ["description"]= "Spell strength: Low \nDifficulty: Low"},                           {["spell name"]= "Fire blast", ["power"]= 13, ["type"]= "grow", ["spell"]= "321478963", ["sprite"]= "Cargo Bot:Smoke Star", ["level"]=2, ["description"]= "Spell strength: Low Medium \nDifficulty: Low Medium"},                                              }




--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Project:Wand 1", ["cost"]=0, ["level"]= 1, ["unlocked"]= true},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Project:Wand 3", ["cost"]=100, ["level"]= 2, ["unlocked"]= false},                                                                     {["wand name"]="Advanced wand", ["sprite"]="Project:Wand 2", ["cost"]=500, ["level"]= 5, ["unlocked"]= false},                                                                     {["wand name"]="Expert's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=1000, ["level"]= 10, ["unlocked"]= false},                                                                                                                           }



SpellCastedNumber= 0
Attacked= false


CurrentMonster= ""

MonsterDefeated= ""


NumberOfPotions= 3

MusicMuted= false

Mode= "game"



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
    
    
    --go to splash scene first
    --Scene.Change("splash")
    Scene.Change("mainMenu")
end
 
function draw()
    background(0, 0, 0, 255) 
    Scene:Draw()
end
--Touched needed in the main.
function touched(touch)
    Scene.Touched(touch)
end
