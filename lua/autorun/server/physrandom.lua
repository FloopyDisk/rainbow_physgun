AdminMode = 0 -- 1 is to make it only for admins, 0 is to make it for everyone.
function physrandom() -- Create a function named physrandom
    for k, v in pairs(player.GetAll()) do -- Get all players
        function randomize(v) -- Create a function named physrandom
            local f = math.random(13) -- creates a local variable that randomizes from 1 to 13
            local col = v:GetInfo( "cl_weaponcolor" ) -- Get's the current weapon color.
            v:SetWeaponColor( Vector( col ) ) -- Sets the weapons color
            if f == 1 then  
                v:ConCommand("cl_weaponcolor 255 0 0")
            end
            if f == 2 then
                v:ConCommand("cl_weaponcolor 252 105 0")
            end
            if f == 3 then
                v:ConCommand("cl_weaponcolor 239 252 0")
            end
            if f == 4 then
                v:ConCommand("cl_weaponcolor 0 255 0")
            end
            if f == 5 then
                v:ConCommand("cl_weaponcolor 0 0 255")
            end
            if f == 6 then
                v:ConCommand("cl_weaponcolor 34 0 93")
            end
            if f == 7 then
                v:ConCommand("cl_weaponcolor 27 0 27")
            end
            if f == 8 then
                v:ConCommand("cl_weaponcolor 5 61 13")
            end
            if f == 9 then
                v:ConCommand("cl_weaponcolor 0 255 213")
            end
            if f == 10 then
                v:ConCommand("cl_weaponcolor 0 0 0")
            end
            if f == 11 then
                v:ConCommand("cl_weaponcolor 255 255 255")
            end
            if f == 12 then
                v:ConCommand("cl_weaponcolor 177 213 57")
            end
            if f == 13 then
                v:ConCommand("cl_weaponcolor 255 88 0")
            end
        end
        if AdminMode == 1 then -- If the variable AdminMode is set to one, Make it available to only admins.
        -- i added more user groups and put all in one line.
            if v:IsUserGroup("admin") or v:IsUserGroup("operator") or v:IsUserGroup("superadmin") or v:IsUserGroup("mod") or v:IsUserGroup("moderator") or v:IsUserGroup("tmod") or v:IsUserGroup("founder") then
            randomize(v)
            end
        end
        if AdminMode != 1 then -- If the variable AdminMode is not set to one, make it available to everybody
        randomize(v)
        end
    end
end
hook.Add("Initialize", "Initialize.physrandom", timer.Create("wait", .41, 0, physrandom))
