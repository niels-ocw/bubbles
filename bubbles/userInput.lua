--callback function triggered when a mouse button is pressed:
function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		for i in pairs(bubbles) do
			bubbles[i]:clicked(math.floor(0.5 + x), math.floor(0.5 + y))
		end
	end
end

-- keysCONTINUOUS()
-- from: love.UPDATE(dt)
function keysContinuous()
	--Checks whether a certain key is down.
    --User input:
    if love.keyboard.isDown('up') then
		-- add Bubble to end of bubbles:
        --bubbles[#bubbles + 1] = returns_a_new_Bubble()
        newBubble = returns_a_new_Bubble()
        table.insert(bubbles, newBubble)
			---- add a Bubble to beginning of bubbles:
			--table.insert(bubbles, 1, newBubble);
    elseif love.keyboard.isDown('down') then
		--making sure there's always at least 1 Bubble:
		if #bubbles > 1 then
			-- remove last Bubble from bubbles {last in first out}:
			table.remove(bubbles)
			-- equivalent:
			--table.remove(bubbles, #bubbles)
				---- remove oldest Bubble from bubbles {first in first out}:
				--table.remove(bubbles, 1)
		end
    end
end

-- keysONCE()
--callback function triggered when a key is pressed:
function love.keypressed(key)
    if key == 'space' then
		checkPairs(bubbles)
    elseif key == 'escape' then
        love.event.quit()
        --love.event.quit(0) --with exit status "0"
    elseif key == 'return' then -- or key == 'enter' then
        love.event.quit("restart")
    end
end
