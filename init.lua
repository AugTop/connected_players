local timer = 0
local filename = "connected_players.txt"
local interval = 10

local function save_data()
	local file = io.open( minetest.get_worldpath().."/"..filename, "w" )

    if file then
		for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
		    file:write(name .. "\n")
		    file:close()
		end
	end

end

minetest.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer >= interval then
        timer = 0
    else
        return
    end

	save_data()
    
end)