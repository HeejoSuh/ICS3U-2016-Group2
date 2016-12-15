-- Main

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is main program for the CPT game



Level= 1
ExpPoints= 0
MoneyHave= 0


CurrentWandNumber= 1

CurrentGameMap= 1
CurrentGameFloor= 1
CurrentMonsters= {}
CurrentMonster= {}
CurrentMonsterOrgHealth= 0

Attacked= false

EnemyDefeated= "" --set to nothing
NewFloor= false


Maps= {                                                                                                      {["map name"]= "A1", ["floor"]= 1, ["unlocked"]= true},                                                                              {["map name"]= "A2", ["floor"]= 20, ["unlocked"]= false},                                                                              {["map name"]= "A3", ["floor"]= 40, ["unlocked"]= false},                                                                                                                                                        {["map name"]= "B1", ["floor"]= 70, ["unlocked"]= false},                                                                              }


--{["spell name"]= "SpellName", ["power"]=spellAttackPoints(average=20), ["type"]= "GrowTurn", ["spell"]= spellNumbers, ["sprite"]= spellSpriteImage, ["lv"]=levelToUnlock, ["description"]= },                                                        

Spells= {{["spell name"]= "Dividi Bavidiboo", ["power"]= 10, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Documents:Another Blue Light", ["level"]=1, ["description"]= "this is spell number one"},                                                                                             {["spell name"]= "Abracadabra", ["power"]= 1000, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "Documents:Blue Circle", ["level"]=1, ["description"]= "this is spell number two"},                                                        
}

--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=0, ["level"]= 1},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=5, ["level"]= 1},                                                                 {["wand name"]="Advanced wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=20, ["level"]= 2},                                                                    {["wand name"]="Expert's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=40, ["level"]= 3},                                                                                                                         }


SpellCasted= ""
Attacked= false

UserHealth= 100
CurrentMonster= ""
CurrentMonsterHealth= 0


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
        music("Game Music One:Smoothie", true, 0.7)
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
