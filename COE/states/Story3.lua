Story3 = Class{__includes = BaseState}


function Story3:init()


    textToPrint= "But the king and some of his people \n  were able to escape and they \n wanted to start again and rebuild \n what they lost. The king wants \n to create and mold new \n geniuses and intellectuals."
    printedText=""
    typeTimerMax=0.1
    typeTimer=0.075

    typePosition=0

end


function Story3:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('Story4')
    end

    typeTimer=typeTimer-dt
    if typeTimer<=0 then
        typeTimer= 0.05

        typePosition= typePosition+1
        
        printedText= string.sub(textToPrint,0,typePosition)
    end
end

function Story3:render()

    love.graphics.draw(gBackground['story3'], 0, 0)
-- scale factors on X and Y axis so it fills the screen
    --VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1)
    love.graphics.setFont(maturafont)
love.graphics.print(printedText,40,40)
end
