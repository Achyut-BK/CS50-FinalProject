WINDOW_WIDTH = 450
WINDOW_HEIGHT = 720

SCREEN_WIDTH_BLOCKS = 10
SCREEN_HEIGHT_BLOCKS = 16

MOVE_SPEED = 100
BLOCK_SIZE = MOVE_SPEED

MOVE_INTERVAL = 0.5
VIRTUAL_WIDTH = SCREEN_WIDTH_BLOCKS * BLOCK_SIZE
VIRTUAL_HEIGHT = SCREEN_HEIGHT_BLOCKS * BLOCK_SIZE

Game_over = false

push = require "push"
Class = require "class"
require 'Block'
require 'Utils'
require 'Tetrominoes'
require 'Map'

function love.load()
	math.randomseed(os.time())
	love.graphics.setDefaultFilter('nearest', 'nearest')
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizeble = false,
		vsync = true
	})
	Timer = 0
    love.keyboard.keysPressed = {}
    map = Map()
--    Tetromino = Tetrominoes(I_Block_positions,1, 0)
end

function love.update(dt)
	Timer = Timer + dt
	if Timer >= MOVE_INTERVAL then 
--		Tetromino:move(0,1)
--		Tetromino:rotate(1)
		map:update()
		Timer = Timer - MOVE_INTERVAL
	end
	love.keyboard.keysPressed = {}
end


function love.draw()
	push:apply('start')
	love.graphics.clear(51/255, 51/255, 153/255)
	map:render()
--	Tetromino:render()
	push:apply('end')
end

function love.keyboard.wasPressed(key)
	return love.keyboard.keysPressed[key]
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'f3' then
    	map:debug()
    end

    love.keyboard.keysPressed[key] = true
end
