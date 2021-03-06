function user_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Tank', 'DDTank', 'BreathTank', 'NoShellTank', 'Reraise', 'Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'PDT_HP', 'PDT_Reraise', 'Tank')
    state.MagicalDefenseMode:options('BDT','MDT_HP','AegisMDT','AegisNoShellMDT','OchainMDT','OchainNoShellMDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm')
	state.IdleMode:options('Normal','Tank','KiteTank','PDT','MDT','Refresh','Reraise')
	state.Weapons:options('Default','DDWeapons','DualWeapons')
	    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Twilight'}
	
	-- Augmented Capes
	gear.phalanx_jse_back = {name="Weard Mantle", augments={'VIT+1','DEX+1','Enmity+2','Phalanx +3',}}	
	gear.TP_jse_back = {name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.WS_jse_back = {name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.WS_Req_jse_back = {name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}
	gear.Enmity_jse_back = {name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}}
	gear.fastcast_jse_back = {name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}}
	
	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
    send_command('bind @f10 gs c toggle EquipShield')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {ammo="Paeapua",
		-- Loess Barbuta +1 lear="Trux Earring", 
		head="Souv. Schaller +1", neck="Moonbeam Necklace", rear="Cryptic Earring",
		-- Yorium Gauntlets Apeile Ring +1 rring="Apeile Ring"
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Vengeful Ring", rring="Apeile Ring",
		-- Obyssean Cuisses Eschite Greaves path A
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.Enmity.DT = { ammo="Paeapua",
		-- Loess Barbuta +1 lear="Trux Earring", rear="Cryptic Earring",
		head="Souv. Schaller +1", neck="Moonbeam Necklace", 
		--  Yorium Gauntlets Apeile Ring +1 rring="Apeile Ring"
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Vengeful Ring", rring="Apeile Ring",
		-- Obyssean Cuisses Eschite Greaves path A
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{}) -- feet="Chev. Sabatons +1"
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {head="Rev. Coronet +1",body="Cab. Surcoat +1"})
	
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{}) -- feet="Chev. Sabatons +1"
   	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
		--ear1="Nourish. Earring",
		head="Carmine Mask +1",neck="Phalaina Locket",ear1="Nourish. Earring +1",
		body="Cab. Surcoat +1",hands="Cab. Gauntlets +1",ring1="Stikini Ring",ring2="Rufescent Ring",
		back=gear.enmity_jse_back,waist="Salire Belt",legs="Mes'yohi Slacks",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {lear="Knightly Earring", hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {lear="Knightly Earring",hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Carmine Mask +1",
		--body="Rev. Surcoat +3", ring2="Valseur's Ring",
		ring1="Asklepian Ring",
		waist="Chaac Belt",legs="Sulev. Cuisses +2"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
   
	-- ACC
    sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Ramuh Ring +1", rring="Rajas Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}
	-- Macc
	sets.precast.JA['Violent Flourish'] = {ammo="Ginsen",
        head="Founder's Corona",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Found. Breastplate",hands="Leyline Gloves",ring1="Defending Ring",ring2="Stikini Ring",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells    
    sets.precast.FC = {ammo="Staunch tathlum",
		-- neck="Voltsurge Torque", Odnowa Earring 
		head="Carmine Mask +1", neck="Moonbeam Necklace", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Reverence Surcoat +3 lring="Kishar Ring",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Prolix Ring",
		-- FC Legs
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.precast.FC.DT = {ammo="Staunch tathlum",
		-- Odnowa Earring
		head="Carmine Mask +1", neck="Moonbeam Necklace", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Reverence Surcoat +3 lring="Kishar Ring",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Prolix Ring",
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		--neck="Diemer Gorget",ear1="Nourish. Earring",
		ear1="Nourish. Earring +1",
		body="Jumalik Mail"})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		-- Lust. Cap +1
		head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- Lustr. Harness +1 Lustr.	Mittens +1 
		body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		--  Lustra. Leggings +1
		back=gear.WS_jse_back, waist="Fotia Belt", legs="Lustr. Subligar +1", feet="Sulev. Leggings +2"}
	
    sets.precast.WS.DT = {ammo="Staunch Tathlum",
		-- Loricate Torque +1
		head="Souveran Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- 
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		-- 
		back="Moonbeam Cape", waist="Flume Belt", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.precast.WS.Acc = {ammo="Ginsen",
		head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		back=gear.WS_jse_back, waist="Fotia Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS,{ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.WS_Req_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Carmine Mail +1 
		body="Flamma Korazin +1", hands="Carmine Fin. Ga. +1", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.WS_Req_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Lust. Cap +1 A
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Lustr. Mittens +1 A  Begrudging Ring
		body="Flamma Korazin +1", hands="Flam. Manopolas +1",
		-- Lustra. Leggings +1 D
		back=gear.WS_jse_back, waist="Chiner's Belt +1", legs="Lustr. Subligar +1", feet="Sulev. Leggings +2"})	
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Hasty Pinion +1",
		-- Lust. Cap +1
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Lustr. Mittens +1  Begrudging Ring
		body="Flamma Korazin +1", hands="Flam. Manopolas +1",  lring="Ramuh Ring +1", rring="Rajas Ring",
		-- Rudianos's Cape Lustra. Leggings +1
		back=gear.WS_jse_back, waist="Chiner's Belt +1", legs="Lustr. Subligar +1", feet="Sulev. Leggings +2"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Ginsen",
		-- Valorous Mask 
		head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Valor/Emicho Body +1  Rufuscent Ring
		body="Flamma Korazin +1", hands="Sulev. Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		-- Metalsinger Belt 
		back=gear.WS_jse_back, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +2"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
		back=gear.WS_jse_back, waist="Wanion Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +2"})

	-- Macc
	sets.precast.WS['Flat Blade'] = {ammo="Ginsen",
		-- ear2="Digni. Earring",
		head="Flam. Zucchetto +1",neck="Sanctity Necklace",ear1="Gwati Earring", ear2="Moonshade Earring",
        body="Flamma Korazin +1",hands="Flam. Manopolas +1",ring1="Ramuh Ring +1",ring2="Stikini Ring",
        back="Ground. Mantle +1",waist="Eschan Stone",legs="Flamma Dirs +1",feet="Flam. Gambieras +1"}
	
	sets.precast.WS['Flat Blade'].Acc = {ammo="Ginsen",
		-- ear2="Digni. Earring",
        head="Flam. Zucchetto +1",neck="Sanctity Necklace",ear1="Gwati Earring", ear2="Moonshade Earring",
        body="Flamma Korazin +1",hands="Flam. Manopolas +1",ring1="Ramuh Ring +1",ring2="Stikini Ring",
        back="Ground. Mantle +1",waist="Eschan Stone",legs="Flamma Dirs +1",feet="Flam. Gambieras +1"}
	
	-- MAB
    sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
        head="Jumalik Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Jumalik Mail",hands="Founder's Gauntlets",ring1="Shiva Ring +1",ring2="Archon Ring",
        back="Toro Cape",waist="Fotia Belt",legs="Flamma Dirs +1",feet="Founder's Greaves"}

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']

    sets.precast.WS['Atonement'] = {ammo="Paeapua",
		--head="Loess Barbuta +1", ear2="Ishvara Earring",
		neck="Fotia Gorget", ear2="Moonshade Earring",
		--body=gear.valorous_wsd_body, hands=gear.odyssean_wsd_hands,
		body="Flamma Korazin +1", ring1="Moonbeam Ring", ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Fotia Belt",legs="Flamma Dirs +1", feet="Sulev. Leggings +2"}

    sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']
	
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
		-- Founder/obyssean
		head="Jumalik Helm", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		-- Carmine Mail +1  Carmine Fin. Ga. +1
		body="Jumalik Mail", hands="Founder's Gauntlets",  lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Aug.Cape.PLD.MAB Yamabuki-no-Obi 
		back=gear.WS_jse_back, waist="Wanion Belt", legs="Founder's Hose", feet="Sulev. Leggings +2"})
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring",}
	sets.AccMaxTP = {ear1="Zwaso Earring",ear2="Cessance Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {ammo="Paeapua",
        --head="Chev. Armet +1",
		neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        --body="Rev. Surcoat +3", ring2="Kishar Ring",
		hands="Leyline Gloves", ring1="Defending Ring",
		--legs=gear.odyssean_fc_legs, feet="Odyssean Greaves"
        waist="Tempus Fugit",}		
		
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
		-- Odnowa Earring
        head="Souv. Schaller +1",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
        --body="Rev. Surcoat +3",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum",
		--
		head="Souv. Schaller +1", neck="Moonbeam Necklace", lear="Nourish. Earring +1", rear="Knightly Earring",
		-- hands="Macabre Gaunt. +1"
		body="Jumalik Mail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="K'ayres Ring",
		--  Solemnity Cape Rumination Sash  Odyssean Greaves
		back=gear.Enmity_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet="Souveran Schuhs +1"}

    sets.midcast.Cure.DT = {ammo="Staunch Tathlum",
		-- ear2="Odnowa Earring", 
        head="Souv. Schaller +1", neck="Loricate Torque", ear1="Odnowa Earring +1",ear2="Etiolation Earring",
        --body="Rev. Surcoat +3",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", ring1="Moonbeam Ring", ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.midcast.Reprisal = {ammo="Staunch Tathlum",
		-- Odnowa Earring +1
		head="Souv. Schaller +1", neck="Dualism Collar", lear="Odnowa Earring +1", rear="Etiolation Earring",
		--lring="Eihwaz Ring"
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="K'ayres Ring",
		-- Reiki Cloak
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.Self_Healing = {ammo="Staunch Tathlum",
		head="Souv. Schaller +1", neck="Moonbeam Necklace", lear="Nourish. Earring +1", rear="Knightly Earring",
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="K'ayres Ring",
		--  Solemnity Cape Odyssean Greaves
		back=gear.Enmity_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet="Souveran Schuhs +1"}
		
	sets.Self_Healing.DT = {ammo="Staunch Tathlum",
		--ear2="Odnowa Earring",
        head="Souv. Schaller +1",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		--  body="Rev. Surcoat +3", ring2=Moonbeam Ring
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.Cure_Received = {head="Souv. Schaller +1", hands="Souv. Handsch. +1",legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash",feet="Shab. Sabatons +1"}

    sets.midcast['Enhancing Magic'] = {
		-- Incanter Torque
		head="Souv. Schaller +1", neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
		-- body="Shabti Cuirass",
		body="Souv. Cuirass +1", lring="Stikini Ring", rring="Stikini Ring",
		back="Merciful Cape", waist="Olympus Sash", legs="Carmine Cuisses +1"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		-- Obyssean Helm Phalanx +5 Incanter Torque
		head="Carmine Mask +1", neck="Moonbeam Necklace", lear="Knightly Earring", rear="Andoaa Earring",
		-- body="Shabti Cuirass", Apeile Ring +1
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Vengeful Ring", rring="Apeile Ring",
		-- Obyssean Cuisses Phalanx +5 
		back="Weard Mantle", waist="Rumination Sash", legs="Carmine Cuisses +1", feet="Souveran Schuhs +1"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Homiliary",
		-- neck="Coatl Gorget +1",
		head="Jumalik Helm", neck="Loricate Torque", ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Sulev. Cuisses +1",feet="Souveran Schuhs +1"}

    -- Idle sets
    sets.idle = {ammo="Homiliary",
		-- neck="Coatl Gorget +1",
		head="Jumalik Helm", neck="Loricate Torque", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum",
		-- Combatant's Torque Thureous Earring
		head="Souveran Schaller +1", neck="Loricate Torque", ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- Chev. Gauntlets +1
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		-- Chev Cuisses +1 
		back="Moonbeam Cape", waist="Flume Belt", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.idle.MDT = {ammo="Staunch Tathlum",
		-- neck="Warder's Charm +1", ear2="Sanare Earring",
		head="Jumalik Helm",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.fastcast_jse_back,waist="Flume Belt",legs="Souv. Diechlings +1",feet="Founder's Greaves"}
		
	sets.idle.Refresh = {ammo="Homiliary",
		--neck="Coatl Gorget +1",
		head="Jumalik Helm",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.idle.Tank = {ammo="Staunch Tathlum",
		--head="Chev. Armet +1", ear1="Creed Earring", ear2="Thureous Earring"
		head="Souveran Schaller +1",neck="Loricate Torque", ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Souv. Cuirass +1",hands="Souv. Handsch. +1",ring1="Shadow Ring",ring2="Defending Ring",
		-- legs="Chev. Cuisses +1", Shadow
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.idle.KiteTank = {ammo="Staunch Tathlum",
		--head="Loess Barbuta +1",ear2="Thureous Earring",
		head="Souveran Schaller +1",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Shadow Ring",ring2="Defending Ring",
		-- feet="Hippo. Socks +1"
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
		
    sets.idle.Reraise = {ammo="Staunch Tathlum",
		--
		head="Twilight Helm",neck="Loricate Torque",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
		
    sets.idle.Weak = {ammo="Staunch Tathlum",
		-- ear2="Thureous Earring",
		head="Souveran Schaller +1",neck="Loricate Torque",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
		-- Moonbeam Ring
		body="Souv. Cuirass +1", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	-- Weapon Set
	sets.weapons.Default = {main="Burtgang",sub="Aegis"}
	sets.weapons.DDWeapons = {main="Burtgang",sub="Aegis"}
    sets.weapons.DualWeapons = {main="Burtgang",sub="Tanmogayi +1"}
	
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt"}
    sets.MP_Knockback = {}
    sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"}
    sets.MagicalShield = {sub="Aegis"}
	
    sets.defense.PDT = {ammo="Staunch Tathlum",
		-- head="Chev. Armet +1", ear2="Thureous Earring",
		head="Souv. Schaller +1", neck="Loricate Torque", ear1="Odnowa Earring +1", ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_HP = {ammo="Staunch Tathlum",
		-- ear2="Odnowa Earring",
        head="Souv. Schaller +1",neck="Loricate Torque",ear1="Odnowa Earring +1", ear2="Etiolation Earring",
        --body="Rev. Surcoat +3", ring2="Moonbeam Ring",
		body="Tartarus Platemail", hands="Souv. Handsch. +1",ring1="Moonbeam Ring", ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_HP = {ammo="Staunch Tathlum",
		-- ear2="Odnowa Earring",
        head="Souv. Schaller +1",neck="Loricate Torque",ear1="Odnowa Earring +1", ear2="Etiolation Earring",
		--body="Rev. Surcoat +3", ring2="Moonbeam Ring",
		body="Tartarus Platemail", hands="Souv. Handsch. +1",ring1="Moonbeam Ring", ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}
		
    sets.defense.MEVA_HP = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque",ear1="Odnowa Earring +1", ear2="Etiolation Earring",
        --body="Rev. Surcoat +3", ring2="Moonbeam Ring",
		body="Tartarus Platemail", hands="Souv. Handsch. +1",ring1="Moonbeam Ring",  ring2="Defending Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_Reraise = {ammo="Staunch Tathlum",
		--ear2="Thureous Earring",
        head="Twilight Helm",neck="Loricate Torque", ear1="Odnowa Earring +1", ear2="Etiolation Earring",
		-- hands="Macabre Gaunt. +1",
        body="Twilight Mail", hands="Souv. Handsch. +1", ring1="Moonbeam Ring", ring2="Defending Ring",
		-- legs="Arke Cosciales",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_Reraise = {ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Twilight Mail", hands="Souv. Handsch. +1", ring1="Moonbeam Ring", ring2="Defending Ring",
		-- feet="Cab. Leggings +1"
		back="Engulfer Cape +1",waist="Flume Belt", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.defense.BDT = {ammo="Staunch Tathlum",
		-- Odnowa Earring
		head="Souveran Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", ear2="Etiolation Earring",
		-- Souv. Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}			
	
	sets.defense.Tank = {ammo="Staunch Tathlum",
		-- ear1="Creed Earring", ear2="Thureous Earring",
		head="Souv. Schaller +1",neck="Loricate Torque", lear="Odnowa Earring +1", ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1", ring1="Shadow Ring", ring2="Defending Ring",
		-- Chev. Cuisses +1
		back="Shadow Mantle",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		-- neck="Warder's Charm +1", ear2="Sanare Earring",
        head="Founder's Corona",neck="Loricate Torque", lear="Odnowa Earring +1", ear2="Etiolation Earring",
		-- ring2="Purity Ring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring", ring2="Defending Ring",
		--waist="Asklepian Belt",
        back=gear.fastcast_jse_back,waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum",
		-- neck="Warder's Charm +1", ear2="Sanare Earring",
        head="Founder's Corona",neck="Loricate Torque",lear="Odnowa Earring +1",ear2="Etiolation Earring",
		-- ring1="Warden's Ring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Shadow Ring",ring2="Defending Ring",
		-- waist="Asklepian Belt", legs=gear.odyssean_fc_legs,
        back=gear.fastcast_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum",
		-- neck="Unmoving Collar +1", ear2="Sanare Earring",
        head="Founder's Corona",neck="Moonbeam Necklace",lear="Odnowa Earring +1", ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		-- waist="Asklepian Belt"
        back="Solemnity Cape",waist="Creed Baudrier", legs="Souv. Diechlings +1",feet="Odyssean Greaves"}
		
		-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = {ammo="Staunch Tathlum",
		-- Founder's Corona Warder's Charm +1 Spellbr. Earring  Sanare Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		-- Lunette Ring +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",				
		back="Engulfer Cape +1", waist="Creed Baudrier", legs="Mes'yohi Slacks", feet="Sulev. Leggings +2"}

    sets.defense.OchainNoShellMDT = {ammo="Staunch Tathlum",
		-- Founder's Corona Warder's Charm +1 Sanare Earring Spellbound. Earring 
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		-- Lunette Ring +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",
		-- Moonbeam Cape Flax Sash Cab Leggings +1
		back="Engulfer Cape +1", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.defense.AegisMDT = {ammo="Staunch Tathlum",
		-- Founder's Corona Warder's Charm +1 Spellbr. Earring  Sanare Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		-- Lunette Ring +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",				
		back="Engulfer Cape +1", waist="Creed Baudrier", legs="Mes'yohi Slacks", feet="Sulev. Leggings +2"}

    sets.defense.AegisNoShellMDT = {ammo="Staunch Tathlum",
		-- Founder's Corona Warder's Charm +1 Sanare Earring Spellbound. Earring 
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
		-- Lunette Earring
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",
		-- Moonbeam Cape Flax Sash Cab Leggings +1
		back="Engulfer Cape +1", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- Souveran Cuirass +1 
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Rajas Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Souv. Diechlings +1", feet="Carmine Greaves +1"}

    sets.engaged.Acc = { ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- Souveran Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Ramuh Ring +1", rring="Rajas Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.engaged.DW = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		-- Souveran Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Ramuh Ring +1", rring="Rajas Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		-- Souveran Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Ramuh Ring +1", rring="Rajas Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.engaged.Tank = {ammo="Staunch Tathlum",
		-- Odnowa Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Zwazo Earring",
		-- Souveran Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.BreathTank = {ammo="Staunch Tathlum",
		-- Odnowa Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Zwazo Earring",
		-- Souveran Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.Acc.BreathTank = {ammo="Staunch Tathlum",
		-- Odnowa Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Zwazo Earring",
		-- Souveran Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.DDTank = {ammo="Hasty Pinion +1",
		-- Odnowa Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Zwazo Earring",
		-- Souveran Cuirass +1
		body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}
	
	sets.engaged.Acc.DDTank = {ammo="Hasty Pinion +1",
		-- Odnowa Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Zwazo Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

	sets.engaged.NoShellTank = {ammo="Staunch Tathlum",
       -- Odnowa Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Zwazo Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.engaged.Acc.Tank = {ammo="Ginsen",
       -- Odnowa Earring
		head="Souv. Schaller +1", neck="Loricate Torque", lear="Odnowa Earring +1", rear="Zwazo Earring",
		body="Souveran Cuirass +1", hands="Souv. Handsch. +1", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Souveran Schuhs +1"}

    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)

    sets.engaged.DW.Tank = set_combine(sets.engaged.DW, {neck="Loricate Torque",ring1="Defending Ring",ring2="Patricius Ring"})
    sets.engaged.DW.Acc.Tank = set_combine(sets.engaged.DW.Acc, {neck="Loricate Torque",ring1="Defending Ring",ring2="Patricius Ring"})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'RUN' then
        set_macro_page(6, 16)
    elseif player.sub_job == 'RDM' then
        set_macro_page(5, 16)
    elseif player.sub_job == 'BLU' then
        set_macro_page(4, 16)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 16)
    else
        set_macro_page(3, 16) --War/Etc
    end
end