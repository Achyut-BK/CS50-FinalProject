I_Block_positions = {{Block(2,1), Block(2,2), Block(2,3), Block(2,4)}, 	
					{Block(1,1), Block(2,1), Block(3,1), Block(4,1)}}

J_Block_positions = {{Block(1,1), Block(1,2), Block(1,3), Block(2,1)},  
					{Block(-1,1), Block(0,1), Block(1,1), Block(1,2)},
					{Block(1,-1), Block(1,0), Block(1,1), Block(0,1)},
					{Block(3,1), Block(2,1), Block(1,1), Block(1,0)}}  

L_Block_positions = {{Block(1,1), Block(1,2), Block(1,3), Block(2,3)},
					{Block(1,3), Block(2,3), Block(3,3), Block(1,4)},
					{Block(1,5), Block(1,4), Block(1,3), Block(0,3)},
					{Block(-1,3), Block(0,3), Block(1,3), Block(1,2)}}

O_Block_positions = {{Block(1,1), Block(1,2), Block(2,1), Block(2,2)}}

S_Block_positions = {{Block(2,1), Block(3,1), Block(1,2),Block(2,2)}, 
					{Block(2,1), Block(2,2), Block(3,2),Block(3,3)}}  

T_Block_positions = {{Block(0,1), Block(1,1), Block(2,1), Block(1,2)},
					{Block(1,0), Block(1,1), Block(1,2), Block(0,1)},
					{Block(0,1), Block(1,1), Block(2,1), Block(1,0)},
					{Block(1,0), Block(1,1), Block(1,2), Block(2,1)}}

Z_Block_positions = {{Block(1,1), Block(2,2), Block(2,1), Block(3,2)},
					{Block(1,2), Block(1,3), Block(2,1),Block(2,2)}}

positions = {Z_Block_positions,
			T_Block_positions, 
			S_Block_positions, 
			O_Block_positions,
			L_Block_positions,
			J_Block_positions,
			I_Block_positions}

--https://stackoverflow.com/a/26367080/13656598
function copy(obj)
    if type(obj) ~= 'table' then return obj end
    local res = setmetatable({}, getmetatable(obj))
    for k, v in pairs(obj) do res[copy(k)] = copy(v) end
    return res
end
