-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('Normal', 'Acc')
	state.RangedMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Default','DualWeapons','DualMagicWeapons')
	
	DefaultAmmo = {['Fomalhaut'] = "Chrono Bullet",['Yoichinyumi']="Tulfaire Arrow",['Armageddon']="Adlivun Bullet"}
	U_Shot_Ammo = {['Fomalhaut'] = "Animkii Bullet"}
	
	gear.tp_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.wsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	-- name="Belenus's Cape", augments={'DEX+30, racc/ratk+20, Critical Hit Rate+10%',
	gear.crit_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.snapshot_ranger_jse_back = {name="Belenus's Cape", augments={'"Snapshot"+10',}}
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glovelettes"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Double Shot'] = {back=gear.tp_ranger_jse_back}

	-- Fast cast sets for spells
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body="Taeon Tabard",hands="Leyline Gloves",ring1="Prolix Ring", ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",}) -- body="Passion Jacket"

	-- Ranged sets (snapshot)
	-- Snapshot - Caps at 70 from any source.
	sets.precast.RA = {
		head=gear_taeon_head_Snapshot,
		-- Oshosi Vest
		body="Amini Caban",hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- Taeon Chapaeu
		head="Amini Gapette",
		body="Amini Caban", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt", legs="Adhemar Kecks", feet="Meg. Jam. +2"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		head="Arcadian Beret +1",
		body="Amini Caban", hands="Carmine Fin. Ga. +1",
		--  
		back=gear.snapshot_ranger_jse_back, waist="Impulse Belt", legs="Adhemar Kecks", feet="Pursuer Gaiters"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS.Acc = {
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
	-- Bow
	-- Jishnu's Ridiance
	sets.precast.WS['Jishnu\'s Radiance'] = {
		-- rear="Sherida Earring"
		head="Adhemar Bonnet", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		-- Begruding Ring
		body="Meg. Cuirie +2", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Mummu Ring",
		-- 	Darraigner's Brais
		back=gear.crit_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Adhemar Gamashes"}

	sets.precast.WS['Jishnu\'s Radiance'].Acc = {
		-- rear="Sherida Earring"
		head="Adhemar Bonnet", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		-- Begruding Ring
		body="Meg. Cuirie +2", hands="Mummu Wrists +2", lring="Mummu Ring", rring="Ifrit Ring +1",
		-- Darraigner's Brais
		back=gear.crit_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Adhemar Gamashes"}
		
	-- Namas Arrow			
	sets.precast.WS['Namas Arrow'] = {
		head="Arcadian Beret +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Enervating Earring",
		body="Mummu Jacket +1", hands="Arc. Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Arcadian Socks +1"}

	sets.precast.WS['Namas Arrow'].Acc = {
		head="Arcadian Beret +1", neck="Fotia Gorget", lear="Neritic Earring", rear="Enervating Earring",
		body="Mummu Jacket +1", hands="Arc. Bracers +1", lring="Hajduk Ring", rring="Hajduk Ring",
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt", legs="Meg. Chausses +1", feet="Arcadian Socks +1"}

	-- Gun
	-- Last Stand
	sets.precast.RA['Last Stand'] = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ifrit Ring +1",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}
	sets.precast.RA['Last Stand'].Acc = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +2", lring="Hajduk Ring", rring="Hajduk Ring",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}
	
	-- Coronach
	sets.precast.RA['Coronach'] = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		body="Mummu Jacket +1", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ifrit Ring +1",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}
	sets.precast.RA['Coronach'].Acc = {
		head="Meghanada Visor +2", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
		body="Mummu Jacket +1", hands="Meg. Gloves +2", lring="Hajduk Ring", rring="Hajduk Ring",
		back=gear.wsd_ranger_jse_back, waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}

	-- Wildfire
    sets.precast.WS['Wildfire'] = {
        head="Meghanada Visor +2",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",lring="Garuda Ring +1", rring="Garuda Ring +1",
        -- Eschan Stone
		back=gear.wsd_ranger_jse_back, waist="Fotia Belt",legs="Gyve Trousers",feet="Adhemar Gamashes"}

    sets.precast.WS['Wildfire'].Acc = {
        head="Meghanada Visor +2",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves", lring="Garuda Ring +1", rring="Garuda Ring +1",
        back=gear.wsd_ranger_jse_back, waist="Fotia Belt",legs="Gyve Trousers",feet="Adhemar Gamashes"}
	
	-- Trueflight
    sets.precast.WS['Trueflight'] = {
        head="Meghanada Visor +2",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",lring="Garuda Ring +1", rring="Garuda Ring +1",
        back=gear.wsd_ranger_jse_back, waist="Fotia Belt",legs="Gyve Trousers",feet="Adhemar Gamashes"}

    sets.precast.WS['Trueflight'].Acc = {
        head="Meghanada Visor +2",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",lring="Garuda Ring +1", rring="Garuda Ring +1",
        back=gear.wsd_ranger_jse_back, waist="Fotia Belt",legs="Gyve Trousers",feet="Adhemar Gamashes"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
       
	-- Ranged sets	
	-- Everything else
	sets.midcast.RA = {
        head="Meghanada Visor +2",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Carmine Fin. Ga. +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Acc = {
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	
    sets.midcast.RA.Yoichinyumi = {
        head="Meghanada Visor +2",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Carmine Fin. Ga. +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Yoichinyumi.Acc = {
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Yoichinyumi.AM = {
        head="Meghanada Visor +2",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	sets.midcast.RA.Gandiva = {
        head="Meghanada Visor +2",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Carmine Fin. Ga. +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Gandiva.Acc = {
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Annihilator = {
        head="Meghanada Visor +2",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Carmine Fin. Ga. +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Annihilator.Acc = {
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Fomalhaut  = {
        head="Meghanada Visor +2",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Carmine Fin. Ga. +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.midcast.RA.Fomalhaut.Acc = {
        head="Meghanada Visor +2",neck="Gaudryi Necklace",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Rajas Ring",ring2="K'ayres Ring",
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
	sets.buff['Double Shot'] = {back=gear.tp_ranger_jse_back}
	sets.buff['Double Shot'].Acc = {}
	
	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {hands="Orion Bracers +1"})
	sets.buff.Camouflage = {body="Orion Jerkin +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {
		head="Meghanada Visor +2",neck="Loricate Torque",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
    
	-- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
    
    sets.defense.MDT = {ammo=gear.RAbullet,
       head="Meghanada Visor +2",neck="Loricate Torque",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
    
    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",neck="Loricate Torque",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Dark Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +2"}
    
	sets.Kiting = {feet="Orion Socks +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapon Sets
	sets.weapons.Default = {main="Perun +1",sub="Hurlbat",range="Yoichinyumi",ammo="Tulfaire Arrow"}
	sets.weapons.SingleWeapon = {main="Perun +1",sub="Legion Scutum",range="Yoichinyumi",ammo="Tulfaire Arrow"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence",range="Fomalhaut",ammo="Eminent Bullet"}

   
	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Meg. Chausses +1", feet="Meg. Jam. +2"}

    sets.engaged.Acc = {
		head="Meghanada Visor +2", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring +1",
		back="Ground. Mantle +1", waist="Dynamic Belt +1",  legs="Meg. Chausses +1", feet="Meg. Jam. +2"}

    sets.engaged.DW = {
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		--	-- Adhemar Jacket +1 Floral Gauntlets
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

    sets.engaged.DW.Acc = {
		head="Meghanada Visor +2", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		-- Adhemar Jacket +1 Floral Gauntlets
		body="Meghanada Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(3, 13)
end
