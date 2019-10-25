
push = require 'push'

Class = require 'class'


require 'StateMachine'
require 'states/PlayState'
require 'states/Home'
require 'states/End'
require 'states/Gameover'
require 'states/Instructions'
require 'states/Story1'
require 'states/Story2'
require 'states/Story3'
require 'states/Story4'
require 'QuestionMaker'
require 'states/Victory'
require 'states/Defeat'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

correct = 0

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    math.randomseed(os.time())
    love.window.setTitle('C.O.E.')

    -- FONTSSS
    smallFont = love.graphics.newFont('font.ttf', 8)
    mediumFont = love.graphics.newFont('flappy.ttf', 14)
    flappyFont = love.graphics.newFont('flappy.ttf', 28)
    largeFont = love.graphics.newFont('flappy.ttf', 56)
    hugefont = love.graphics.newFont('flappy.ttf', 73)
    cinemafont = love.graphics.newFont('fonts/cinema.ttf', 28)
    ardarlingfont = love.graphics.newFont('fonts/ARDARLING.ttf', 28) 
    maturafont = love.graphics.newFont('fonts/matura.TTF', 24)
    love.graphics.setFont(flappyFont)


    -- initialize our virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
    --SOUNDSSSSS
    sounds = {
        ['menu'] = love.audio.newSource('audios/menu_music.mp3'),
        ['story'] = love.audio.newSource('audios/storymusic.mp3'),
        ['select'] = love.audio.newSource('audios/select.wav'),
        ['gameover'] = love.audio.newSource('audios/gameover.wav'),
        ['transition'] = love.audio.newSource('audios/transition.wav'),
        ['playstate'] = love.audio.newSource('audios/playstate.mp3'),
        ['correct'] = love.audio.newSource('audios/correct.mp3'),
        ['wrong'] = love.audio.newSource('audios/wrong.mp3'),
        ['instructions'] = love.audio.newSource('audios/instructions.mp3') 
        
    }
    -- SPECIAL TREATMENT PARA GUMANA
    special = {
        ['playstate'] = love.audio.newSource('audios/playstate.mp3'),
        ['finalwin'] = love.audio.newSource('audios/finalwin.mp3'),
        ['finallose'] = love.audio.newSource('audios/finallose.mp3'),
        ['boss'] = love.audio.newSource('audios/boss.mp3'),
        ['victory'] = love.audio.newSource('audios/victory.mp3'),
        ['time'] = love.audio.newSource('audios/time.wav')
    }
    

    gBackground = {
        ['boss'] = love.graphics.newImage('backgrounds/boss.png'),

        ['home'] = love.graphics.newImage('backgrounds/home2.jpg'),
        ['gameover'] = love.graphics.newImage('backgrounds/gameover.jpg'),        
        ['story1'] = love.graphics.newImage('backgrounds/story1.png'),
        ['story2'] = love.graphics.newImage('backgrounds/story2.png'),
        ['story3'] = love.graphics.newImage('backgrounds/b3converted.jpg'),
        ['story4'] = love.graphics.newImage('backgrounds/b2converted.jpg'),
        ['gamebackground'] = love.graphics.newImage('backgrounds/playbg.jpg'),
        ['green'] = love.graphics.newImage('backgrounds/green2.png'),
        ['red'] = love.graphics.newImage('backgrounds/red.png'),
        ['particle'] = love.graphics.newImage('backgrounds/particle.png'),
        ['congrats'] = love.graphics.newImage('backgrounds/congrats.jpg'),
        ['instruction'] = love.graphics.newImage('backgrounds/instruction.jpg'),
    }
    -- initialize state machine with all state-returning functions
    gStateMachine = StateMachine {
        ['home'] = function() return Home() end,
        ['play'] = function() return PlayState() end,
        ['end'] = function() return End() end,
        ['victory'] = function() return Victory() end,
        ['defeat'] = function() return Defeat() end,
        ['gameover'] = function() return Gameover() end,
        ['instructions'] = function() return Instructions() end,
        ['Story1'] = function() return Story1() end,
        ['Story2'] = function() return Story2() end,
        ['Story3'] = function() return Story3() end,
        ['Story4'] = function() return Story4() end,
    }
    gStateMachine:change('Story1')

    -- initialize input table
    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end

    
end



function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
    
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    love.graphics.draw(gBackground['home'], 0, 0)
    gStateMachine:render()
    push:finish()
end