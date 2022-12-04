WIDTH, HEIGHT = 1600, 900

-- Class library:
Class = require 'lib/class'
-- OOP:
require 'Bubble'
-- Keyboard and Mouse input:
require 'userInput'
-- Handles the usual love.load() clutter:
require 'functions'

--Global empty array:
bubbles = {}

function love.load()
	-- Handles the usual love.load() clutter:
	setup() --see functions.lua
	
    --Init Objects, single:
		--bubble1 = Bubble(x, y, r)
	
    --Init Objects, multiple similar (Bubble-Objects in bubbles{}-array):
    -- initial bubble count, initial #bubbles:
			   BUBBLE_COUNT_INIT = 0
    for i = 1, BUBBLE_COUNT_INIT do
		-- 2 ways of inserting Bubble (Object) into bubbles (table):
		--table.insert(bubbles, returns_a_new_Bubble()) -- {adding at end, unknown length}
		bubbles[i] = returns_a_new_Bubble() -- {adding at known location}
    end
    
    startTime = love.timer.getTime()
end

function love.update(dt)
	-- love.keyboard.isDown(...) implementation
	keysContinuous() --see "userinput.lua"
---------------------------------------------------
	for _, bubble in ipairs(bubbles) do
		--local x = love.mouse.getX()
		local mouseX, mouseY = love.mouse.getPosition()
		if bubble:contains(mouseX, mouseY) then
			bubble.colorStroke = {1, 0, 0, 1}
		else
			bubble.colorStroke = {1, 1, 1, 1}
		end
	end
	
---------------------------------------------------

-- with using key "i"
	for i, val in pairs(bubbles) do
		--update moves Bubble
		bubbles[i]:update()
	end

-- using value
	for _, bubble in pairs(bubbles) do
		--update moves Bubble
		--bubble:update()
	end
	
	-- Adding a Bubble every N seconds:
	local N = 0.2
	-- time difference between this point and next loop/frame/dt ...??
	deltaTime = love.timer.getTime() - startTime
	if deltaTime >= N then
		--do sth
		startTime = love.timer.getTime() + (deltaTime - 2)
		table.insert(bubbles, returns_a_new_Bubble()) -- {adding at end, unknown length}
	end
end

function love.draw()
		--ommitting "love.graphics.clear(...)"
		--This function is called automatically before love.draw in the default love.run function:
		--love.graphics.clear(0/255, 0, 0, 1)

	-- Background Color:
	local red, green, blue, alpha = 0, 50/255, 50/255, 0.5
	backgroundColor = {red, green, blue, alpha}
	love.graphics.setBackgroundColor(backgroundColor)
		
---------------------------------------------------

	for i in pairs(bubbles) do
		bubbles[i]:draw()
	end
	
----------------------------------------------------

    -- to add strings: use ".."
    -- cast to string: "tostring(not_a_string)"
    love.graphics.setColor(1,0.5,0,1)
    love.graphics.setFont(largeFont)
    love.graphics.printf('#bubbles = ' .. tostring(#bubbles), 0, 20, WIDTH, 'center')
    love.graphics.printf('startTime = ' .. tostring(startTime), 0, 60, WIDTH, 'center')
    love.graphics.printf('deltaTime = ' .. tostring(deltaTime), 0, 100, WIDTH, 'center')
    
end
