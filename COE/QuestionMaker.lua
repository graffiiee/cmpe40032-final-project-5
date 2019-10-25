QuestionMaker = Class{}

push = require 'push'

Class = require 'class'

local utf8 = require("utf8")

-- size of our actual window
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- size we're trying to emulate with push
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


--ALL THE QUESTIONS AND ANSWERS
chosenquestion = 0
done={false,false,false,false,false,false,false,false,false,false}
answer={"C","RESISTOR","ABC","VIRUS","FALSE","AMPERE","PASSWORD","TRUE","0",">>"}
question={"WHAT PROGRAMMING LANGUAGE DID DENNIS RITCHIE CREATE?","WHAT ELECTRICAL COMPONENT REDUCES THE CURRENT FLOW OF ELECTRIC CURRENT?","WHAT IS THE HEXADECIMAL VALUE OF THE BINARY '101010111100'?","IT IS A POTENTIALLY DAMAGING COMPUTER PROGRAM THAT CAN SPREAD AND DAMAGE FILES","TRUE OR FALSE: IS PRINTER AN INPUT DEVICE?","WHAT IS THE SI UNIT FOR CURRENT?","IT IS A STRING OF CHARACTERS USED TO VERIFY THE IDENTITY OF A USER DURING THE AUTHENTICATION PROCESS?","TRUE OR FALSE: IS 1 HORSEPOWER EQUAL TO 745.7 WATTS ?","WHAT IS THE OUTPUT: ((2*6)^1) % 3","COMPLETE THE C++ CODE : cin__username;"}
text = ""
function QuestionMaker:init()
    -- set love's default filter to "nearest-neighbor", which essentially
    -- means there will be no filtering of pixels (blurriness), which is
    -- important for a nice crisp, 2D look
    love.graphics.setDefaultFilter('nearest', 'nearest')

   
    math.randomseed(os.time())

    -- initialize our nice-looking retro text fonts
    smallFont = love.graphics.newFont('font.ttf', 8)
    largeFont = love.graphics.newFont('font.ttf', 16)
    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(smallFont)

    -- set up our sound effects; later, we can just index this table and
    -- call each entry's `play` method
    sounds = {
       
    }
    
    -- initialize our virtual resolution, which will be rendered within our
    -- actual window no matter its dimensions
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
        canvas = false
    })

    
end



function QuestionMaker:render()
    

    questionMaker()
    love.graphics.clear(40, 45, 52, 255)
    if time<30 then
        love.graphics.setColor(255, 165, 0)
        special['time']:play()
        if time<29.3 then
            special['time']:stop()
        end
    end
    if time<10 then
        love.graphics.setColor(255, 0, 0)
        special['time']:play()
        if time<9.3 then
            special['time']:stop()
        end
    end
    love.graphics.draw(gBackground['gamebackground'], 0, 0)
    love.graphics.setFont(mediumFont)
    love.graphics.printf(question[chosenquestion], 0, 50, VIRTUAL_WIDTH, 'center')
       

    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, 0, 83, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('____________________________________',0,87, VIRTUAL_WIDTH, 'center')
   
    


  
end


function questionMaker()

    if chosenquestion == 0 then
     math.randomseed(os.time())
     ::again::
     chosenquestion= math.random( 1,10 )
     if done[1]==true and done[2] == true and done[3] == true and done[4]==true and done[5]==true and done[6]==true and done[7]==true and done[8]==true and done[9]==true  and done[10]==true then
        goto finish

      else
                if done[chosenquestion] == true then
                 goto again
                end
      end
      ::finish::
    end
   
end