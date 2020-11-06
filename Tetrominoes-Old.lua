Tetrominoes = Class{}

function Tetrominoes:init(Blocks, x, y)
	self.Blocks = copy(Blocks)
	self.Current_Block_index =  1
	self.Current_Blocks = Blocks[self.Current_Block_index]
	self.x = x
	self.y = y
	for i,block in ipairs(self.Current_Blocks) do
		block.x = self.x + (block.xOffset * BLOCK_SIZE)
		block.y = self.y + (block.yOffset * BLOCK_SIZE)
	end
end

function Tetrominoes:move(x, y)
	self.y = self.y + y
	self.x = self.x + x
	if not (self:collides()) then
		for i,block in ipairs(self.Current_Blocks) do
			block.x = self.x + (block.xOffset * BLOCK_SIZE)
			block.y = self.y + (block.yOffset * BLOCK_SIZE)
		end
	end
end

function Tetrominoes:render()
	for i,block in ipairs(self.Current_Blocks) do
		block:render()
	end
end

function Tetrominoes:collides()
	for i,block in ipairs(self.Current_Blocks) do
		if not (block.y < VIRTUAL_HEIGHT-BLOCK_SIZE) then 
			return true
		end
	end
	return false 
end

function Tetrominoes:mapCollides( Map )
	if Map ~= nil then
		for i,block in ipairs(self.Current_Blocks) do
			if block ~= nil and block.x ~= nil and block.y ~= nil then
				if Map[block.x / BLOCK_SIZE][block.y / BLOCK_SIZE] == 1 then 
					print(block.y / BLOCK_SIZE)
					return true
				end
			end
		end	
	end
end

function Tetrominoes:rotate(x)
	map:update(0)
	local Old_Index = self.Current_Block_index
	self.Current_Block_index = self.Current_Block_index + x
	if self.Current_Block_index > #self.Blocks then
		self.Current_Block_index = 1
	end
	if self.Current_Block_index == 0 then
		self.Current_Block_index = 1
	end
	self.Current_Blocks = self.Blocks[self.Current_Block_index]
	self:move(0,0)			-- Prevents Visual glitching
	if self:collides() or self:mapCollides(map.grid) then
		self.Current_Block_index = Old_Index
		self.Current_Blocks = self.Blocks[self.Current_Block_index]
	end
end

