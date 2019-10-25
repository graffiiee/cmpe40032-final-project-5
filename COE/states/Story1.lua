Story1 = Class{__includes = BaseState}


function Story1:init()

    sounds['story']:setLooping(true)
    sounds['story']:play()

    textToPrint="Once upon a time, a faraway land \n called Erudite Kingdom existed. \n It was a realm full of intellectuals \n and geniuses. The citizens battle with \n each other everyday to develop \n their knowledge and skills."
    printedText=""
    typeTimerMax=0.1
    typeTimer=0.1

    typePosition=0

end


function Story1:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('Story2')
    end

    typeTimer=typeTimer-dt
    if typeTimer<=0 then
        typeTimer= 0.05

        typePosition= typePosition+1
           
        printedText= string.sub(textToPrint,0,typePosition)
    end
end

function Story1:render()

    love.graphics.draw(gBackground['story1'], 0, 0)
-- scale factors on X and Y axis so it fills the screen
    --VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1)
    love.graphics.setFont(maturafont)
love.graphics.print(printedText,40,40)
end
