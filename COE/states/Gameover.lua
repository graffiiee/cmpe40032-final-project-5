Gameover = Class{__includes = BaseState}


function Gameover:init()
  
    love.window.setTitle('C.O.E')
end


function Gameover:update(dt)
    
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
       love.event.quit()
    end
        
end
function Gameover:render()

displayGameover()
special['finallose']:play()

end

function displayGameover()
    love.graphics.clear(40, 45, 52, 255)
    love.graphics.draw(gBackground['gameover'], 0, 0)
    love.graphics.setFont(largeFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('GAMEOVER!!!', 0, 80, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('THANKS FOR PLAYING!', 0, 100, VIRTUAL_WIDTH, 'center')
    love.graphics.print('YOUR SCORE IS :  ' .. correct, 160, 120)

    if correct < 2 and correct > -1 then
        love.graphics.print('YOU HAVE BEEN AWARDED OF THE RANK VISCOUNT. \n TRY HARDER IF YOU WANT TO BE THE KING!', 70, 160)
    end
    if correct < 4 and correct > 1 then
        love.graphics.print('YOU HAVE BEEN AWARDED OF THE RANK EARL. \n TRY HARDER IF YOU WANT TO BE THE KING!', 80, 160)
    end
    if correct < 6 and correct > 3 then
        love.graphics.print('YOU HAVE BEEN AWARDED OF THE RANK MARQUESS. \n TRY HARDER IF YOU WANT TO BE THE KING!', 70, 160)
    end
    if correct < 8 and correct > 5 then
        love.graphics.print('YOU HAVE BEEN AWARDED OF THE RANK DUKE. \n TRY HARDER IF YOU WANT TO BE THE KING!', 80, 160)
    end
    if correct < 10 and correct > 7 then
        love.graphics.print('YOU HAVE BEEN AWARDED OF THE RANK PRINCE. \n YOU ARE A STEP AWAY FROM BEING THE KING!', 80, 160)
    end

end