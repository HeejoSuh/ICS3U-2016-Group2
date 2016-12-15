-- Settings

--Created by: Heejo Suh
-- Created on: Dec 2016
-- Created for: ICS3U
-- This is the settings scene

SettingsScene = class()

local backButton

local musicOnButton
local onOffWords

local currentLevel
local currentExpPoints
local needExpPoints
local expGage

function SettingsScene:init()
    -- you can accept and set parameters here
    backButton= BackButton()
    
    musicOnButton= Button("Planet Cute:Brown Block", vec2(4*WIDTH/7, HEIGHT/1.8))
    if MusicMuted==false then
        onOffWords= "On"
    else
        onOffWords= "Off"
    end
    

    --level
    currentLevel= math.tointeger(Level)
    currentExpPoints= math.tointeger(ExpPoints)
    needExpPoints= currentLevel*350 
    
    newLevel()
    
    expGage= GageBar(ExpPoints, needExpPoints, vec2(WIDTH/4, HEIGHT/1.5), color(94, 148, 27, 255), WIDTH/2)
end

function SettingsScene:draw()
    -- Codea does not automatically call this method
    background(122, 30, 30, 255)
    backButton:draw()
    
    musicOnButton:draw()
    fill(0, 0, 0, 255)
    font("Papyrus-Condensed")
    textWrapWidth(WIDTH/1.4)
    fontSize(WIDTH/20)
    text(onOffWords, 4*WIDTH/7, HEIGHT/1.8)
    text("Music:", 3*WIDTH/7, HEIGHT/1.8)
    
    --level
    fill(0, 0, 0, 220)
    font("Papyrus-Condensed")
    textWrapWidth(WIDTH/1.4)
    fontSize(WIDTH/18)
    text("Lv."..Level, WIDTH/2, HEIGHT/1.3)
    
    --exp points
    expGage:draw()
    
    --credits
    matrix()
    fill(7, 7, 6, 220)
    font("AmericanTypewriter")
    textWrapWidth(WIDTH/1.1)
    fontSize(WIDTH/27)
    textMode(CENTER)
    text("CREDITS:\n\nDesigned by: Heejo Suh\nProgrammed by: Heejo Suh\nMusic:Hyunjo Suh\nArtwork by: Heejo Suh", WIDTH/2, HEIGHT/4.5)
    popMatrix()
end

function SettingsScene:touched(touch)
    -- Codea does not automatically call this method
    backButton:touched(touch)
    
    musicOnButton:touched(touch)
    if musicOnButton.selected== true then
        if onOffWords== "On" then
            onOffWords= "Off"
            MusicMuted= true
            music.muted= true
        else
            onOffWords= "On"
            MusicMuted= false
            music.muted= false
        end
        saveLocalData("music on", musicMuted)
    end
end

function newLevel()
    --check if there needs to be a new level
    repeat
        currentLevel= currentLevel+1
        saveLocalData("lv", currentLevel)
        currentExpPoints= currentExpPoints- needExpPoints
        saveLocalData("exp points", currentExpPoints)
    until needExpPoints > ExpPoints
end
