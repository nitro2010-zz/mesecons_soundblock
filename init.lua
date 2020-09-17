local on_digiline_receive = function (pos, _, channel, msg)
	local setchan = minetest.get_meta(pos):get_string("channel")
	if channel == setchan then
		local meta = minetest.get_meta(pos)
		local heardistance = tonumber(meta:get_string("heardistance")) or 10
		local gain = tonumber(meta:get_string("gain")) or 1
		
		minetest.sound_play(
			msg, { 
				pos = pos,
				max_hear_distance = heardistance,
				gain = gain,
			})
	end
end

minetest.register_node("mesecons_soundblock:block", {
	description = "mesecons_soundblock",
	tiles = {"mesecons_soundblock.png"},
	is_ground_content = false,
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2},
	digiline =
	{
		receptor = {},
		effector = {
			action = on_digiline_receive
		},
	},

on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local node = minetest.get_node(pos)
	local meta = minetest.get_meta(pos)
	local channel = meta:get_string("channel")	
	local heardistance = tonumber(meta:get_string("heardistance")) or 10	
	local gain = tonumber(meta:get_string("gain")) or 1	

	minetest.show_formspec(player:get_player_name(),"fs",
			"size[6,5;]"..
			"bgcolor[#0000;fullscreen]"..
			"field[1,1;4.5,1;channel;Channel;"..channel.."]"..
			"field[1,2;4.5,1;heardistance;Hearing distance;"..heardistance.."]"..
			"field[1,3;4.5,1;gain;Volume;"..gain.."]"..
			"button_exit[2,4;1.5,1;save;Save]"
			)

	minetest.register_on_player_receive_fields(function(player, formname, fields)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local channel = fields["channel"]
		local heardistance = fields["heardistance"]
		local gain = fields["gain"]
		
		if fields["save"] then
			meta:set_string("channel", channel)	
			meta:set_string("heardistance", heardistance)	
			meta:set_string("gain", gain)			
		end
	end)

end		
})
