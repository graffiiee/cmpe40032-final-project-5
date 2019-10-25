End = Class{__includes = BaseState}


last = false
winner = false
lose = false
down = 0
function End:init()
    
  love.window.setTitle('C.O.E')
 
 
end


function End:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
       love.event.quit()
    end
    
    if love.keyboard.wasPressed('f') then
        last = true
        special['victory']:pause()
        special['boss']:setLooping(true)
        special['boss']:play()
       
    end
   if last == true then
       if love.keyboard.wasPressed('3') then
        special['boss']:pause()
        special['finalwin']:play()
        gStateMachine:change('victory')
       

       elseif love.keyboard.wasPressed('1') or love.keyboard.wasPressed('2') or love.keyboard.wasPressed('4') or love.keyboard.wasPressed('5') or love.keyboard.wasPressed('6') or love.keyboard.wasPressed('7') or love.keyboard.wasPressed('9') or love.keyboard.wasPressed('8') or love.keyboard.wasPressed('0') then
        special['boss']:pause() 
        special['finallose']:play()
        gStateMachine:change('defeat')
       end
    end
end

function End:render()

displayVictory()
special['victory']:setLooping(true)
special['victory']:play()

  if last == true then
    love.graphics.setColor(0, 0, 0)
    special['victory']:pause()
    love.graphics.setFont(mediumFont)
    love.graphics.printf('WHAT IS THE OUTPUT IN THIS PROGRAM ?', 0, 21, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(smallFont)
    love.graphics.setColor(255, 0, 0)
    love.graphics.printf('CLUE: THE ANSWER IS FROM 0-9, JUST PRESS THE NUMBER OF YOUR ANSWER', 0, 41, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(gBackground['boss'], 93, 60) 


  end

  

 
end



function displayVictory()
    love.graphics.clear(40, 45, 52, 255)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(gBackground['congrats'], 0, 0)
    showcongrats()
    love.graphics.setFont(mediumFont)
    love.graphics.setColor(0, 255, 255)
    love.graphics.printf('PRESS    TO TAKE THE FINAL CHALLENGE!!', 0, 150, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('OR', 0, 170, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('PRESS        OR         TO LEAVE THE GAME', 0, 190, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 0)
    love.graphics.printf('F', -82, 150, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('ENTER', -80, 190, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('ESCAPE', -15, 190, VIRTUAL_WIDTH, 'center')

end

function showcongrats()

  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.setFont(cinemafont)
  love.graphics.printf('CONGRATULATIONS!!!', 0, 55, VIRTUAL_WIDTH, 'center')
  love.graphics.setFont(mediumFont)
  love.graphics.setColor(0, 0, 0)
  love.graphics.printf('YOU PROVED YOURSELF TO BECOME AN ERUDITE', 0, 93, VIRTUAL_WIDTH, 'center')
end




