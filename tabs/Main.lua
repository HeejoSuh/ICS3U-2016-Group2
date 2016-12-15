-- Main

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is main program for the CPT game



Level= 1
ExpPoints= 0
MoneyHave= 0

MapsUnlocked= {true, false, false, false} --if maps are unlocked or not

CurrentWandNumber= 1
CurrentGameMap= 1
CurrentGameFloor= 1
SpriteEnemies=true

EnemyDefeated= "" --set to nothing
NewFloor= "" --set to nothing



--{["spell name"]= "SpellName", ["power"]=spellAttackPoints(average=20), ["type"]= "GrowTurn", ["spell"]= spellNumbers, ["sprite"]= spellSpriteImage, ["lv"]=levelToUnlock, ["description"]= },                                                        

Spells= {{["spell name"]= "Dividi Bavidiboo", ["power"]= 10, ["type"]= "grow", ["spell"]= "123", ["sprite"]= "Documents:Another Blue Light", ["level"]=1, ["description"]= "this is spell number one"},                                                                                             {["spell name"]= "Abracadabra", ["power"]= 1000, ["type"]= "turn", ["spell"]= "456", ["sprite"]= "Documents:Blue Circle", ["level"]=1, ["description"]= "this is spell number two"},                                                        
}

--{["wand name"]=wandName, ["sprite"]=wandSpriteImage, ["cost"]=cost, ["level"]= LevelToUse},                                                                                             
Wands= {                                                                    {["wand name"]="Beginner's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=0, ["level"]= 1},                                                                                             
{["wand name"]="Intermediate's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=5, ["level"]= 1},                                                                 {["wand name"]="Advanced wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=20, ["level"]= 2},                                                                    {["wand name"]="Expert's wand", ["sprite"]="Cargo Bot:Claw Arm", ["cost"]=40, ["level"]= 3},                                                                                                                         }


--                                                                                                            {['monster name']='NameOfMonster', ['sprite']= spriteImage, ['health']= healthOfMonster(average=80), ['points']= pointOfMonster(average=10), ['speed']= timeItTakesToAttack(average=2.3), ['coins']= numberOfCoins(average=14), ['strength']= attackPower,(average=36), ['floor']= atLeastThisFlooraToSee, ['attack sound']= soundWhenAttacking, ['hurt sound']= soundWhenAttacked},                                                                                                                  
Monsters= {                                                                                                            {['monster name']='NameOfMonster', ['sprite']= "Planet Cute:Character Cat Girl", ['health']= 10, ['points']= 8, ['speed']= 2, ['coins']= 10, ["strength"]= 30, ['floor']= 1, ['attack sound']= "A Hero's Quest:Bottle Break 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                  {['monster name']='NameOfMonster', ['sprite']= "Planet Cute:Character Princess Girl", ['health']= 100, ['points']= 10, ['speed']= 1.8, ['coins']= 5, ['strength']= 20, ['floor']= 1, ['attack sound']= "A Hero's Quest:Bottle Break 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"},                                                                                                                  {['monster name']='NameOfMonster', ['sprite']= "Planet Cute:Character Pink Girl", ['health']= 50, ['points']= 5, ['speed']= 1, ['coins']= 25, ['strength']= 15, ['floor']= 2, ['attack sound']= "A Hero's Quest:Dig 1", ['hurt sound']= "A Hero's Quest:Bottle Break 1"}                                                                                                                                                                                                                              }


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
