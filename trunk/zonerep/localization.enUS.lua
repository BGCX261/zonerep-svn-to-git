if ( GetLocale() == "enUS" ) then
	ZoneRep.L["an"] = "on";
	ZoneRep.L["aus"] = "off";
	ZoneRep.L["pirat"] = "pirate";
	ZoneRep.L["keinpirat"] = "nopirate";
	ZoneRep.L["status"] = "status";
	ZoneRep.L["hilfe"] = "help";
	ZoneRep.L["anzeigen"] = "show";
	ZoneRep.L["verstecken"] = "hide";
	ZoneRep.L["sperren"] = "lock";
	ZoneRep.L["freigeben"] = "unlock";
	
	ZoneRep.L["Inaktiv"] = "inactive";
		
	ZoneRep.L["ZoneRep geladen"] = "ZoneRep loaded";
	
	ZoneRep.L["ZoneRep aktiviert"] = "ZoneRep enabled";
	ZoneRep.L["ZoneRep deaktiviert"] = "ZoneRep disabled";
	
	ZoneRep.L["Du bist nun ein Pirat. Arrrrr."] = "You are a pirate. Arrrrr.";
	ZoneRep.L["Du bist kein Pirat mehr."] = "You're no longer a pirate.";
	
	ZR_HELP_LINES = { "ZoneRep help:",
	            "/zonerep "..ZoneRep.L["an"].." enables ZoneRep",
	            "/zonerep "..ZoneRep.L["aus"].." disables ZoneRep",
	            "/zonerep "..ZoneRep.L["anzeigen"].." displays the ZoneRep bar",
	            "/zonerep "..ZoneRep.L["verstecken"].." hides the ZoneRep bar",
	            "/zonerep "..ZoneRep.L["sperren"].." locks the ZoneRep bar",
	            "/zonerep "..ZoneRep.L["freigeben"].." unlocks the ZoneRep bar",
	            "/zonerep "..ZoneRep.L["pirat"].." activates pirate mode",
	            "/zonerep "..ZoneRep.L["keinpirat"].." deactivates pirate mode",
	            "/zonerep "..ZoneRep.L["hilfe"].." displays this help", };
	
	ZoneRep.L["Aktivieren"] = "Enable";
	ZoneRep.L["Balken anzeigen"] = "Show bar";
	ZoneRep.L["Sperren"] = "Lock";
	ZoneRep.L["Ruf"] = "Reputation";
	ZoneRep.L["Erfahrung"] = "Experience";
	ZoneRep.L["Besondere Fraktionen"] = "special factions";
	ZoneRep.L["Breite"] = "Width";
	ZoneRep.L["Höhe"] = "Height";
	
	-- Zones --
	ZoneRep.L["Schlingendorntal"] = "Stranglethorn Vale";
	ZoneRep.L["Westliche Pestländer"] = "Western Plaguelands";
	ZoneRep.L["Östliche Pestländer"] = "Eastern Plaguelands";
	ZoneRep.L["Scholomance"] = "Scholomance";
	ZoneRep.L["Stratholme"] = "Stratholme";
	ZoneRep.L["Winterquell"] = "Winterspring";
	ZoneRep.L["Brachland"] = "The Barrens";
	ZoneRep.L["Tanaris"] = "Tanaris";
	ZoneRep.L["Teufelswald"] = "Felwood";
	ZoneRep.L["Geschmolzener Kern"] = "Molten Core";
	ZoneRep.L["Zul'Gurub"] = "Zul'Gurub";
	ZoneRep.L["Silithus"] = "Silithus";
	ZoneRep.L["Ruinen von Ahn'Qiraj"] = "Ruins of Ahn'Qiraj";
	ZoneRep.L["Ahn'Qiraj"] = "Ahn'Qiraj";
	ZoneRep.L["Düsterbruch"] = "Dire Maul";
	ZoneRep.L["Kriegshymnenschlucht"] = "Warsong Gulch";
	ZoneRep.L["Alteractal"] = "Alterac Valley";
	ZoneRep.L["Arathibecken"] = "Arathi Basin";
	ZoneRep.L["Die sengende Schlucht"] = "Searing Gorge"
	ZoneRep.L["Karazhan"] = "Karazhan";
	ZoneRep.L["Orgrimmar"] = "Orgrimmar";
	ZoneRep.L["Donnerfels"] = "Thunder Bluff";
	ZoneRep.L["Unterstadt"] = "Undercity";
	ZoneRep.L["Silbermond"] = "Silvermoon";
	ZoneRep.L["Darnasus"] = "Darnasus";
	ZoneRep.L["Eisenschmiede"] = "Ironforge";
	ZoneRep.L["Sturmwind"] = "Stormwind";
	ZoneRep.L["Die Exodar"] = "The Exodar";
	
	-- Sub-Zones
	ZoneRep.L["Rabenholdt-Anwesen"] = "Ravenholdt Manor"
	ZoneRep.L["Die Insel Yojamba"] = "Yojamba Isle";
	ZoneRep.L["Die Frostfeuerquellen"] = "Frostfire Hot Springs";
	ZoneRep.L["Holzschlundfeste"] = "Timbermaw Hold";
	ZoneRep.L["Lager der Winterfelle"] = "Winterfall Village";
	ZoneRep.L["Das Kristalltal"] = "The Crystal Vale";
	ZoneRep.L["Höhlen der Zeit"] = "Caverns of Time";
	ZoneRep.L["Das Bollwerk"] = "The Bullwark";
	ZoneRep.L["Tal der Geister"] = "Valley of Spirits";
	ZoneRep.L["Tüftlerstadt"] = "Tinker Town";
	
	-- Factions --
	ZoneRep.L["Argentumdämmerung"] = "Argent Dawn";
	ZoneRep.L["Ewige Warte"] = "Everlook";
	ZoneRep.L["Ratschet"] = "Ratchet";
	ZoneRep.L["Gadgetzan"] = "Gadgetzan";
	ZoneRep.L["Beutebucht"] = "Booty Bay";
	ZoneRep.L["Holzschlundfeste"] = "Timbermaw Hold";
	ZoneRep.L["Hydraxianer"] = "Hydraxian Waterlords";
	ZoneRep.L["Stamm der Zandalar"] = "Zandalar Tribe";
	ZoneRep.L["Zirkel des Cenarius"] = "Cenarion Circle";
	ZoneRep.L["Brut Nozdormus"] = "Brood of Nozdormu";
	ZoneRep.L["Shen'dralar"] = "Shen'dralar";
	ZoneRep.L["Thorium-Bruderschaft"] = "Thorium Brotherhood"
	ZoneRep.L["Rabenholdt"] = "Ravenholdt"
	ZoneRep.L["Blutsegelbukaniere"] = "Bloodsail Buccaneers";
	ZoneRep.L["Orgrimmar"] = "Orgrimmar";
	ZoneRep.L["Donnerfels"] = "Thunder Bluff";
	ZoneRep.L["Unterstadt"] = "Undercity";
	ZoneRep.L["Silbermond"] = "Silvermoon City";
	ZoneRep.L["Darnasus"] = "Darnasus";
	ZoneRep.L["Eisenschmiede"] = "Ironforge";
	ZoneRep.L["Sturmwind"] = "Stormwind";
	ZoneRep.L["Die Exodar"] = "The Exodar";
	ZoneRep.L["Dunkelspeertrolle"] = "Darkspear"
	ZoneRep.L["Gnomeregangnome"] = "Gnomeregan Exiles"
	
	-- Alliance
	ZoneRep.L["Silberschwingenschildwache"] = "Silverwing Sentinels";
	ZoneRep.L["Stormpike Garde"] = "Stormpike Guard";
	ZoneRep.L["Bund von Arathor"] = "The League of Arathor";
	
	-- Horde
	ZoneRep.L["Kriegshymnenklan"] = "Warsong Outriders";
	ZoneRep.L["Frostwolfklan"] = "Frostwolf Clan";
	ZoneRep.L["Die Entweihten"] = "The Defilers";
	
	-- TBC Zones --
	ZoneRep.L["Höllenfeuerhalbinsel"] = "Hellfire Peninsula";
	ZoneRep.L["Zangarmarschen"] = "Zangarmarsh";
	ZoneRep.L["Shattrath"] = "Shattrath City";
	ZoneRep.L["Wälder von Terokkar"] = "Terokkar Forest";
	ZoneRep.L["Nagrand"] = "Nagrand";
	ZoneRep.L["Schattenmondtal"] = "Shadowmoon Valley";
	ZoneRep.L["Nethersturm"] = "Netherstorm";
	ZoneRep.L["Schergrat"] = "Blade's Edge Mountains";
	ZoneRep.L["Höllenfeuerbollwerk"] = "Hellfire Ramparts";
	ZoneRep.L["Der Blutkessel"] = "The Blood Furnace";
	ZoneRep.L["Die zerschmetterten Hallen"] = "The Shattered Halls";
	ZoneRep.L["Die Sklavenunterkünfte"] = "The Slave Pens";
	ZoneRep.L["Der Tiefensumpf"] = "The Underbog";
	ZoneRep.L["Die Dampfkammer"] = "The Steamvault";
	ZoneRep.L["Managruft"] = "Mana Tombs";
	ZoneRep.L["Auchenaikrypta"] = "Auchenai Crypts";
	ZoneRep.L["Sethekkhallen"] = "Sethekk Halls";
	ZoneRep.L["Schattenlabyrinth"] = "Shadow Labyrinth";
	ZoneRep.L["Die Mechanar"] = "The Mechanar";
	ZoneRep.L["Die Botanika"] = "The Botanica";
	ZoneRep.L["Die Arkatraz"] = "The Arcatraz";
	ZoneRep.L["Der Schwarze Tempel"] = "Black Temple";
	ZoneRep.L["Geisterlande"] = "Ghostlands";
	ZoneRep.L["Terrasse der Magister"] = "Magister's Terrace";
	ZoneRep.L["Hyjalgipfel"] = "Hyjal Summit";
	ZoneRep.L["Insel von Quel'Danas"] = "Sunwell Isle";
	
	-- Sub-Zones
	ZoneRep.L["Sehertreppe"] = "Scryer's Tier";
	ZoneRep.L["Aldorhöhe"] = "Aldor Rise";
	ZoneRep.L["Unteres Viertel"] = "Lower City";
	ZoneRep.L["Terrasse des Lichts"] = "Terrace of Light";
	ZoneRep.L["Sporeggar"] = "Sporeggar";
	ZoneRep.L["Kerker des Wächters"] = "Warden's Cage";
	ZoneRep.L["Festung der Stürme"] = "Tempest Keep";
	ZoneRep.L["Aerissteg"] = "Aeris Landing";
	ZoneRep.L["Geisterfelder"] = "Spirit Fields";
	ZoneRep.L["Oshu'gun"] = "Oshu'gun";
	ZoneRep.L["Netherschwingenfelder"] = "Netherwing Fields";
	ZoneRep.L["Netherschwingenscherbe"] = "Netherwing Ledge";
	ZoneRep.L["Festung des Drachenmals"] = "Dragonmaw Fortress";
	ZoneRep.L["Das Pilzgeflecht"] = "Spawning Glen";
	ZoneRep.L["Skettis"] = "Skettis";
	ZoneRep.L["Schattenwindlager"] = "Blackwind Landing";
	ZoneRep.L["Schattenwindsee"] = "Blackwind Lake";
	ZoneRep.L["Schattenwindtal"] = "Blackwind Valley";
	ZoneRep.L["Terokks Ruh"] = "Terokk's Rest";
	ZoneRep.L["Unteres Shil'akversteck"] = "Lower Veil Shil'ak";
	ZoneRep.L["Oberes Shil'akversteck"] = "Upper Veil Shil'ak";
	ZoneRep.L["Ala'rakversteck"] = "Veil Ala'rak";
	ZoneRep.L["Harr'ikversteck"] = "Veil Harr'ik";
	ZoneRep.L["Außenposten der Himmelswache"] = "Skyguard Outpost";
	ZoneRep.L["Ogri'la"] = "Ogri'la";
	ZoneRep.L["Vortexgipfel"] = "Vortex Pinnacle";
	ZoneRep.L["Obsidias Hort"] = "Obsidia's Perch";
	ZoneRep.L["Konstruktionslager: Terror"] = "Forge Camp: Terror";
	ZoneRep.L["Nachtreißers Hort"] = "Rivendark's Perch";
	ZoneRep.L["Shartuuls Transporter"] = "Shartuul's Transporter";
	ZoneRep.L["Konstruktionslager: Wut"] = "Forge Camp: Wrath";
	ZoneRep.L["Cenariusdickicht"] = "Cenarion Thicket";
	ZoneRep.L["Basislager der Sha'tari"] = "Sha'tari Base Camp";
	ZoneRep.L["Das Todesmoor"] = "Dead Mire";
	ZoneRep.L["Kil'jaedens Thron"] = "Throne of Kil'jaeden";
		ZoneRep.L["Bibliothek der Seher"] = "Bibliothek der Seher";
	
	-- TBC Factions --
	ZoneRep.L["Hüter der Zeit"] = "Keepers of Time";
	ZoneRep.L["Das Violette Auge"] = "The Violet Eye";
	ZoneRep.L["Die Todeshörigen"] = "Ashtongue Deathsworn";
	ZoneRep.L["Die Aldor"] = "The Aldor";
	ZoneRep.L["Die Seher"] = "The Scryers";
	ZoneRep.L["Die Sha'tar"] = "Sha'Tar";
	ZoneRep.L["Expedition des Cenarius"] = "Cenarion Expedition";
	ZoneRep.L["Sporeggar"] = "Sporeggar";
	ZoneRep.L["Das Konsortium"] = "The Consortium";
	ZoneRep.L["Die Wächter der Sande"] = "The Scale of the Sands";
	ZoneRep.L["Unteres Viertel"] = "Lower City";
	ZoneRep.L["Netherschwingen"] = "Netherwing";
	ZoneRep.L["Himmelswache der Sha'tari"] = "Sha'tari Skyguard";
	ZoneRep.L["Ogri'la"] = "Ogri'la";
	ZoneRep.L["Offensive der Zerschmetterten Sonne"] = "The Shattered Sun Offensive";
	
	-- Alliance
	ZoneRep.L["Ehrenfeste"] = "Honor Hold";
	ZoneRep.L["Kurenai"] = "Kurenai";
	
	-- Horde
	ZoneRep.L["Tristessa"] = "Tranquillien";
	ZoneRep.L["Thrallmar"] = "Thrallmar";
	ZoneRep.L["Die Mag'har"] = "The Mag'Har";
	
	-- WOTLK Zones
		ZoneRep.L["Das Ausmerzen von Stratholme"] = "Das Ausmerzen von Stratholme";
		ZoneRep.L["Das Oculus"] = "Das Oculus";
		ZoneRep.L["Turm Utgarde"] = "Turm Utgarde";
		ZoneRep.L["Die Hallen der Blitze"] = "Die Hallen der Blitze";
		ZoneRep.L["Die Hallen des Steins"] = "Die Hallen der Steine";
		ZoneRep.L["Die Violette Festung"] = "Die Violette Festung";
		ZoneRep.L["Gundrak"] = "Gun'Drak";
		ZoneRep.L["Azjol-Nerub"] = "Azjol-Nerub";
		ZoneRep.L["Ahn'kahet: Das alte Königreich"] = "Ahn'kahet: Das alte Königreich";
		ZoneRep.L["Der Nexus"] = "Der Nexus";
		ZoneRep.L["Burg Utgarde"] = "Burg Utgarde";
		ZoneRep.L["Feste Drak'Tharon"] = "Feste Drak'Tharon";
		ZoneRep.L["Der heulende Fjord"] = "Der heulende Fjord";
		ZoneRep.L["Boreanische Tundra"] = "Boreanische Tundra";
		ZoneRep.L["Grizzlyhügel"] = "Grizzlyhügel";
		ZoneRep.L["Eiskrone"] = "Eiskronengletscher";
		ZoneRep.L["Kristallsang"] = "Kristallsang";
		ZoneRep.L["Drachenöde"] = "Drachenöde";
		ZoneRep.L["Die Sturmgipfel"] = "Die Sturmgipfel";
		ZoneRep.L["Sholazarbecken"] = "Sholazarbecken";
		ZoneRep.L["Zul'Drak"] = "Zul'drak";
	
	-- Sub-Zones
		ZoneRep.L["Beryllspitze"] = "Beryllspitze";
		ZoneRep.L["Zuflucht der Funkenbesprühten"] = "Zuflucht der Funkenbesprühten";
		ZoneRep.L["Sonnenhäschers Zuflucht"] = "Sonnenhäschers Zuflucht";
		ZoneRep.L["Die Schwarze Wacht"] = "Die Schwarze Wacht";
		ZoneRep.L["Kaltarra"] = "Kaltarra";
		ZoneRep.L["Gallgrimm"] = "Gallgrimm";
		ZoneRep.L["Obsidiandrachenschrein"] = "Obsidiandrachenschrein";
		ZoneRep.L["Kaskala"] = "Kaskala";
		ZoneRep.L["Unu'pe"] = "Unu'pe";
		ZoneRep.L["Kriegshymnenfeste"] = "Kriegshymnenfeste";
		ZoneRep.L["Bronzedrachenschrein"] = "Bronzedrachenschrein";
		ZoneRep.L["Die Lichtwarte"] = "Die Lichtwarte";
		ZoneRep.L["Transitusschild"] = "Transitusschild";
		ZoneRep.L["Rubindrachenschrein"] = "Rubindrachenschrein";
		ZoneRep.L["Taunka'le"] = "Taunka'le";
		ZoneRep.L["Posten des Waldrands"] = "Posten des Waldrands";
		ZoneRep.L["Der Nexus"] = "Der Nexus";
		ZoneRep.L["Wyrmruhtempel"] = "Wyrmruhtempel";
		ZoneRep.L["Die Lichtbresche"] = "Die Lichtbresche";
		ZoneRep.L["Stahlkiefers Karawane"] = "Stahlkiefers Karawane";
		ZoneRep.L["Neltharions Schlund"] = "Neltharions Schlund";
		ZoneRep.L["Acherus: Die Schwarze Festung"] = "Acherus: Die Schwarze Festung";
		ZoneRep.L["Absturzstelle Grom'ash"] = "Absturzstelle Grom'ash";
		ZoneRep.L["Camp Oneqwah"] = "Camp Oneqwah";
		ZoneRep.L["Burg Siegeswall"] = "Burg Siegeswall";
		ZoneRep.L["Vorposten der Kor'kron"] = "Vorposten der Kor'kron";
		ZoneRep.L["Die Argentumvorhut"] = "Die Argentumvorhut";
		ZoneRep.L["Lager der Kreuzfahrer"] = "Lager der Kreuzfahrer";
		ZoneRep.L["Agmars Hammer"] = "Agmars Hammer";
		ZoneRep.L["Lager der Winterhufe"] = "Lager der Winterhufe";
		ZoneRep.L["Indu'le"] = "Indu'le";
		ZoneRep.L["Flüchtlingslager von Westwind"] = "Flüchtlingslager von Westwind";
		ZoneRep.L["Torps Bauernhof"] = "Torps Bauernhof";
		ZoneRep.L["Landebrücke des Kriegshymnenklans"] = "Landebrücke des Kriegshymnenklans";
		ZoneRep.L["Smaragddrachenschrein"] = "Smaragddrachenschrein";
		ZoneRep.L["Hafen Moa'ki"] = "Hafen Moa'ki";
		ZoneRep.L["Außenposten Bor'gorok"] = "Außenposten Bor'gorok";
		ZoneRep.L["Garroshs Landeplatz"] = "Garroshs Landeplatz";
		ZoneRep.L["Camp Tunka'lo"] = "Camp Tunka'lo";
	
	-- WOTLK Faction
		ZoneRep.L["Kirin Tor"] = "Kirin Tor";
	   	ZoneRep.L["Argentumkreuzzug"] = "Argent Crusade";
	  	ZoneRep.L["Ritter der Schwarzen Klinge"] = "Knights of the Ebon Blade";
		ZoneRep.L["Der Wyrmruhpakt"] = "Wyrmrest Accord";
	    ZoneRep.L["Die Söhne Hodirs"] = "Die Söhne Hodirs";
	    ZoneRep.L["Die Orakel"] = "Die Orakel";
	    ZoneRep.L["Stamm der Wildherzen"] = "Stamm der Wildherzen";
	    ZoneRep.L["Die Kalu'ak"] = "Die Kalu'ak";
	
	ZR_CHAMPION_FACTIONS = {
	    ["Champion of the Kirin Tor"] = ZoneRep.L["Kirin Tor"],
	    ["Argent Champion"] = ZoneRep.L["Argentumkreuzzug"],
	    ["Ebon Champion"] = ZoneRep.L["Ritter der Schwarzen Klinge"],
	    ["Wyrmrest Champion"] = ZoneRep.L["Der Wyrmruhpakt"]
	};
	
	-- Horde
		ZoneRep.L["Expedition der Horde"] = "Expedition der Horde";
		ZoneRep.L["Die Hand der Rache"] = "Die Hand der Rache";
		ZoneRep.L["Die Sonnenhäscher"] = "Die Sonnenhäscher";
		ZoneRep.L["Die Taunka"] = "Die Taunka";
		ZoneRep.L["Kriegshymnenoffensive"] = "Kriegshymnenoffensive";
	
	-- Alliance
	
	ZR_CONFIG_TOOLTIPS = {
	    [ZoneRep.L["Aktivieren"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."ZoneRep aktivieren"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Aktiviert die automatische auswahl der für die Zone relevantenten Fraktion",
	    },
	    [ZoneRep.L["Balken anzeigen"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Balken anzeigen"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Zeigt den zusätlichen Erfahrungs-/Rufbalken an",
	    },
	    [ZoneRep.L["Sperren"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Balken sperren"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Sperrt den Balken",
	    },
	    [ZoneRep.L["Ruf"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Ruf anzeigen"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Zeigt den Ruf bei der aktuell beobachteten Fraktion an",
	    },
	    [ZoneRep.L["Erfahrung"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Erfahrung anzeigen"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Zeigt die Erfahrung an",
	    },
	    [ZoneRep.L["Blutsegelbukaniere"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Ihr seid ein Pirat"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Ihr seid Mitglied der "..ZoneRep.L["Blutsegelbukaniere"]..",\ndas Dampfdruckkartell hasst euch",
	    },
	    [ZoneRep.L["Die Aldor"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Aldor"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Ihr seid ein Jünger der Aldor",
	    },
	    [ZoneRep.L["Die Seher"]] = {
	        ["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Scryer"..FONT_COLOR_CODE_CLOSE,
	        ["left2"] = "Ihr seid Anhänger der Seher",
	    },
		[ZoneRep.L["Breite"]] = {
			["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Balkenbreite"..FONT_COLOR_CODE_CLOSE,
			["left2"] = "Stellt die Breite des Balkens ein",
		},
		[ZoneRep.L["Höhe"]] = {
			["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Balkenhöhe"..FONT_COLOR_CODE_CLOSE,
			["left2"] = "Stellt die Höhe des Balkens ein",
		},
	};
end

