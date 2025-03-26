// Entity(2):StripWeapons()
Entity(2):SetWalkSpeed(75)
// Entity(1):SetPos( Entity(2):GetPos() )
// Entity(1):SetEyeAngles( Entity(2):EyeAngles() )
-- If you are from Prostir Sandbox. Send me this link in my DM's: 
-- https://media.discordapp.net/attachments/742482273877885000/1145867613898014802/image.png?width=449&height=427

-- Also, the code was made by Expression 2 user (That one thing used in WireMod). So, code sucks. Enjoy!

sound.Add( {
    name = "epic_sound",
    channel = 8,
    volume = 1.0,
    level = 80,
    pitch = 110,
    sound = "suscidesounds/epicfart.wav"
} )

sound.Add( {
    name = "grassed",
    channel = 8,
    volume = 15.0,
    level = 80,
    pitch = 110,
    sound = "suscidesounds/grassed.wav"
} )

sound.Add( {
    name = "vent",
    channel = 8,
    volume = 0.4,
    level = 80,
    pitch = 100,
    sound = "suscidesounds/air_vent.wav"
} )

sound.Add( {
    name = "skull",
    channel = 8,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = "suscidesounds/skelet.wav"
} )

sound.Add( {
    name = "kys",
    channel = 8,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = "suscidesounds/kys.wav"
} )

sound.Add( {
    name = "kys2",
    channel = 8,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = "suscidesounds/lighting.wav"
} )

sound.Add( {
    name = "ligmaballs",
    channel = 8,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = "suscidesounds/steve_balls.wav"
} )

sound.Add( {
    name = "gachiprsboxreference",
    channel = 8,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = "suscidesounds/gachi_prsbox_reference.wav"
} )

sound.Add( {
    name = "slapp",
    channel = 8,
    volume = 1,
    level = 80,
    pitch = 100,
    sound = "suscidesounds/slap.wav"
} )

------------------------------------------------------------------





------------------------------------------------------------------

local Hemp = nil

function RemoveHemp()
    if Hemp then
        Hemp:Remove()
    end
end
------------------------------------------------------------------


concommand.Add( "kill_dissolve", function( ply )

    if ply:Alive() and !ply:HasGodMode() then

        

	    local DamageInfo = DamageInfo()

	    DamageInfo:SetDamage( ply:Health() )
	    DamageInfo:SetAttacker( ply )
	    DamageInfo:SetDamageType( DMG_DISSOLVE ) 
    
        ply:SetArmor(0)
	    ply:TakeDamageInfo( DamageInfo )


    elseif ply:HasGodMode() then
    ply:ChatPrint("[K+] You have currently god mode on!")
    end

 end )


------------------------------------------------------------------


concommand.Add( "kill_dissolve_sound", function( ply )

    if ply:Alive() then

        ply:EmitSound( "vent" )


	    local DamageInfo = DamageInfo()

	    DamageInfo:SetDamage( ply:Health() )
	    DamageInfo:SetAttacker( ply )
	    DamageInfo:SetDamageType( DMG_DISSOLVE ) 
        
        ply:SetArmor(0)
	    ply:TakeDamageInfo( DamageInfo )

    end

 end )


 ------------------------------------------------------------------


concommand.Add( "kill_hemp", function( ply )

    if ply:Alive() then

        ply:Kill()
        
        local Physics = ents.Create( "prop_dynamic" )
        Physics:SetModel( "models/props_zaza/hemp.mdl" )
        Physics:SetPos( ply:GetPos() )
        Physics:Spawn()
        Physics:SetOwner( ply )

        SafeRemoveEntityDelayed( Physics, 4 )

        ply:GetRagdollEntity():EmitSound( "grassed" )
        ply:GetRagdollEntity():Remove( ) 

    end

end )


------------------------------------------------------------------


 concommand.Add( "kill_fart", function( ply )

    if ply:Alive() then

        ply:Kill()
    
        local Ragdoll = ply:GetRagdollEntity()
        ply:EmitSound( "epic_sound" )
        Ragdoll:Remove( )

        local vPoint = ply:GetPos()
        local effectdata = EffectData()
        effectdata:SetOrigin( vPoint )
        util.Effect( "HelicopterMegaBomb", effectdata )


    end
    
 end )


------------------------------------------------------------------
local function KillSkull(ply)
    ply:Kill()
end

concommand.Add( "kill_skull", function( ply )

    if ply:Alive() and !ply:IsOnFire() then
        ply:SetModel( "models/player/skeleton.mdl" )
        ply:ConCommand( "act zombie" )
        ply:EmitSound( "skull" )
        ply:Ignite( 3 )
        timer.Create( "skullest_of_coolest", 1.4, 1, function() KillSkull( ply )  end  )
    end
    
 end )


------------------------------------------------------------------


concommand.Add( "kill_balloon", function( ply )

    if ply:Alive() then
        
        ply:Kill()

        local Ragdoll = ply:GetRagdollEntity()
        Ragdoll:Remove( )

        local vPoint = ply:GetPos()
        local effectdata = EffectData()
        effectdata:SetOrigin( vPoint + Vector(0,0,25) )
        effectdata:SetRadius( 1 )
        util.Effect( "balloon_pop", effectdata )
        effectdata:SetOrigin( vPoint + Vector(0,0,50))
        util.Effect( "balloon_pop", effectdata )
    end
    
 end )


 ------------------------------------------------------------------



function KillKys(ply)

    if ply then

        local vPoint = ply:GetPos()
        local effectdata = EffectData()
        effectdata:SetOrigin( vPoint )
        effectdata:SetScale(15)
        effectdata:SetMagnitude(5)
        effectdata:SetRadius(5)
        util.Effect( "Sparks", effectdata )

        ply:EmitSound("kys2")
        ply:Kill()


    end

end

concommand.Add( "kill_kys", function( ply )

    if ply:Alive() then
        ply:SetWalkSpeed( 50 )
        ply:SetRunSpeed( 100 )
	    ply:EmitSound("kys")

        timer.Create( "New_1", 2, 1, function() KillKys( ply )  end  )
    end
    
 end )


------------------------------------------------------------------

local function DialSteveKill(ply)

    local DamageInfo = DamageInfo()

    DamageInfo:SetDamage( ply:Health() )
    DamageInfo:SetAttacker( ply )
    DamageInfo:SetDamageType( DMG_DISSOLVE ) 

    ply:TakeDamageInfo( DamageInfo )
    
end

local function DialSteve2(ply)
    ply:ChatPrint("Gman: Ligma balls. ")
    timer.Create( "DSK", 1.25, 1, function() DialSteveKill( ply )  end  ) -- Omg, this is a Nintendo DS 3!!
end

local function DialSteve1(ply)
    ply:ChatPrint(ply:Name()..": Who the hell is Steve Jobs?")
    timer.Create( "DS2", 1.9, 1, function() DialSteve2( ply )  end  ) -- Omg, this is a Nintendo DS 2!!
end

concommand.Add( "kill_stevejobs", function( ply )
    if ply:Alive() and not timer.Exists( "DS1" ) and not timer.Exists( "DS2" ) and not timer.Exists( "DSK" ) then
        ply:SetWalkSpeed( 1 )
        ply:SetRunSpeed( 1 )

        timer.Create( "DS1", 4.8, 1, function() DialSteve1( ply )  end  )

        ply:EmitSound("ligmaballs")
        ply:ChatPrint("Gman: It's so sad that Steve Jobs died of ligma.")

        local Physics = ents.Create( "prop_physics" )
        Physics:SetModel( "models/gman_high.mdl" )
        Physics:SetPos( ply:GetPos() + ply:GetForward() * 150 )
        Physics:Spawn()
        Physics:SetOwner( ply )
        Physics:GetPhysicsObject():EnableMotion( false )
        Physics:SetAngles( ( ply:GetPos() - Physics:GetPos() ):Angle() )
        SafeRemoveEntityDelayed( Physics, 9 )
    end


end)


------------------------------------------------------------------

concommand.Add( "kill_silent", function( ply ) 
    if ply:Alive() then
        ply:KillSilent()
    end
end)

------------------------------------------------------------------

concommand.Add( "kill_slap", function( ply ) 
    if ply:Alive() then
        ply:Kill()
        ply:GetRagdollEntity():Remove()
        
        local Physics = ents.Create( "prop_ragdoll" )
        Physics:SetModel( ply:GetModel() )
        Physics:SetPos( ply:GetPos() + Vector( 0,0,25 ))
        Physics:SetAngles( ply:GetAngles() )
        Physics:Spawn()
        Physics:SetOwner( ply )
        Physics:GetPhysicsObject():SetMass( 25555 )
        Physics:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
        ply:EmitSound("slapp")

        Physics:GetPhysicsObject():ApplyForceCenter( -ply:GetAngles():Forward() * 255555555*3 + Vector( 0, 0, 25555555*2 ) )

        SafeRemoveEntityDelayed( Physics, 5 )


    end
end)

------------------------------------------------------------------

local RandomProp = {"models/props_junk/watermelon01.mdl","models/props_junk/TrafficCone001a.mdl","models/props_junk/terracotta01.mdl","models/props_interiors/pot01a.mdl","models/props_junk/garbage_metalcan002a.mdl","models/Gibs/HGIBS.mdl","models/props_c17/doll01.mdl","models/props_c17/oildrum001.mdl","models/props_junk/TrashBin01a.mdl","models/props/cs_italy/bananna_bunch.mdl","models/props_junk/wood_pallet001a.mdl"}

concommand.Add( "kill_junk", function( ply )

    if ply:Alive() then

        ply:Kill()


        local Physics = ents.Create( "prop_physics" )
        Physics:SetModel( RandomProp[ math.random( 1,#RandomProp )] )
        Physics:SetPos( ply:GetPos() + Vector( 0,0,25 ))
        Physics:Spawn()
        Physics:SetOwner( ply )
        
        SafeRemoveEntityDelayed( Physics, 4 )

        Physics:SetVelocity( Vector( 0,255,0 ) )

        ply:GetRagdollEntity():EmitSound( "doors/vent_open3.wav" )
        ply:GetRagdollEntity():Remove( ) 

    end

end )

------------------------------------------------------------------ TF2

local function Gib(ply,GibType)
    if IsMounted( 440 ) and util.IsValidModel( "models/player/gibs/"..GibType.."gib001.mdl" ) and ply:Alive() then



        Gibs = {"models/player/gibs/"..GibType.."gib001.mdl","models/player/gibs/"..GibType.."gib002.mdl","models/player/gibs/"..GibType.."gib003.mdl","models/player/gibs/"..GibType.."gib004.mdl","models/player/gibs/"..GibType.."gib005.mdl","models/player/gibs/"..GibType.."gib006.mdl"}
    

        ply:Kill()


        local Skin = math.random(0,1)


        for M,Sequence in pairs(Gibs) do
        
           local Physics = ents.Create( "prop_physics" )

           Physics:SetModel( Sequence )

           Physics:SetPos( ply:GetPos() + Vector( 0,0,25 ))
        
            Physics:Spawn()
            Physics:GetPhysicsObject():SetVelocity( Vector( math.random(-100,100),math.random(-100,100),150 ) )
            Physics:SetSkin(Skin)
            Physics:SetOwner( ply )

        

            SafeRemoveEntityDelayed( Physics, 4 )
        end
    


    
        if GibType == "demo" and ply:GetRagdollEntity() then
            ply:GetRagdollEntity():EmitSound("vo/demoman_painsevere0"..math.random( 1,4 )..".mp3")
        elseif ply:GetRagdollEntity() then
            ply:GetRagdollEntity():EmitSound("vo/"..GibType.."_painsevere0"..math.random( 1,4 )..".mp3")
        end
    

        ply:GetRagdollEntity():Remove( ) 

    elseif !IsMounted( 440 ) then
        ply:ChatPrint( "Team Fortress 2 is not mounted on this server!" )
    end
end

concommand.Add( "kill_gib_scout", function( ply )
    if ply:Alive() then
        Gib(ply,"scout")
    end
end )


concommand.Add( "kill_gib_soldier", function( ply )
    if ply:Alive() then
        Gib(ply,"soldier")
    end
end )

concommand.Add( "kill_gib_pyro", function( ply )
    if ply:Alive() then
        Gib(ply,"pyro")
    end
end )

concommand.Add( "kill_gib_demoman", function( ply )
    if ply:Alive() then
        Gib(ply,"demo")
    end
end )

concommand.Add( "kill_gib_heavy", function( ply )
    if ply:Alive() then
        Gib(ply,"heavy")
    end
end )

concommand.Add( "kill_gib_engineer", function( ply )
    if ply:Alive() then
        Gib(ply,"engineer")
    end
end )

concommand.Add( "kill_gib_medic", function( ply )
    if ply:Alive() then
        Gib(ply,"medic")
    end
end )

concommand.Add( "kill_gib_sniper", function( ply )
    if ply:Alive() then
        Gib(ply,"sniper")
    end
end )

concommand.Add( "kill_gib_spy", function( ply )
    if ply:Alive() then
        Gib(ply,"spy")
    end
end )

local Gibs = {"scout","soldier","pyro","demo","heavy","engineer","medic","sniper","spy"}

concommand.Add( "kill_gib", function( ply )
    if ply:Alive() then
        Gib(ply,Gibs[math.random(1,8)])
    end
end )


------------------------------------------------------------------


concommand.Add( "kill_sandwich", function( ply )

    if ply:Alive() then

        ply:Kill()


        local Physics = ents.Create( "prop_physics" )
        

        if math.random(1,15) == 1 then
            Physics:SetModel( "models/items/plate_robo_sandwich.mdl" )
            ply:GetRagdollEntity():EmitSound( "vo/mvm/mght/heavy_mvm_m_sandwichtaunt07.mp3" )
        else
            ply:GetRagdollEntity():EmitSound( "vo/heavy_sandwichtaunt17.mp3" )
            Physics:SetModel( "models/items/plate.mdl" )
        end
        
        Physics:SetPos( ply:GetPos() + Vector( 0,0, 25 ))
        Physics:Spawn()
        Physics:SetOwner( ply )
        
        SafeRemoveEntityDelayed( Physics, 4 )

        ply:GetRagdollEntity():Remove( ) 

    end

end )


------------------------------------------------------------------


concommand.Add( "kill_random", function( ply )

    if ply:Alive() then
        local Kills = {"kill_silent","kill_junk","kill_stevejobs","kill_kys","kill_balloon","kill_skull","kill_fart","kill_hemp","kill_dissolve_sound","kill_dissolve"}
        ply:ConCommand( Kills[ math.random(1,#Kills) ] )

    end

end )


------------------------------------------------------------------
-- Admin only commands -------------------------------------------
------------------------------------------------------------------

concommand.Add( "kill_explode", function( ply )

    if ply:Alive() and ply:IsSuperAdmin() then
        
        ply:Kill()
        local effectdata = EffectData()
        effectdata:SetOrigin( ply:GetPos() + Vector( 0,0,25 )  )
        effectdata:SetScale(1555555)
        effectdata:SetMagnitude(525)
        effectdata:SetRadius(255)
        util.Effect( "Explosion", effectdata )

        util.BlastDamage( ply, ply, ply:GetPos(), 150, 69696969 )
    end
    
 end )

 

concommand.Add( "kill_nuke", function( ply )

    if ply:Alive() and ply:IsSuperAdmin() then -- Funny and shitty code, don't look
        if game.GetIPAddress() == "91.203.5.123:25016" then
            ply:EmitSound("gachiprsboxreference")
            ply:ChatPrint("Хей друже, я гадаю ти помилився серверами, локальний сервер двума поверхами нижче")
        else

        


        local effectdata = EffectData()
        
        effectdata:SetScale(1555555)
        effectdata:SetMagnitude(525)
        effectdata:SetRadius(255)

        ply:Kill()


        effectdata:SetOrigin( ply:GetPos() + Vector( 400,0,25 )  )
        util.Effect( "Explosion", effectdata )

        effectdata:SetOrigin( ply:GetPos() + Vector( -400,0,25 )  )
        util.Effect( "Explosion", effectdata )
        
        effectdata:SetOrigin( ply:GetPos() + Vector( 0,400,25 )  )
        util.Effect( "Explosion", effectdata )

        effectdata:SetOrigin( ply:GetPos() + Vector( 0,-400,25 )  )
        util.Effect( "Explosion", effectdata )


        effectdata:SetOrigin( ply:GetPos() + Vector( 0,0,25 )  )
        util.Effect( "Explosion", effectdata )

        for O = 1,5 do
        effectdata:SetOrigin( ply:GetPos() + Vector( 0,0,O*75 )  )
        util.Effect( "Explosion", effectdata )
        end

        effectdata:SetOrigin( ply:GetPos() + Vector( 250,0,375 )  )
        util.Effect( "Explosion", effectdata )
        effectdata:SetOrigin( ply:GetPos() + Vector( -250,0,375 )  )
        util.Effect( "Explosion", effectdata )
        effectdata:SetOrigin( ply:GetPos() + Vector( 0,250,375 )  )
        util.Effect( "Explosion", effectdata )
        effectdata:SetOrigin( ply:GetPos() + Vector( 0,-250,375 )  )
        util.Effect( "Explosion", effectdata )

        effectdata:SetOrigin( ply:GetPos() + Vector( 0,0,375 )  )
        util.Effect( "Explosion", effectdata )





        util.BlastDamage( ply, ply, ply:GetPos(), 999, 999 )


        end
    end
    
 end )