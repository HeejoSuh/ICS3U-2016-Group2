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



Maps= {                                                                                                      {["floor"]= 1, ["unlocked"]= true},                                                                              {["floor"]=2, ["unlocked"]= false},                                                                              {["floor"]= 30, ["unlocked"]= false},                                                                                                                                                        {["floor"]= 100, ["unlocked"]= false},                                                                              }

--{["spell name"]= "SpellName", ["power"]=spellAttackPoints(average=20), ["type"]= "GrowTurn", ["spell"]= {spellNumbers}, ["sprite"]= spellSpriteImage, ["lv"]=levelToUnlock, ["description"]= },                                                        

Spells= {{["spell name"]= "Dividi Bavidiboo", ["power"]= 10, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Documents:Another Blue Light", ["level"]=1, ["description"]= "this is spell number one"},                                                                                             {["spell name"]= "Abracadabra", ["power"]= 1000, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "Documents:Blue Circle", ["level"]=1, ["description"]= "this is spell number two"},                                                        
}

--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=0, ["level"]= 1},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=5, ["level"]= 1},                                                                 {["wand name"]="Advanced wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=20, ["level"]= 2},                                                                    {["wand name"]="Expert's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=40, ["level"]= 3},                                                                                                                         }


SpellCastedNumber= 0
Attacked= false


CurrentMonster= ""

MonsterDefeated= ""


NumberOfPotions= 3

MusicMuted= false

Mode= "game"



function setup()
    supportedOrientations(PORTRAIT)
    displayMode(FULLSCREEN)
	noFill()
	noSmooth()
	noStroke()
	pushStyle()
    
    
    if MusicMuted==false then
        music("Dropbox:GameBgm", true, 0.85)
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
    Scene.Change("splash")
end
 
function draw()
    background(0, 0, 0, 255) 
    Scene:Draw()
end
--Touched needed in the main.
function touched(touch)
    Scene.Touched(touch)
end
