Block = Class{}

function Block:init(x, y)
	self.x = x 
	self.y = y 
	self.xOffset = x
	self.yOffset = y
end

--[[function Block:move(yOffset, xOffset)		-- Kept for Testing & debugging purposes, 
											-- use the tetrominoes class move instead
	if self.y < VIRTUAL_HEIGHT-1 then
		self.y = self.y + yOffset
	end
	self.x = self.x + xOffset
end ]]--

function Block:render()
	love.graphics.setColor(1,1,1,1)
	love.graphics.setLineWidth(1)
	love.graphics.rectangle('fill',self.x,self.y,BLOCK_SIZE,BLOCK_SIZE)

	love.graphics.setColor(0,0,0,1)
	love.graphics.setLineWidth(BLOCK_SIZE/10)
	love.graphics.rectangle('line',self.x+1,self.y+1,BLOCK_SIZE-2,BLOCK_SIZE-2)

end