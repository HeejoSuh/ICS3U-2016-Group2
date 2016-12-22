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
ExpNeedAmount= 350

GoBackTo= ""



Maps= {                                                                                                      {["floor"]= 1, ["unlocked"]= true},                                                                              {["floor"]=2, ["unlocked"]= false},                                                                              {["floor"]= 30, ["unlocked"]= false},                                                                                                                                                        {["floor"]= 100, ["unlocked"]= false},                                                                              }

--{["spell name"]= "SpellName", ["power"]=spellAttackPoints(average=15), ["type"]= "GrowTurn", ["spell"]= {spellNumbers}, ["sprite"]= spellSpriteImage, ["lv"]=levelToUnlock, ["description"]= },                                                        

Spells= {{["spell name"]= "Dividi Bavidiboo", ["power"]= 5, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Cargo Bot:Smoke Particle", ["level"]=1, ["description"]= "this is spell number one"},                                                                                             {["spell name"]= "Abracadabra", ["power"]= 1000, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "SpaceCute:Collision Circle", ["level"]=1, ["description"]= "this is spell number two"},                                                        
{["spell name"]= "Boop", ["power"]= 30, ["type"]= "grow", ["spell"]= "123654789", ["sprite"]= "Cargo Bot:Smoke Star", ["level"]=2, ["description"]= "this is spell number three"},                                  }


--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=0, ["level"]= 1, ["unlocked"]= true},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=100, ["level"]= 2, ["unlocked"]= false},                                                                     {["wand name"]="Advanced wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=500, ["level"]= 5, ["unlocked"]= false},                                                                     {["wand name"]="Expert's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=1000, ["level"]= 10, ["unlocked"]= false},                                                                                                                           }



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
        music.muted= true
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
