PlayState = Class{__includes = BaseState}


local utf8 = require("utf8")
Timer = require 'knife.timer'


time = 60
display = 1

nextquestion = false
correctappear = false
wrongappear = false
chosenquestion = 0

done={false,false,false,false,false,false,false,false,false,false}
answer={"C","RESISTOR","ABC","VIRUS","FALSE","AMPERE","PASSWORD","TRUE","0",">>"}
question={"WHAT PROGRAMMING LANGUAGE DOES DENNIS RITCHIE CREATED?","WHAT ELECTRICAL COMPONENT REDUCES THE CURRENT FLOW OF ELECTRIC CURRENT?","WHAT IS THE HEXADECIMAL VALUE OF THE BINARY '101010111100'?","IT IS A POTENTIALLY DAMAGING COMPUTER PROGRAM THAT CAN SPREAD AND DAMAGE FILES","TRUE OR FALSE: IS PRINTER AN INPUT DEVICE?","WHAT IS THE SI UNIT FOR CURRENT?","IT IS A STRING OF CHARACTERS USED TO VERIFY THE IDENTITY OF A USER DURING THE AUTHENTICATION PROCESS?","TRUE OR FALSE: IS 1 HORSEPOWER EQUAL TO 745.7 WATTS ?","WHAT IS THE OUTPUT: ((2*6)^1) % 3","COMPLETE THE C++ CODE : cin__username;"}
text = ""
function PlayState:init()
    -- physical screen dimensions
    WINDOW_WIDTH = 1280
    WINDOW_HEIGHT = 720

-- virtual resolution dimensions
    VIRTUAL_WIDTH = 512
    VIRTUAL_HEIGHT = 288
  
    self.question = QuestionMaker()
    
    self.displaytime = false

    -- set the title of our application window
    love.window.setTitle('PLAY')
    --TEXTURES
 

    -- seed the RNG so that calls to random are always random
    math.randomseed(os.time())

    --function decrement() 
    --    time = time - 1
   -- end
    --Timer.every(1,decrement)
    
    music = love.audio.newSource('audios/playstate.mp3')
    right = love.audio.newSource('audios/correct.mp3')
    wrong = love.audio.newSource('audios/wrong.mp3')
    special['playstate']:play()
end


function PlayState:update(dt)
   
    time = time - dt

    if self.displaytime == true then
        
    display = display - dt 
    end


    --TIME EXPIRES
   if time < 0 then
    self.displaytime = true
    wrongappear = true
   end

    --EDIT ANSWER
   if love.keyboard.wasPressed('backspace') then
    local last_input = string.sub(text,-1)
    text = string.gsub(text,last_input,"",1) 
    end

    --CLEAR ANSWER AREA
   if love.keyboard.wasPressed('space') then
    text = " "
    end

    --CHECK ANSWER
   if love.keyboard.wasPressed('return') then
   self.displaytime = true

    if text==answer[chosenquestion] then
        correct = correct + 1
      correctappear=true
      else
        wrongappear = true
      end
    end

    --NEXT QUESTION
    if nextquestion == true then

--RESET EVERYTHING
time = 60
display = 1
nextquestion = false
correctappear = false
chosenquestion = 0
text = ""
        gStateMachine:change('play')
    end


    

    --VICTORY
    if done[1]==true and done[2] == true and done[3] == true and done[4]==true and done[5]==true and done[6]==true and done[7]==true and done[8]==true and done[9]==true  and done[10]==true then
        special['playstate']:pause()
        gStateMachine:change('end')
       
    end
  
end

--[[
    A callback that processes key strokes as they happen, just the once.
    Does not account for keys that are held down, which is handled by a
    separate function (`love.keyboard.isDown`). Useful for when we want
    things to happen right away, just once, like when we want to quit.
]]
function love.textinput(t)
    text = text .. t
end




function PlayState:render()
   
  --  if time > 0  then
   -- self.question:render()
   -- end
   
   
    
  
    self.question:render()
    displayFPS()
    if correctappear == true  then
        displayCorrect()
        right:play()
    end

    if wrongappear == true then
         special['playstate']:pause()
        displayWrong()
        wrong:play()
    end
    
    
      
    
   

    -- display FPS for debugging; simply comment out to remove
 

    
end

--[[
    Simple function for rendering the scores.
]]
function displayScore()
    -- score display
   
    love.graphics.setFont(smallFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50,
        VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30,
        VIRTUAL_HEIGHT / 3)
end

--[[
    Renders the current FPS.
]]
function displayFPS()
    
    -- simple FPS display across all states
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
    love.graphics.setColor(255, 255, 0)
    if time >0 then
    love.graphics.setFont(flappyFont)
    love.graphics.print(string.format("%.2f", time), 420, 11)
    end
    --love.graphics.print('Time:  ' .. display, 380, 25)
   -- love.graphics.print('question:  ' .. chosenquestion, 380, 35)
    --love.graphics.print('DONE:  ' .. tostring(done[chosenquestion]), 380, 45)
   -- love.graphics.print('Score:  ' .. correct, 380, 55)
    love.graphics.setColor(255, 255, 255, 255)
 
end



function displayWrong()
    love.graphics.clear(40, 45, 52, 255)
    --WRONG SOUND
    love.graphics.draw(gBackground['red'], 0, 0)
    love.graphics.setFont(hugefont)
    love.graphics.setColor(255, 0, 0)
    love.graphics.printf('WRONG', 0, 100, VIRTUAL_WIDTH, 'center')
    if display < 0 then
        gStateMachine:change('gameover')
      end

end

function displayCorrect()
    love.graphics.clear(40, 45, 52, 255)
    --CORRECT SOUND 
    love.graphics.setFont(hugefont)
    love.graphics.draw(gBackground['green'], 0, 0)
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.printf('CORRECT', 0, 100, VIRTUAL_WIDTH, 'center')
    
    if display < 0 then
       
        done[chosenquestion] = true
        nextquestion = true
    end

end




