Story2 = Class{__includes = BaseState}


function Story2:init()


    textToPrint= "But it took only one day to change \n their lives. War began when people \n from another land attacked the kingdom. \n They fought and clashed with each other. \n But the ones who emerged victorious \n were the assailants. \n The Erudite Kingdom has now fallen."
    printedText=""
    typeTimerMax=0.1
    typeTimer=0.1

    typePosition=0

end


function Story2:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('Story3')
    end

    typeTimer=typeTimer-dt
    if typeTimer<=0 then
        typeTimer= 0.05

        typePosition= typePosition+1
        
        printedText= string.sub(textToPrint,0,typePosition)
    end
end

function Story2:render()

    love.graphics.draw(gBackground['story2'], 0, 0)
-- scale factors on X and Y axis so it fills the screen
    --VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1)
    love.graphics.setFont(maturafont)
love.graphics.print(printedText,40,20)
end
