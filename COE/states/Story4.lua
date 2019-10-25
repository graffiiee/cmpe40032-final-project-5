Story4 = Class{__includes = BaseState}


function Story4:init()


    textToPrint= "And you! You are the chosen one! \n Do you have what it takes to \n be called an Erudite and be \n part of the kingdom? \n Test your knowledge and skills! \n \n This is the Chronicles of Erudites."
    printedText=""
    typeTimerMax=0.1
    typeTimer=0.1

    typePosition=0

end


function Story4:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        sounds['story']:stop()
        sounds['menu']:setLooping(true)
        sounds['menu']:play()
        gStateMachine:change('home')
    end

    typeTimer=typeTimer-dt
    if typeTimer<=0 then
        typeTimer= 0.05

        typePosition= typePosition+1
        
        printedText= string.sub(textToPrint,0,typePosition)
    end
end

function Story4:render()

    love.graphics.draw(gBackground['story4'], 0, 0)
-- scale factors on X and Y axis so it fills the screen
    --VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1)
    love.graphics.setFont(maturafont)
love.graphics.print(printedText,40,20)
end
