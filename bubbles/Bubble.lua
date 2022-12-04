Bubble = Class{}

require 'functions'

-- called in: "love.load()" --LOAD--
function Bubble:init(x, y, r)
    self.x = x;
    self.y = y;
    self.r = r;
    
    self.brightness = math.random(1,2) == 1 and 0 or 1; --brightness is grey value, so equal rgb
    self.colorFill = self.brightness == 0 and {0, 0, 0, 0.4} or {1, 1, 1, .4};
    self.colorStroke = {0, 0, 0, 1}
end

-- custom function:
function Bubble:clicked(mouseX, mouseY)
	d = distancePointPoint(mouseX, mouseY, self.x, self.y);
    if (d < self.r) then
		if self.brightness == 0 then
    		self.brightness = 1;
    		self.colorFill = {1, 1, 1, 0.4}
		else
			self.brightness = 0
			self.colorFill = {0, 0, 0, 0.4}
		end
	end
end

-- custom function:
-- returns true if point(X,Y) is contained within the Bubble-Object
function Bubble:contains(X, Y)
	d = distancePointPoint(self.x, self.y, X, Y);
    if (d < self.r) then
		return true
	else
		return false
	end
end

-- called in: "love.update(dt)" --UPDATE--
-- moving Bubble around randomly, indep from dt
function Bubble:update(dt)

	self.x = self.x + math.random(-2, 2);
    self.y = self.y + math.random(-2, 2);
end

-- called in "love.draw()" --DRAW--
function Bubble:draw()
--fill:
	--love.graphics.setColor(self.brightness, self.brightness, self.brightness, 127/255)
	love.graphics.setColor(self.colorFill)
    love.graphics.circle('fill', self.x, self.y, self.r)

--stroke:
lw = love.graphics.getLineWidth( )
	love.graphics.setColor(self.colorStroke)
	love.graphics.setLineWidth( 4 )
--love.graphics.setLineStyle( style ) smooth rough
love.graphics.setLineStyle('rough')
	love.graphics.circle('line', self.x, self.y, self.r)
love.graphics.setLineWidth( lw )
end

--[[
	Two bubbles colliding: but now two circles colliding.
	Other Bubble 'bubble' as input object to function
]]
function Bubble:collidesBubbles(bubble)
    --two circles that are at a greater distance than the sum of their radii, are not colliding
    if distancePointPoint(self.x, self.y, bubble.x, bubble.y) > (self.r + bubble.r) then
        return false
    end
    -- if the above isn't true, they're overlapping
    return true
end
