-- Handles the usual love.load() clutter:
function setup()
    -- Window title:
    love.window.setTitle('Bubbles')
    -- No pixel-smoothing:
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- Window-setup:
    love.window.setMode(WIDTH, HEIGHT, {
        fullscreen = false, resizable = false, vsync = true})
    --Randomise math.random(): select different seed per each runtime:
    math.randomseed(os.time())
    -- Font setup:
    smallFont = love.graphics.newFont('fonts/04b03.ttf', 8)
    largeFont = love.graphics.newFont('fonts/04b03.ttf', 32)
		--No font selection here (fonts should be selected before each print):
		--love.graphics.setFont(smallFont)
end

-- Creates and returns 1 Bubble Object:
function returns_a_new_Bubble()
	-- Initialising Bubble parameters:
	x = math.random(WIDTH);
	y = math.random(HEIGHT);
	--r = math.random(4, 400);
	r = math.random(1, math.random(1, math.random(1, math.random(1, 400))))
	
	-- Calling Bubble constructor // Creating Bubble Object:
	return Bubble(x, y, r)
	
end

--	returns abs(distance) between two pixels
--	return value gets rounded to whole number using math.floor(... + 0.5)
function distancePointPoint(point1X, point1Y, point2X, point2Y)
	distance = math.sqrt((point1X - point2X) * (point1X - point2X) + (point1Y - point2Y) * (point1Y - point2Y))
	return math.floor(distance + 0.5)
end

-- maps a number from one range (1) to another (2)
function map(value, start1, stop1, start2, stop2)
	return start2 + ( (value - start1) / (stop1 - start1) ) * (stop2 - start2)
end

function checkPairs(bubbles)
		
		local A = 1

		--will not enter while when #bubbles < , that is bubbles = {} or {1}
		while A <= #bubbles - 1 do

			local i = 1

			while i <= #bubbles - A do --A+i <= #bubb
				--enter loop
				
				--remove smaller of 2 numbers
				--if AbiggerB(bubbles[A],bubbles[A + i]) then
				if bubblesOverlap(bubbles[A],bubbles[A + i]) then
					--remove smaller of 2 numbers
					table.remove(bubbles, A + i)
					
				else
					--noOverlap
					--NO REMOVAL
					i = i + 1
				end
			end
			print()

			A = A + 1

		end
		print()

		--print result array
		for i in pairs(bubbles) do print(i, bubbles[i]) end
		print()
		
	
end

-- Checks if 2 Bubble-objects (modeled as circles) overlap:
-- Returns true if overlapping, else false.
function bubblesOverlap(Bubble_1, Bubble_2)
    -- No overlap when: two circles that are at a greater distance than the sum of their radii.
    if distancePointPoint(Bubble_1.x, Bubble_1.y, Bubble_2.x, Bubble_2.y) > (Bubble_1.r + Bubble_2.r) then
        return false
    end
    -- if the above isn't true, they're overlapping
    return true
end
