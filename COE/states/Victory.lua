Victory = Class{__includes = BaseState}

function Victory:init()

    textToPrint= "Congratulations! You were able to overcome the Final \n Challenge and you are now worthy to \n be called the King of Erudites!"
    printedText=""
    typeTimerMax=0.1
    typeTimer=0.075

    typePosition=0

end


function Victory:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
       love.event.quit()
    end

    typeTimer=typeTimer-dt
    if typeTimer<=0 then
        typeTimer= 0.05

        typePosition= typePosition+1
        
        printedText= string.sub(textToPrint,0,typePosition)
    end
end

function Victory:render()
    
    love.graphics.draw(gBackground['congrats'], 0, 0)
    love.graphics.setColor(255, 0, 0)
-- scale factors on X and Y axis so it fills the screen
    --VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1)
    love.graphics.setFont(maturafont)
    
love.graphics.print(printedText,40,40)
love.graphics.setFont(ardarlingfont)
love.graphics.printf('THANKS FOR PLAYING', 0, 170, VIRTUAL_WIDTH, 'center')
end
