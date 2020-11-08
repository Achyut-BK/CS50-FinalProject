Map = Class{}

function Map:init()
	self.grid = {}
	for x=1,SCREEN_WIDTH_BLOCKS do
		self.grid[x] = {}
		for y=1,SCREEN_HEIGHT_BLOCKS do
			self.grid[x][y] = 0
		end
	end
	self:newTetromino()
end

function Map:render()
	for x=1,SCREEN_WIDTH_BLOCKS do
		for y=1,SCREEN_HEIGHT_BLOCKS do
			if self.grid[x][y] == 1 then
				love.graphics.setColor(1,1,1,1)
				love.graphics.setLineWidth(1)
				love.graphics.rectangle('fill',x * BLOCK_SIZE,y * BLOCK_SIZE,BLOCK_SIZE,BLOCK_SIZE)

				love.graphics.setColor(0.5,0.5,0.5,1)
				love.graphics.setLineWidth(BLOCK_SIZE/10)
				love.graphics.rectangle('line',
										(x)*BLOCK_SIZE,
										(y)*BLOCK_SIZE,
										BLOCK_SIZE-2,
										BLOCK_SIZE-2)
			end
		end
	end
--[[	if not Game_Over then
		self.Current_Tetromino:render()
	else
		EndFont = love.graphics.newFont('font.ttf',128)
		love.graphics.setFont(EndFont)
		love.graphics.print("Game Over")
	end ]]--

end

function Map:update()
	if not Game_Over then

		-- Erase
		for i,Block in ipairs(self.Current_Tetromino:getBlocks()) do
			self.grid[Block.x / BLOCK_SIZE ][Block.y / BLOCK_SIZE] = 0
		end

		--Move
		self.Current_Tetromino:move(0,1)

		-- Colision detection
		for i,Block in ipairs(self.Current_Tetromino:getBlocks()) do
			if self.grid[Block.x / BLOCK_SIZE ][Block.y / BLOCK_SIZE ] == 1 then
				for i,Block in ipairs(self.Current_Tetromino:getBlocks()) do
					self.grid[Block.x / BLOCK_SIZE ][Block.y / BLOCK_SIZE -1] = 1
					print(Block.parent)
				end	
				self:newTetromino()
			end
		end	

		--Stamp
		for i,Block in ipairs(self.Current_Tetromino:getBlocks()) do
			self.grid[Block.x / BLOCK_SIZE][Block.y / BLOCK_SIZE ] = 1
		end	

		--Boundary Collision
		for i,Block in ipairs(self.Current_Tetromino:getBlocks()) do
			if Block.y / BLOCK_SIZE + 2 > SCREEN_HEIGHT_BLOCKS then
				self:newTetromino()
			end
		end	
	end
end

function Map:newTetromino()
	self.Current_Tetromino = Tetrominoes(positions[math.random(1, #positions)], 1, 0)
	for i,Block in ipairs(self.Current_Tetromino:getBlocks()) do
		if self.grid[Block.x / BLOCK_SIZE ][Block.y / BLOCK_SIZE ] == 1 then
			Game_Over = true
		end
	end	
end