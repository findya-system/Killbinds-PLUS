local function Bar()
    spawnmenu.AddToolCategory("Utilities", "Killbinds PLUS", "Findya's Stuff")
end

local function Panels()

    spawnmenu.AddToolMenuOption("Utilities", "Killbinds PLUS", "Findya's Stuff", "#Killbinds PLUS", "", "", function(panel)
        
        panel:Button( "Random kill",   "kill_random")


        panel:Button( "Dissolve", "kill_dissolve")
        panel:Button( "Dissolve (With sound)", "kill_dissolve_sound")
        panel:Button( "Become hemp (Requires PRSBOX content!)",      "kill_hemp")
        panel:Button( "Fart",      "kill_fart")
        panel:Button( "Skull",     "kill_skull")
        panel:Button( "Balloon",   "kill_balloon")
        panel:Button( "You Should *Keep Yourself Safe*",   "kill_kys")
        panel:Button( "Become junk",   "kill_junk")
        panel:Button( "Ligma balls joke",   "kill_stevejobs")
        panel:Button( "Silent slay",   "kill_silent")
        panel:Button( "Slap",   "kill_slap")

        panel:Help( "Requires mounted Team Fortress 2 game:" )

        panel:Button( "Random gib",   "kill_gib")
        panel:Button( "Scout gib",   "kill_gib_scout")
        panel:Button( "Soldier gib",   "kill_gib_soldier")
        panel:Button( "Pyro gib",   "kill_gib_pyro")
        panel:Button( "Demoman gib",   "kill_gib_demoman")
        panel:Button( "Heavy gib",   "kill_gib_heavy")
        panel:Button( "Engineer gib",   "kill_gib_engineer")
        panel:Button( "Medic gib",   "kill_gib_medic")
        panel:Button( "Sniper gib",   "kill_gib_sniper")
        panel:Button( "Spy gib",   "kill_gib_spy")
        panel:Button( "Sandwich",   "kill_sandwich")

        panel:Help( "Super admin only:" )
        
        panel:Button( "Nuke",   "kill_nuke")
        panel:Button( "Explode",   "kill_explode")
    end)

end


hook.Add( "PopulateToolMenu", "Settings", Panels )
hook.Add( "AddToolMenuCategories", "CrazedTexanCategory", Bar)

