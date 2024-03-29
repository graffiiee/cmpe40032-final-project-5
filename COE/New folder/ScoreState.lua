--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}
local goldmedal = love.graphics.newImage('gold-medal.png')
local silvermedal = love.graphics.newImage('silver-medal.png')
local bronzemedal = love.graphics.newImage('bronze-medal.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score > 2 and self.score < 5 then
        love.graphics.draw(bronzemedal, VIRTUAL_WIDTH / 2 - 25, VIRTUAL_HEIGHT / 2 - 21)
    end
    
     if self.score > 4 and self.score < 10 then
        love.graphics.draw(silvermedal, VIRTUAL_WIDTH / 2 - 25, VIRTUAL_HEIGHT / 2 - 21)
    end

     if self.score > 9 then
        love.graphics.draw(goldmedal, VIRTUAL_WIDTH / 2 - 25, VIRTUAL_HEIGHT / 2 - 21)
     end

    love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')
end