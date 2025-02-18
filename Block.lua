Block = Class{}

function Block:init(x, y)
	self.x = x 
	self.y = y 
	self.xOffset = x
	self.yOffset = y
	self.parent = nil
end

function Block:render()
	love.graphics.setColor(1,1,1,1)
	love.graphics.setLineWidth(1)
	love.graphics.rectangle('fill',self.x,self.y,BLOCK_SIZE,BLOCK_SIZE)

	love.graphics.setColor(0,0,0,1)
	love.graphics.setLineWidth(BLOCK_SIZE/10)
	love.graphics.rectangle('line',self.x+1,self.y+1,BLOCK_SIZE-2,BLOCK_SIZE-2)

end