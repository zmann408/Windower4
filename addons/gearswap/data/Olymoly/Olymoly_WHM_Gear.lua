-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons')
	
	-- Augmented Capes
	gear.fastcast_jse_back = {name="Alaunus's Cape", augments={'"Fast Cast"+10',}}
	gear.Cure_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	gear.Macc_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
	gear.obi_cure_waist = "Austerity Belt"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Nehushtan",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Nehushtan",sub="Nehushtan"}

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		--main={name="Grioavolr",priority=2}}, sub={name="Clerisy Strap",priority=1}, ammo="Impatiens",
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat", neck="Loricate Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		--  Kishar Ring
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Prolix Ring", rring="Veneficium Ring",
		-- Kaykaus Tights
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Lengo Pants", feet="Chelona Boots +1"}

    sets.precast.FC.DT = {
		--main={name="Grioavolr",priority=2}}, sub={name="Clerisy Strap",priority=1}, ammo="Impatiens",
		-- neck="Voltsurge Torque",
		head="Nahtirah Hat", neck="Loricate Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		--  Kishar Ring
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Prolix Ring", rring="Defending Ring",
		-- Kaykaus Tights
		back=gear.fastcast_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Chelona Boots +1"}
 
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat", waist="Siegel Sash"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {head="Piety Cap", legs="Ebers Pantaloons"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {ammo="Incantor Stone",
			main="Ababinili",sub="Achaq Grip",
			lear="Nourish. Earring +1", feet="Cure Clogs"})
	
	sets.precast.FC.Cure.DT = {ammo="Incantor Stone",
		main="Ababinili",sub="Achaq Grip",
		head="Piety Cap",neck="Loricate Torque",ear1="Nourish. Earring +1",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Gende. Gages +1",ring1="Prolix Ring",ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Witful Belt",legs="Ebers Pantaloons",feet="Cure Clogs"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Asperity Necklace", lear="Brutal Earring", rear="Cessance Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring", rring="Stikini Ring",
		waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring"}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {ammo="Incantor Stone",
		main="Rubicundity", sub="Thuellaic Ecu +1",
		--head="Vanya Hood",neck="Incanter's Torque",
		ear1="Gifted Earring",ear2="Gwati Earring",
		--body="Vedic Coat",
		hands="Fanatic Gloves",ring2="Prolix Ring",
		waist="Austerity Belt",legs="Lengo Pants",feet="Kaykaus Boots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
		
    -- Cure sets
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		-- Queller Rod D
		main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque  
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		-- Ebers Pantaloons +1 
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.CureSolace = {
		-- Queller Rod D
		main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque  
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		-- Ebers Pantaloons +1 
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.LightWeatherCure = {
		main={name="Chatoyant Staff", priority=2}, sub={name="Archaq Grip", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque 
		head="Gendewitha Caubeen +1", neck="Colossus's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		--Ebers Pantaloons +1 
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.LightWeatherCureSolace = {
		main={name="Chatoyant Staff", priority=2}, sub={name="Archaq Grip", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque 
		head="Gendewitha Caubeen +1", neck="Colossus's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		--Ebers Pantaloons +1 
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.LightDayCureSolace = {
		main={name="Chatoyant Staff", priority=2}, sub={name="Archaq Grip", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque 
		head="Gendewitha Caubeen +1", neck="Colossus's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		--Ebers Pantaloons +1 
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.LightDayCure = {
		main={name="Chatoyant Staff", priority=2}, sub={name="Archaq Grip", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque 
		head="Gendewitha Caubeen +1", neck="Colossus's Torque",lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		--Ebers Pantaloons +1 
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.Curaga = {	
		-- 
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theo. Bliault +3 Theophany Mitts +3 Lebeche Ring
		body="Heka's Kalasiris", hands=gear_telchine_Hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Ebers Pantaloons +1 
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.LightWeatherCuraga = {
		main={name="Chatoyant Staff", priority=2}, sub={name="Archaq Grip", priority=1}, ammo="Esper Stone +1",
		-- Nuna Gorget +1 
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theo. Briault +3 Kaykaus Cuffs A
		body="Heka's Kalasiris", hands=gear_telchine_Hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Ebers Pantaloons +1 
		back="Twilight Cape", waist="Hachirin-no-Obi",  legs="Ebers Pantaloons", feet="Kaykaus Boots"}
		
	sets.midcast.LightDayCuraga = {
		main={name="Chatoyant Staff", priority=2}, sub={name="Archaq Grip", priority=1}, ammo="Esper Stone +1",
		-- Nuna Gorget +1 
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Theo. Briault +3 Kaykaus Cuffs A
		body="Heka's Kalasiris", hands=gear_telchine_Hands_Cure, lring="Stikini Ring", rring="Stikini Ring",
		-- Ebers Pantaloons +1 
		back="Twilight Cape", waist="Hachirin-no-Obi",  legs="Ebers Pantaloons", feet="Kaykaus Boots"}
		
	sets.midcast.Cure.DT = {
		-- Queller Rod D
		main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque  
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		-- Ebers Pantaloons +1 
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		-- Queller Rod D
		main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, ammo="Esper Stone +1",
		-- Kaykaus Mitra B Incanter's Torque  
		head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Glorious Earring", rear="Nourish. Earring +1",
		-- Ebers Bliaud Theophany Mitts +3 Lebeche Ring
		body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Stikini Ring",
		-- Ebers Pantaloons +1 
		back=gear.Cure_jse_back, waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Kaykaus Boots"}

	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		-- main={name="Gada", priority=2}, sub={name="Sors Shield", priority=1},
		-- Vanya Hood Healing skill neck="Debilis Medallion", rear="Healing Earring",
		neck="Colossus's Torque", lear="Beatific Earring", 
		-- Ebers Bliaud +1 lring="Haoma's Ring", rring="Haoma's Ring",
		body="Ebers Bliaud", hands="Fanatic Gloves", lring="Sirona's Ring",
		-- Theo. Pantaloons +3
		back=gear.fastcast_jse_back, waist="Bishop's Sash", legs="Theo. Pantaloons", feet="Gende. Galosh. +1"}

	sets.midcast.StatusRemoval = {
		--main={name="Grioavolr", priority=2}, sub={name="Clemency Grip", priority=1}, 
		ammo="Hasty Pinion +1",
		head="Ebers Cap",
		hands="Ebers Mitts",
		waist="Witful Belt", legs="Ebers Pantaloons", feet="Gende. Galosh +1"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {
		--main={name="Gada", priority=2}, sub={name="Ammurapi Shield", priority=1},
		head=gear_telchine_head_Duration,
		--body-"Telchine Chas.", 
		hands=gear_telchine_hands_Duration,
		-- Theo. Duckbills +3
		legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga Tiara +2", hands="Ebers Mitts", legs="Theo. Pantaloons",})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaloons",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaloons",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	-- 438 Cap
	sets.midcast.BarElement = {main={name="Beneficus",priority=2}, sub={name="Sors Shield",priority=1},
		-- Incanter's Torque
		head="Ebers Cap", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body="Ebers Bliaud", hands="Ebers Mitts", lring="Stikini Ring", rring="Stikini Ring",
		back="Merciful Cape", waist="Olympus Sash", legs="Ebers Pantaloons", feet="Ebers Duckbills"}

	-- Caps 500 /sch need 80 need 106 blm/rdm
	sets.midcast.BarStatus = {
		-- Gada
		main={name="Beneficus",priority=2}, sub={name="Sors Shield",priority=1},
		-- Telchine Cap Duration Incanter's Torque 
		head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		-- Telchine Chas. Telchine Gloves 
		lring="Stikini Ring", rring="Stikini Ring",
		-- Telchine Braconi  Piety Pantaloons +1 Theo. Duckbills +3
		back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}

	-- Caps 500 to Cap - Need 106
	-- Duration
	sets.midcast.BoostStat = {
		--main={name="Gada", priority=2},
		-- Befouled Crown
		head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body="Anhur Robe", hands="Inyanga Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Piety Pantaloons +1 Theo. Duckbills +3
		back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}
			
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
		back="Toro Cape",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'] = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Chironic Hose Chironic Slippers 
		back="Toro Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

	sets.midcast['Elemental Magic'].Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Chironic Hose Chironic Slippers 
		back="Toro Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

	sets.midcast['Divine Magic'] = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Chironic Hose Chironic Slippers 
		back="Toro Cape", waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

	sets.midcast['Dark Magic'] = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Rubicundity",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat Erra Pendant Digni. Earring
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

    sets.midcast.Drain = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Rubicundity",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat Erra Pendant Digni. Earring
		head="Appetence Crown", neck="Aesir Torque",lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Fucho-no-Obi", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

    sets.midcast.Drain.Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Rubicundity",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat Erra Pendant Digni. Earring
		head="Appetence Crown", neck="Aesir Torque",lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Fucho-no-Obi", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat Erra Pendant Digni. Earring
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

	sets.midcast.Stun.Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat Erra Pendant Digni. Earring
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

	sets.midcast['Enfeebling Magic'] = {
		-- Grioavolr Enki Strap Hyrdocera
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat Erra Pendant Digni. Earring
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

	sets.midcast['Enfeebling Magic'].Resistant = {
		-- Grioavolr Enki Strap Hyrdocera
		main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
		-- Chironic Hat Erra Pendant Digni. Earring
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Ovate Rope", legs="Inyanga Shalwar +2", feet="Inyanga Crackows +1"}

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back="Alaunus's Cape",ring1="Stikini Ring"})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Inyanga Tiara +2",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Austerity Belt",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Homiliary",
		head="Inyanga Tiara +2", neck="Loricate Torque", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

	sets.idle.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Befouled Crown
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Assid. Pants +1 Chironic Slippers DT
		back="Moonbeam Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.idle.Weak = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Befouled Crown
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Assid. Pants +1 Chironic Slippers DT
		back="Moonbeam Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    -- Defense sets

	sets.defense.PDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		-- Befouled Crown
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Assid. Pants +1 Chironic Slippers DT
		back="Moonbeam Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT = {main="Mafic Cudgel",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genbu's Shield", ammo="Staunch Tathlum",
		head="Inyanga Tiara +2", neck="Loricate Torque", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}

		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
	sets.engaged = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring=Aug.Darkring1, rring="Defending Ring",
		-- Assid. Pants +1 Chironic Slippers DT
		back="Moonbeam Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.engaged.Acc = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring=Aug.Darkring1, rring="Defending Ring",
		-- Assid. Pants +1 Chironic Slippers DT
		back="Moonbeam Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.engaged.DW = {ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring=Aug.Darkring1, rring="Defending Ring",
		-- Assid. Pants +1 Chironic Slippers DT
		back="Moonbeam Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Shamash Robe Chironic Gloves DT
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring=Aug.Darkring1, rring="Defending Ring",
		-- Assid. Pants +1 Chironic Slippers DT
		back="Moonbeam Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts",back="Mending Cape"}
	
	sets.HPDown = {}
		
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 1)
end