Map = Class{}

function Map:init()
	self.grid = {}
	self.Current_Tetromino = Tetrominoes(positions[math.random(1, #positions)], BLOCK_SIZE, 0)
	for x=1,VIRTUAL_WIDTH do
		self.grid[x] = {}
		for y=1,VIRTUAL_HEIGHT do
			self.grid[x][y] = 0
		end
	end
end

function Map:render()
	for x=1,VIRTUAL_WIDTH do
		for y=1,VIRTUAL_HEIGHT do
			if self.grid[x][y] == 1 then
				love.graphics.setColor(1,1,1,1)
				love.graphics.setLineWidth(1)
				love.graphics.rectangle('fill',x,y,BLOCK_SIZE,BLOCK_SIZE)

				love.graphics.setColor(0.5,0.5,0.5,1)
				love.graphics.setLineWidth(BLOCK_SIZE/10)
				love.graphics.rectangle('line',x+1,y+1,BLOCK_SIZE-2,BLOCK_SIZE-2)
			end
		end
	end
	if not Game_Over then
		self.Current_Tetromino:render()
	else
		EndFont = love.graphics.newFont('font.ttf',128)
		love.graphics.setFont(EndFont)
		love.graphics.print("Game Over")
	end

end

function Map:update(move)
	if not Game_Over then
		self.Current_Tetromino:move(0,move)
		if self.Current_Tetromino:collides() or self.Current_Tetromino:mapCollides(self.grid) then
			self.Current_Tetromino:move(0,-move)
			for i,block in ipairs(self.Current_Tetromino.Current_Blocks) do
				print(block.x / BLOCK_SIZE, block.y / BLOCK_SIZE)
				if self.grid[block.x][block.y] == 0 then
					self.grid[block.x][block.y] = 1
				else
					Game_Over = true
				end
			end
			self.Current_Tetromino = Tetrominoes(positions[math.random(1, #positions)], BLOCK_SIZE, 0)
			self:update(move)
		end
	else
	end
end