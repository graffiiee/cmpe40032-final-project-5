Instructions = Class{__includes = BaseState}


function Instructions:init()
 

end


function Instructions:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        sounds['instructions']:stop()
        sounds['menu']:play()
        gStateMachine:change('home')
    end
        
end

function Instructions:render()
    sounds['instructions']:play()
    InstructionsShow()
end



function InstructionsShow()
    love.graphics.clear(40, 45, 52, 255)
    love.graphics.draw(gBackground['instruction'], 0, 0)
    love.graphics.setFont(largeFont)
    love.graphics.setColor(255, 255, 0)
    love.graphics.printf('CAUTION!!', 0, 10, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(mediumFont)
    love.graphics.printf('PLEASE MAKE SURE THE CAPS LOCK IS ON', 0, 61, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 0)
    love.graphics.printf('CONTROLS:', -203, 82, VIRTUAL_WIDTH, 'center')
    
    --SPACEBAR
    love.graphics.setColor(0, 255, 255)
    love.graphics.printf('SPACEBAR:', -203, 100, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('CLEARS THE ANSWER FIELD', -77, 100, VIRTUAL_WIDTH, 'center')
    --BACKSPACE
    love.graphics.setColor(0, 255, 255)
    love.graphics.printf('BACKSPACE:', -199, 118, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('REMOVES THE LAST LETTER OF YOUR ANSWER', -7, 118, VIRTUAL_WIDTH, 'center')
    --ENTER
    love.graphics.setColor(0, 255, 255)
    love.graphics.printf('ENTER:', -215, 136, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('CONFIRMS YOUR ANSWER', -105, 136, VIRTUAL_WIDTH, 'center')
    --NOTE
    love.graphics.setColor(255, 255, 0)
    love.graphics.printf('NOTE:', -218, 172, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('ALL THE ANSWERS IN THE GAME ARE ONE-WORD & WHOLE NUMBERS ONLY', -4, 190, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 255, 0)
    love.graphics.printf('CORRECT', -180, 208, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 0, 0)
    love.graphics.printf('WRONG', -96, 208, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf('ONCE            OR          APPEARS JUST WAIT IT TO DISAPPEAR', -32, 208, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0)
    love.graphics.printf('PRESS ENTER TO RETURN TO MAIN MENU', 0, 244, VIRTUAL_WIDTH, 'center')

end