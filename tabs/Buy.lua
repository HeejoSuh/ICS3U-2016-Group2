Buy = class()

local showWords
local item

local okayButton
local yesButton
local noButton

local buyMode


function Buy:init(itemInfoNumber)
    -- you can accept and set parameters here
    item= Wands[itemInfoNumber]
    itemNumber= itemInfoNumber
    
    showWords= "Do You want to unlock the "..item["wand name"].." for "..tostring(item["cost"]).." coins?"
    
    
    okayButton= Button("Platformer Art:Block Brick", vec2(WIDTH/2, HEIGHT/3))
    yesButton= Button("Platformer Art:Block Grass", vec2(2*WIDTH/8, HEIGHT/3))
    noButton= Button("Platformer Art:Block Brick", vec2(6*WIDTH/8, HEIGHT/3))
    
    
    
    
    buyMode= "ask"
end

function Buy:draw()
    -- Codea does not automatically call this method
    --pop up
    sprite("Platformer Art:Block Brick", WIDTH/2, HEIGHT/2, WIDTH/1.3, HEIGHT/1.7) 
    
    fill(7, 7, 6, 220)
    font("Papyrus-Condensed")
    textWrapWidth(WIDTH/1.7)
    textMode(CENTER)
    
    fontSize(WIDTH/22)
    text(showWords, WIDTH/2, HEIGHT/1.7)
    
    if buyMode=="ask" then
        yesButton:draw()
        noButton:draw()
        text("Yes", 2*WIDTH/8, HEIGHT/3)
        text("No", 6*WIDTH/8, HEIGHT/3)
    elseif buyMode=="showing okay" then
        print("Work")
        okayButton:draw()
        fontSize(WIDTH/24)
        text("Okay", WIDTH/2, HEIGHT/3)
    end
end

function Buy:touched(touch)
    -- Codea does not automatically call this method
    yesButton:touched(touch)
    if yesButton.selected==true then
        sound("Game Sounds One:Reload 2")
        print("Yes button seleted")
        check()
    end
    noButton:touched(touch)
    okayButton:touched(touch)
    if noButton.selected==true then
        sound("Game Sounds One:Reload 2")
        print("no button selected")
        buyMode= "done" --end popup
    end
    if okayButton.selected==true then
        sound("Game Sounds One:Reload 2")
        print("okay button selected")
        buyMode= "done" --end popup
    end
end

function Buy:done()
    -- check if its done or not
    if buyMode=="done" then
        print("Delete popup")
        return true
    else
        return false
    end
end

function check()
    --check if user is allowed to purchase
    print("Checking if can buy")
    
    if Level>= tonumber(item["level"]) then
        --if right level
        if MoneyHave>= tonumber(item["cost"]) then
            --if enough money
            Wands[itemNumber]["unlocked"]=true
            MoneyHave= MoneyHave-tonumber(item["cost"])
            CurrentWandNumber= itemNumber
            
            showWords= "Purchase complete!"
            buyMode= "showing okay"
            
            print("Bought")
        else
            showWords= "You don't have enough money"
            buyMode= "showing okay"
            
            print("No money")
        end
    else
        showWords= "You need to be at least level "..tostring(item["level"]).." to unlock this wand"
        buyMode= "showing okay"
        print("No level")
    end
end
