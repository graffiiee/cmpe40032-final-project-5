Home = Class{__includes = BaseState}

local positions = {}

function Home:init()
    -- currently selected menu item
    self.currentMenuItem = 1
    -- set the title of our application window
    love.window.setTitle('C.O.E.')
    -- colors we'll use to change the title text
    self.colors = {
        [1] = {100, 50, 50, 255},
        [2] = {25, 50, 150, 255},
        [3] = {50, 100, 25, 255},
        [4] = {100, 50, 150, 255},
        [5] = {100, 50, 25, 255},
        [6] = {100, 50, 50, 255},
        [7] = {25, 50, 150, 255},
        [8] = {50, 100, 25, 255},
        [9] = {100, 50, 150, 255},
        [10] = {100, 50, 25, 255},
        [11] = {100, 50, 50, 255},
        [12] = {25, 50, 150, 255},
        [13] = {50, 100, 25, 255},
        [14] = {100, 50, 150, 255},
        [15] = {100, 50, 25, 255},
        [16] = {100, 50, 50, 255},
        [17] = {25, 50, 150, 255},
        [18] = {50, 100, 25, 255},
        [19] = {100, 50, 150, 255},
        [20] = {100, 50, 25, 255},
    }

    -- letters of CoE and their spacing relative to the center
    self.letterTable = {
        {'C', -340},
        {'H', -304},
        {'R', -268},
        {'O', -232},
        {'N', -196},
        {'I', -160},
        {'C', -124},
        {'L', -88},
        {'E', -52},
        {'S', -16},
        {'O', 30},
        {'F', 66}, 
        {'E', 112},
        {'R', 148},
        {'U', 184},
        {'D', 220},
        {'I', 256},
        {'T', 292},    
        {'E', 328},
        {'S', 364}, 
    }

    -- time for a color change if it's been half a second
    self.colorTimer = Timer.every(0.075, function()
        -- shift every color to the next, looping the last to front
        -- assign it to 0 so the loop below moves it to 1, default start
        self.colors[0] = self.colors[20]

        for i = 20, 1, -1 do
            self.colors[i] = self.colors[i - 1]
        end
    end)


    -- used to animate our full-screen transition rect
    self.transitionAlpha = 0

    -- if we've selected an option, we need to pause input while we animate out
    self.pauseInput = false
end

function Home:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        sounds['transition']:play()
        sounds['menu']:pause()
       

        if self.currentMenuItem == 1 then
            gStateMachine:change('play')
            -- remove color timer from Timer
             self.colorTimer:remove()
        end
        if self.currentMenuItem == 2 then
            gStateMachine:change('instructions')
        end
        if self.currentMenuItem == 3 then
            love.event.quit()
        end
    end
        if  love.keyboard.wasPressed('down') then
            sounds['select']:play()
        self.currentMenuItem = self.currentMenuItem == 1 and 2 or 3 
        
     end

     if  love.keyboard.wasPressed('up') then
        sounds['select']:play()
        self.currentMenuItem = self.currentMenuItem == 3 and 2 or 1 
        
        end


    Timer.update(dt)
    
end

function Home:render()

    

    -- keep the background and tiles a little darker than normal
    love.graphics.setColor(0, 0, 0, 128)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    self:drawcoe(-60)
    self:drawOptions(12)

    -- draw our transition rect; is normally fully transparent, unless we're moving to a new state
    love.graphics.setColor(255, 255, 255, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end

--[[
    Draw the centered COE text with background rect, placed along the Y
    axis as needed, relative to the center.
]]
function Home:drawcoe(y)
    -- draw semi-transparent rect behind CoE
    love.graphics.setColor(255, 255, 255, 128)
   love.graphics.rectangle('fill', 60, VIRTUAL_HEIGHT / 2 + y - 11, 400, 58, 6)

    -- draw CoE text shadows
   -- love.graphics.setFont(flappyFont)
    --self:drawTextShadow('CoE', VIRTUAL_HEIGHT / 2 + y)

    -- print CoE letters in their corresponding current colors
    for i = 1, 20 do
        love.graphics.setColor(self.colors[i])
        love.graphics.printf(self.letterTable[i][1], 0, VIRTUAL_HEIGHT / 2 + y,
            VIRTUAL_WIDTH + self.letterTable[i][2], 'center')
    end
    
    --love.graphics.setFont(flappyFont)
    --love.graphics.printf('C.O.E', 0, 64, VIRTUAL_WIDTH, 'center')

    --love.graphics.setFont(mediumFont)
    --love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')
end
function Home:drawOptions(y)
    -- draw rect behind start and quit game text
    love.graphics.setColor(255, 255, 255, 128)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 95, VIRTUAL_HEIGHT / 2 + y+2, 185, 95, 6)

    -- draw Start text
    love.graphics.setFont(flappyFont)
    self:drawTextShadow('Start', VIRTUAL_HEIGHT / 2 + y + 8)

    if self.currentMenuItem == 1 then
        love.graphics.setColor(99, 155, 255, 255)
    else
        love.graphics.setColor(48, 96, 130, 255)
    end

    love.graphics.printf('Start', 0, VIRTUAL_HEIGHT / 2 + y + 8, VIRTUAL_WIDTH, 'center')


    -- draw Instruction text
    love.graphics.setFont(flappyFont)
    self:drawTextShadow('Instructions', VIRTUAL_HEIGHT / 2 + y + 33)

    if self.currentMenuItem == 2 then
        love.graphics.setColor(99, 155, 255, 255)
    else
        love.graphics.setColor(48, 96, 130, 255)
    end

    love.graphics.printf('Instructions', 0, VIRTUAL_HEIGHT / 2 + y + 33, VIRTUAL_WIDTH, 'center')

    -- draw Quit Game text
    love.graphics.setFont(flappyFont)
    self:drawTextShadow('Quit Game', VIRTUAL_HEIGHT / 2 + y + 58)

    if self.currentMenuItem == 3 then
        love.graphics.setColor(99, 155, 255, 255)
    else
        love.graphics.setColor(48, 96, 130, 255)
    end

    love.graphics.printf('Quit Game', 0, VIRTUAL_HEIGHT / 2 + y + 58, VIRTUAL_WIDTH, 'center')
end

--[[
    Helper function for drawing just text backgrounds; draws several layers of the same text, in
    black, over top of one another for a thicker shadow.
]]
function Home:drawTextShadow(text, y)
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.printf(text, 2, y + 1, VIRTUAL_WIDTH, 'center')
    love.graphics.printf(text, 1, y + 1, VIRTUAL_WIDTH, 'center')
    love.graphics.printf(text, 0, y + 1, VIRTUAL_WIDTH, 'center')
    love.graphics.printf(text, 1, y + 2, VIRTUAL_WIDTH, 'center')
end