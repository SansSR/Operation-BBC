---@type Plugin
local plugin = ...
plugin.name = 'bbc'
plugin.author = 'sans'
plugin.description = 'Working Removable BBC'


local bbcmode


plugin.commands['/bbc'] = {
	info = 'Gives you a BBC',
	canCall = function (ply) return ply end,
	call = function (ply)
	if bbcmode ~= true then 
		bbcmode = true 
		ply:sendMessage("BBC added!")
		bbcgiver(ply.human)
	else
		cockripperoffer(ply.human)
		bbcmode = nil
		ply:sendMessage("BBC removed!")
	end
end
}

function bbcgiver(human)
	if bbcmode == true then
		local cockbone = human:getRigidBody(0)
		local itm = items.create(itemTypes[36], Vector(human.pos.x, human.pos.y, human.pos.z), yawToRotMatrix(human.viewYaw))
		local bond = itm.rigidBody:bondTo(cockbone, Vector(0,-0.2,0), Vector(0,0,0))
    	human.data.cockbond = bond
    	itm.data.ishere = true
    	human.data.cockitem = itm
end

function cockripperoffer(human)
	local cockitem = human.data.cockitem
	local cockbond = human.data.cockbond
	human.data.cockitem = nil
	cockbond:remove()
	cockitem:remove()
	end
end