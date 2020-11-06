Map = Class{}

function Map:init()
	self.grid = {}
	self.filled = {}
	for x=1,VIRTUAL_WIDTH do
		self.grid[x] = {}
		for y=1,VIRTUAL_HEIGHT do
			self.grid[x][y] = 0
		end
	end
end

function Map:newBlock(x, y)
	self.grid[x][y] = Block(x,y)
	table.insert(self.filled, {x,y})
end

function Map:render()
	for i,sub in ipairs(self.filled) do
		self.grid[sub[1]][sub[2]]:render()
	end
end

function Map:update()
	for i,sub in ipairs(self.filled) do
		self.grid[sub[1]][sub[2]]:move(1,0)
		self.grid[sub[1]][sub[2]+1] = self.grid[sub[1]][sub[2]]
		self.filled[i] = {sub[1],sub[2]+1}
		self.grid[sub[1]][sub[2]] = 0
	end
end