AdminMode = 0 -- Is this for admins only? 1 is yes, 0 is no.

H, S, L = 0, 190, 10
function physrandom() -- Create the function
    for k, v in pairs(player.GetAll()) do -- Get all players
        function randomize(v) -- Create another function that randomizes the players physgun
			HSLtoRGB(H,S,L);
            local col = v:GetInfo( "cl_weaponcolor" )
            v:SetWeaponColor( Vector( col ) )
			v:ConCommand("cl_weaponcolor ".. R .." ".. G .." ".. B)
			H = H+1
			if H > 239 then H=0 end
		end
        if AdminMode == 1 then -- If AdminMode is set to 1, then make it for the available groups
            if v:IsUserGroup("admin") or v:IsUserGroup("superadmin") or v:IsUserGroup("operator") or v:IsUserGroup("moderator") or v:IsUserGroup("mod") or v:IsUserGroup("tmod") then
				randomize(v) -- Run the randomize function.
            end
		elseif AdminMode == 0 then randomize(v) -- If admin mode is 0, make it available to all players.
		else randomize(v) end -- If AdminMode is some other value we dont give a crap about, just let it randomize anyway.
	end
end

function HSLtoRGB(H, S, L) -- This one is kind of self explainitory.
    H, S, L = math.min(240, H), math.min(240, S), math.min(240, L)
    H, S, L = math.max(0, H), math.max(0, S), math.max(0, L)
    R, G, B = 0, 0, 0
    if H < 80 then
        R = math.min(255, 255 * (80 - H) / 40)
    elseif H > 160 then
        R = math.min(255, 255 * (H - 160) / 40)
    end
    if H < 160 then
        G = math.min(255, 255 * (80 - math.abs(H - 80)) / 40)
    end
    if H > 80 then
        B = math.min(255, 255 * (80 - math.abs(H - 160)) / 40)
    end
    if S < 240 then
        k = S / 240
        R, G, B = R*k, G*k, B*k
        k = 128 * (240 - S) / 240
        R, G, B = R+k, G+k, B+k
    end
    k = (120 - math.abs(L - 120)) / 120
    R, G, B = R*k, G*k, B*k
    if L > 120 then
        k = 256 * (L - 120) / 120
        R, G, B = R+k, G+k, B+k
    end
    return R, G, B
end

local phystimer_time = .20 -- Set this to anything you want.
hook.Add("Initialize", "Initialize.physrandom", timer.Create("wait", phystimer_time, 0, physrandom)) -- Create the timer for when the player spawns in. 
