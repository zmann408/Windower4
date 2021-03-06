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
	send_command('bind !\\\\ input /ma "Reraise III" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Nehushtan",sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Nehushtan",sub="Nehushtan"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Incantor Stone",
		head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring",
		--lring="Prolix Ring",
		body="Inyanga Jubbah +2", hands="Gendewitha Gages", 
		-- waist="Witful Belt",
		back=gear.fastcast_jse_back, legs="Orvail Pants +1", feet="Regal Pumps"}
    sets.precast.FC.DT = {ammo="Incantor Stone",
		head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring",
		--lring="Prolix Ring",
		body="Inyanga Jubbah +2", hands="Gendewitha Gages", 
		-- waist="Witful Belt",
		back=gear.fastcast_jse_back, legs="Aya. Cosciales +2", feet="Regal Pumps"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {hands="Carapacho Cuffs"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main={name="Ababinili", priority=2}, sub={name="Pole Grip", priority=1}, 	
		-- Piety Cap +1
		lear="Nourish. Earring +1", rear="Nourish. Earring",
		legs="Ebers Pant. +1", feet="Hygieia Clogs"})

	sets.precast.FC.Cure.DT = {main={name="Beneficus", priority=2}, sub={name="Sors Shield", priority=1}, 	
		head="Nahtirah Hat",neck="Twilight Torque",lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Witful Belt",legs="Ebers Pant. +1",feet="Hygieia Clogs"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	sets.precast.WS['Hexa Strike'] = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
	
    sets.precast.WS['Flash Nova'] = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    sets.precast.WS['Mystic Boon'] = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    -- Midcast Sets
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {back="Cheviot Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt"})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket"}-- ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {neck="Phalaina Locket"}-- ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {}-- back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"

	-- Conserve Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {ammo="Clarus Stone",
		-- Telchine Cap
		head="Telchine Cap", lear="Gwati Earring", rear="Calamitous Earring",
		--
		-- Lengo Pants 
        back="Aurist's Cape", waist="Austerity Belt", feet="Umbani Boots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring2="Locus Ring"}-- ring1="Mujin Band",
	
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, 
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Bishop Sash kaykaus boots
		back=gear.Cure_jse_back, waist="Salire Belt", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	sets.midcast.CureSolace = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, 
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		--
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Bishop Sash kaykaus boots
		back=gear.Cure_jse_back, waist="Salire Belt", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	sets.midcast.LightWeatherCure = {main={name="Iridal Staff", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Stikini Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	sets.midcast.LightWeatherCureSolace = {main={name="Iridal Staff", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Stikini Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pant. +1",feet="Piety Duckbills"}
		
	sets.midcast.LightDayCureSolace = {main={name="Iridal Staff", priority=2}, sub={name="Pole Grip", priority=1},
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Stikini Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	sets.midcast.LightDayCure = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, 
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Stikini Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pant. +1",feet="Piety Duckbills"}

	sets.midcast.Curaga = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, 
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Stikini Ring",
		back=gear.Cure_jse_back, waist="Salire Belt", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	sets.midcast.LightWeatherCuraga = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, 
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Stikini Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	sets.midcast.LightDayCuraga = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, 
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Stikini Ring",
		back="Twilight Cape", waist="Hachirin-no-Obi", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	sets.midcast.Cure.DT = {main={name="Tamaxchi", priority=2}, sub={name="Sors Shield", priority=1}, 
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		-- 
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Alaunus Cape Bishop Sash kaykaus boots
		back=gear.Cure_jse_back, waist="Salire Belt", legs="Ebers Pant. +1", feet="Piety Duckbills"}

	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		--
		head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Nourish. Earring +1", rear="Nourish. Earring",
		-- 
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", lring="Sirona's Ring", rring="Ephedra Ring",
		-- Bishop Sash kaykaus boots
		back=gear.Cure_jse_back, waist="Salire Belt", legs="Ebers Pant. +1", feet="Piety Duckbills"}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		--neck="Debilis Medallion",
		neck="Colossus's Torque",
		-- lring="Ephedra Ring",
		body="Ebers Bliaud +1", hands="Theo. Mitts +1", rring="Sirona's Ring", rring="Ephedra Ring",
		back=gear.fastcast_jse_back, legs="Theo. Pant. +1", feet="Gende. Galoshes"}

	sets.midcast.StatusRemoval = {ammo="Hasty Pinion +1",
		--main={name="Grioavolr", priority=2}, sub={name="Clemency Grip", priority=1}, 
		head="Ebers Cap",
		--body="Hedera Cotehardie", 
		hands="Ebers Mitts +1",
		waist="Witful Belt", legs="Ebers Pant. +1", feet="Gende. Galoshes"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {ammo="Clarus Stone",
		-- main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		-- neck="Incantor's Torque", lear="Andoaa Earring", 
		head=gear_telchine_head_Duration, neck="Colossus's Torque", 
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		--back="Mending Cape", feet="Theophany Duckbills +3"
		waist="Cascade Belt", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}

	-- Set bonus
	-- 500 Skill	
	sets.midcast.BarElement = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		-- sub="Ammurapi Shield",
		-- neck="Incantor's Torque", lear="Andoaa Earring", 
		head="Ebers Cap", neck="Colossus's Torque", 
		body="Ebers Bliaud +1", hands="Inyan. Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Mending Cape
		waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}
	sets.midcast.BarElement.Lightarts = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		--sub="Ammurapi Shield",
		-- neck="Incantor's Torque", lear="Andoaa Earring", 
		head="Ebers Cap", neck="Colossus's Torque", 
		body="Ebers Bliaud +1", hands="Ebers Mitts +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Mending Cape
		waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1"}

	sets.midcast.BarStatus = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		-- neck="Incantor's Torque", lear="Andoaa Earring", 
		head=gear_telchine_head_Duration, neck="Colossus's Torque", 
		body=gear_telchine_body_Duration, hands="Inyan. Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- back="Mending Cape", feet="Theophany Duckbills +3"
		waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1",}
	
	sets.midcast.BarStatus.Lightarts = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		-- neck="Incantor's Torque", lear="Andoaa Earring", 
		head=gear_telchine_head_Duration, neck="Colossus's Torque", 
		--
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		--  back="Merciful Cape", feet="Theophany Duckbills +3"
		waist="Cascade Belt", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}

	-- 500 Skill
	sets.midcast.BoostStat = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		-- neck="Incantor's Torque", lear="Andoaa Earring", 
		head=gear_telchine_head_Duration, neck="Colossus's Torque", 
		body=gear_telchine_body_Duration, hands="Inyan. Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- back="Mending Cape", feet="Theophany Duckbills +3"
		waist="Cascade Belt", legs="Piety Pantaln. +1", feet="Ebers Duckbills +1",}

	sets.midcast.BoostStat.Lightarts = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		-- lear="Andoaa Earring", 
		head=gear_telchine_head_Duration, neck="Colossus's Torque", 
		--
		body=gear_telchine_body_Duration, hands=gear_telchine_hands_Duration, lring="Stikini Ring", rring="Stikini Ring",
		--  back="Merciful Cape", feet="Theophany Duckbills +3"
		waist="Cascade Belt", legs=gear_telchine_legs_Duration, feet=gear_telchine_feet_Duration}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",})--neck="Nodens Gorget",ear2="Earthcry Earring",legs="Shedir Seraweels"

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})--main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",
		head="Inyanga Tiara +2",
		body="Piety Briault", hands="Ebers Mitts +1",
		legs="Theo. Pant. +1",feet=gear_telchine_feet_Regen})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaloons",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaloons",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	sets.midcast.Impact = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head=empty, neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3
		body="Twilight Cloak", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast['Elemental Magic'] = {	
		-- Grioavolr Enki Strap Pemphredo Tathlum
main={name="Arasy Staff",priority=2}, sub={name="", priority=1},
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Novio Earring", rear="Hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast['Elemental Magic'].Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="", priority=1},
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Novio Earring", rear="Hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast['Divine Magic'] = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff",priority=2}, sub={name="", priority=1},
		-- Chironic Hat 
		head="Inyanga Tiara +2", neck="Eddy Necklace", lear="Novio Earring", rear="Hecate's Earring",
		-- Chironic Doublet Chironic Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Shiva Ring", rring="Shiva Ring",
		-- Chironic Hose Chironic Slippers 
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast['Dark Magic'] = {		
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

    sets.midcast.Drain = {		
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- gear.Macc_jse_back Luminary Sash Chironic Hose Theo. Duckbills +3
		back="Ogapepo Cape", waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

    sets.midcast.Drain.Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast.Stun.Resistant = {		
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- gear.Macc_jse_back Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast['Enfeebling Magic'] = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		--  Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast['Enfeebling Magic'].Resistant = {
		-- Grioavolr Enki Strap Pemphredo Tathlum
		main={name="Arasy Staff", priority=2}, sub={name="", priority=1},
		-- Chironic Hat Erra Pendant neck="Voltsurge Torque", Digni. Earring lear="Gwati Earring", rear="Enchntr. Earring +1",
		head="Inyanga Tiara +2", lear="Lifestorm Earring", rear="Psystorm Earring",
		-- Theo. Briault +3 
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Stikini Ring", rring="Stikini Ring",
		-- gear.Macc_jse_back Luminary Sash Chironic Hose Theo. Duckbills +3
		back=gear.Macc_jse_back, waist="Salire Belt", legs="Aya. Cosciales +2", feet="Inyanga Crackows +1"}

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back="Alaunus's Cape",ring1="Stikini Ring"})

    -- Sets to return to when not performing an action.
    -- Resting sets
	sets.resting = {main="Boonwell Staff",
		head="Inyanga Tiara +2", neck="Eidolon Pendant", lear="Merman's Earring", rear="Merman's Earring",
		body="Ebers Bliaud +1", hands="Inyanga Dastanas +1", lring="Inyanga Ring", rring="Defending Ring",
		back="Felicitas Cape", waist="Austerity Belt", legs="Assid. Pants +1", feet="Inyanga Crackows +1"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1},		
		head="Inyanga Tiara +2", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Inyanga Ring", rring="Defending Ring",
		back="Cheviot Cape", waist="Fucho-no-Obi", legs="Assid. Pants +1", feet="Inyanga Crackows +1"}

	sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		head="Aya. Zucchetto +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		--hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Inyanga Dastanas +1", lring="Dark Ring", rring="Defending Ring",
		-- 
		back="Cheviot Cape", waist="Fucho-no-Obi",  legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.idle.Weak = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		head="Aya. Zucchetto +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",,
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Dark Ring", rring="Defending Ring",
		back="Cheviot Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

    -- Defense sets
	sets.defense.PDT = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		head="Aya. Zucchetto +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		--  hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Dark Ring", rring="Defending Ring",
		-- feet="Aya. Gambieras +1"
		back="Cheviot Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras"}

	sets.defense.MDT = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		head="Inyanga Tiara +2", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Dark Ring", rring="Defending Ring",
		back="Engulfer Cape", waist="Austerity Belt", legs="Inyanga Shalwar +1", feet="Inyanga Crackows +1"}			

    sets.defense.MEVA = {main={name="Earth Staff", priority=2}, sub={name="", priority=1},
		head="Inyanga Tiara +2", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
		--  
		body="Inyanga Jubbah +2", hands="Inyanga Dastanas +1", lring="Dark Ring", rring="Defending Ring",
		--
		back="Engulfer Cape", waist="Fucho-no-Obi", legs="Inyanga Shalwar +1", feet="Inyanga Crackows +1"}	
		
	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
    sets.engaged.Acc = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
    sets.engaged.DW = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}
		
    sets.engaged.DW.Acc = {
		head="Aya. Zucchetto +1", neck="Iqabi Necklace", lear="Merman's Earring", rear="Merman's Earring",
		-- hands="Aya. Manopolas +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas", lring="Rajas Ring", rring="Ramuh Ring",
		back="Cheviot Cape", waist="Goading Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +1"}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1", back="Mending Cape"}
	
	sets.HPDown = {}
		
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if player.sub_job == 'SCH' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end	
end