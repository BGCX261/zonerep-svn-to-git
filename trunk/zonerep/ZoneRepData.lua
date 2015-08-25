function ZoneRep:WotlkInstanceFaction(lvl)
	local diff = GetInstanceDifficulty();

	local faction = self:getFactionByBuff();

	if(diff == 2) then
		return faction;
	elseif(lvl == 80) then
		return faction;
	else
		-- should never happen
		return nil;
	end
end

function ZoneRep:getFactionByBuff()
	local faction;

	if(ZRstatus["faction"] == "Horde") then
		faction = self.L["Expedition der Horde"];
	else
		faction = self.L["blah"];
	end

	for k,v in pairs(ZR_CHAMPION_FACTIONS) do
		local name, _, _, _, _, _, _, _, _ = UnitBuff("player", k);

		if(name == k) then
			faction = v;
			break;
		end
	end

	return faction;
end

function ZoneRep:SetZoneList()
	self.ZoneList = {};
	self.SubZoneList ={};

	self.ZoneList[self.L["Westliche Pestländer"]] = function() return self.L["Argentumdämmerung"] end;
	self.ZoneList[self.L["Östliche Pestländer"]] = function() return self.L["Argentumdämmerung"] end;
	self.ZoneList[self.L["Scholomance"]] = function() return self.L["Argentumdämmerung"] end;
	self.ZoneList[self.L["Stratholme"]] = function() return self.L["Argentumdämmerung"] end;
	self.ZoneList[self.L["Winterquell"]] = function() return self.L["Ewige Warte"] end;
	self.ZoneList[self.L["Brachland"]] = function() return self.L["Ratschet"] end;
	self.ZoneList[self.L["Tanaris"]] = function() return self.L["Gadgetzan"] end;
	self.ZoneList[self.L["Schlingendorntal"]] = function() return self.L["Beutebucht"] end;
	self.ZoneList[self.L["Teufelswald"]] = function() return self.L["Holzschlundfeste"] end;
	self.ZoneList[self.L["Geschmolzener Kern"]] = function() return self.L["Hydraxianer"] end;
	self.ZoneList[self.L["Zul'Gurub"]] = function() return self.L["Stamm der Zandalar"] end;
	self.ZoneList[self.L["Silithus"]] = function() return self.L["Zirkel des Cenarius"] end;
	self.ZoneList[self.L["Ruinen von Ahn'Qiraj"]] = function() return self.L["Zirkel des Cenarius"] end;
	self.ZoneList[self.L["Ahn'Qiraj"]] = function() return self.L["Brut Nozdormus"] end;
	self.ZoneList[self.L["Düsterbruch"]] = function() return self.L["Shen'dralar"] end;
	self.ZoneList[self.L["Die sengende Schlucht"]] = function() return self.L["Thorium-Bruderschaft"] end;
	self.ZoneList[self.L["Karazhan"]] = function() return self.L["Das Violette Auge"] end;
	self.ZoneList[self.L["Orgrimmar"]] = function() return self.L["Orgrimmar"] end;
	self.ZoneList[self.L["Donnerfels"]] = function() return self.L["Donnerfels"] end;
	self.ZoneList[self.L["Unterstadt"]] = function() return self.L["Unterstadt"] end;
	self.ZoneList[self.L["Silbermond"]] = function() return self.L["Silbermond"] end;
	self.ZoneList[self.L["Darnasus"]] = function() return self.L["Darnasus"] end;
	self.ZoneList[self.L["Eisenschmiede"]] = function() return self.L["Eisenschmiede"] end;
	self.ZoneList[self.L["Sturmwind"]] = function() return self.L["Sturmwind"] end;
	self.ZoneList[self.L["Die Exodar"]] = function() return self.L["Die Exodar"] end;

	self.SubZoneList[self.L["Das Kristalltal"]] = function() return self.L["Hydraxianer"] end;
	self.SubZoneList[self.L["Die Frostfeuerquellen"]] = function() return self.L["Holzschlundfeste"] end;
	self.SubZoneList[self.L["Holzschlundfeste"]] = function() return self.L["Holzschlundfeste"] end;
	self.SubZoneList[self.L["Lager der Winterfelle"]] = function() return self.L["Holzschlundfeste"] end;
	self.SubZoneList[self.L["Die Insel Yojamba"]] = function() return self.L["Stamm der Zandalar"] end;
	self.SubZoneList[self.L["Zul'Gurub"]] = function() return self.L["Stamm der Zandalar"] end;
	self.SubZoneList[self.L["Das Bollwerk"]] = function() return self.L["Argentumdämmerung"] end;
	self.SubZoneList[self.L["Rabenholdt-Anwesen"]] = function() return self.L["Rabenholdt"] end;
	self.SubZoneList[self.L["Tal der Geister"]] = function() return self.L["Dunkelspeertrolle"] end;
	self.SubZoneList[self.L["Tüftlerstadt"]] = function() return self.L["Gnomeregangnome"] end;

	self.ZoneList[self.L["Schlingendorntal"]] = function() if (ZRstatus["pirate"] == "yes") then return self.L["Blutsegelbukaniere"] else return self.L["Beutebucht"] end end;

	self.ZoneList[self.L["Kriegshymnenschlucht"]] = function() if (ZRstatus["faction"] == "Horde") then return self.L["Kriegshymnenklan"] else return self.L["Silberschwingenschildwache"] end end;
	self.ZoneList[self.L["Alteractal"]] = function() if (ZRstatus["faction"] == "Horde") then return self.L["Frostwolfklan"] else return self.L["Stormpike Garde"] end end;
	self.ZoneList[self.L["Arathibecken"]] = function() if (ZRstatus["faction"] == "Horde") then return self.L["Die Entweihten"] else return self.L["Bund von Arathor"] end end;

	-- TBC --
	self.ZoneList[self.L["Shattrath"]] = function() return self.L["Die Sha'tar"] end;
	self.ZoneList[self.L["Höllenfeuerhalbinsel"]] = function() if (ZRstatus["faction"] == "Horde") then return self.L["Thrallmar"] else return self.L["Ehrenfeste"] end end;
	self.ZoneList[self.L["Zangarmarschen"]] = function() return self.L["Expedition des Cenarius"] end;
	self.ZoneList[self.L["Wälder von Terokkar"]] = function() return self.L["Unteres Viertel"] end;
	self.ZoneList[self.L["Nagrand"]] = function()  if (ZRstatus["faction"] == "Horde") then return self.L["Die Mag'har"] else return self.L["Kurenai"] end end;
	self.ZoneList[self.L["Schattenmondtal"]] = function()  if (ZRstatus["ald_scr"] == "scryer") then return self.L["Die Seher"] else return self.L["Die Aldor"] end end;
	self.ZoneList[self.L["Nethersturm"]] = function() return self.L["Das Konsortium"] end;
	self.ZoneList[self.L["Schergrat"]] = function() return self.L["Expedition des Cenarius"] end;
	self.ZoneList[self.L["Höllenfeuerbollwerk"]] = function() if (ZRstatus["faction"] == "Horde") then return self.L["Thrallmar"] else return self.L["Ehrenfeste"] end end;
	self.ZoneList[self.L["Der Blutkessel"]] = function() if (ZRstatus["faction"] == "Horde") then return self.L["Thrallmar"] else return self.L["Ehrenfeste"] end end;
	self.ZoneList[self.L["Die zerschmetterten Hallen"]] = function() if (ZRstatus["faction"] == "Horde") then return self.L["Thrallmar"] else return self.L["Ehrenfeste"] end end;
	self.ZoneList[self.L["Die Sklavenunterkünfte"]] = function() return self.L["Expedition des Cenarius"] end;
	self.ZoneList[self.L["Der Tiefensumpf"]] = function() return self.L["Expedition des Cenarius"] end;
	self.ZoneList[self.L["Die Dampfkammer"]] = function() return self.L["Expedition des Cenarius"] end;
	self.ZoneList[self.L["Managruft"]] = function() return self.L["Das Konsortium"] end;
	self.ZoneList[self.L["Auchenaikrypta"]] = function() return self.L["Unteres Viertel"] end;
	self.ZoneList[self.L["Sethekkhallen"]] = function() return self.L["Unteres Viertel"] end;
	self.ZoneList[self.L["Schattenlabyrinth"]] = function() return self.L["Unteres Viertel"] end;
	self.ZoneList[self.L["Die Mechanar"]] = function() return self.L["Die Sha'tar"] end;
	self.ZoneList[self.L["Die Botanika"]] = function() return self.L["Die Sha'tar"] end;
	self.ZoneList[self.L["Die Arkatraz"]] = function() return self.L["Die Sha'tar"] end;
	self.ZoneList[self.L["Der Schwarze Tempel"]] = function() return self.L["Die Todeshörigen"] end
	self.ZoneList[self.L["Geisterlande"]] = function() return self.L["Tristessa"] end;
	self.ZoneList[self.L["Terrasse der Magister"]] = function() return self.L["Offensive der Zerschmetterten Sonne"] end;
	self.ZoneList[self.L["Insel von Quel'Danas"]] = function() return self.L["Offensive der Zerschmetterten Sonne"] end;
	self.ZoneList[self.L["Hyjalgipfel"]] = function() return self.L["Die Wächter der Sande"] end;
	
	self.SubZoneList[self.L["Sehertreppe"]] = function() return self.L["Die Seher"] end;
	self.SubZoneList[self.L["Aldorhöhe"]] = function() return self.L["Die Aldor"] end;
	self.SubZoneList[self.L["Unteres Viertel"]] = function() return self.L["Unteres Viertel"] end;
	self.SubZoneList[self.L["Terrasse des Lichts"]] = function() return self.L["Die Sha'tar"] end;
	self.SubZoneList[self.L["Sporeggar"]] = function() return self.L["Sporeggar"] end;
	self.SubZoneList[self.L["Das Pilzgeflecht"]] = function() return self.L["Sporeggar"] end;
	self.SubZoneList[self.L["Das Todesmoor"]] = function() return self.L["Sporeggar"] end;
	self.SubZoneList[self.L["Kerker des Wächters"]] = function() return self.L["Die Todeshörigen"] end;
	self.SubZoneList[self.L["Festung der Stürme"]] = function() return self.L["Die Sha'tar"] end;
	self.SubZoneList[self.L["Aerissteg"]] = function() return self.L["Das Konsortium"] end;
	self.SubZoneList[self.L["Geisterfelder"]] = function() return self.L["Das Konsortium"] end;
	self.SubZoneList[self.L["Oshu'gun"]] = function() return self.L["Das Konsortium"] end;
	self.SubZoneList[self.L["Höhlen der Zeit"]] = function() return self.L["Hüter der Zeit"] end;
	self.SubZoneList[self.L["Karazhan"]] = function() return self.L["Das Violette Auge"] end;
	self.SubZoneList[self.L["Netherschwingenfelder"]] = function() return self.L["Netherschwingen"] end;
	self.SubZoneList[self.L["Netherschwingenscherbe"]] = function() return self.L["Netherschwingen"] end;
	self.SubZoneList[self.L["Festung des Drachenmals"]] = function() return self.L["Netherschwingen"] end;
	self.SubZoneList[self.L["Skettis"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Schattenwindlager"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Schattenwindsee"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Schattenwindtal"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Terokks Ruh"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Unteres Shil'akversteck"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Oberes Shil'akversteck"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Ala'rakversteck"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Harr'ikversteck"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Außenposten der Himmelswache"]] = function() return self.L["Himmelswache der Sha'tari"] end;
	self.SubZoneList[self.L["Ogri'la"]] = function() return self.L["Ogri'la"] end;
	self.SubZoneList[self.L["Vortexgipfel"]] = function() return self.L["Ogri'la"] end;
	self.SubZoneList[self.L["Obsidias Hort"]] = function() return self.L["Ogri'la"] end;
	self.SubZoneList[self.L["Konstruktionslager: Terror"]] = function() return self.L["Ogri'la"] end;
	self.SubZoneList[self.L["Nachtreißers Hort"]] = function() return self.L["Ogri'la"] end;
	self.SubZoneList[self.L["Shartuuls Transporter"]] = function() return self.L["Ogri'la"] end;
	self.SubZoneList[self.L["Konstruktionslager: Wut"]] = function() return self.L["Ogri'la"] end;
	self.SubZoneList[self.L["Cenariusdickicht"]] = function() return self.L["Expedition des Cenarius"] end;
	self.SubZoneList[self.L["Basislager der Sha'tari"]] = function() return self.L["Die Sha'tar"] end;
	self.SubZoneList[self.L["Kil'jaedens Thron"]] = function() return self.L["Offensive der Zerschmetterten Sonne"] end;
	self.SubZoneList[self.L["Bibliothek der Seher"]] = function() return self.L["Die Seher"] end;

	-- WotLK
	self.ZoneList[self.L["Das Ausmerzen von Stratholme"]] =           function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Das Oculus"]] =              function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Turm Utgarde"]] =     function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Die Hallen der Blitze"]] =  function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Die Hallen des Steins"]] =      function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Die Violette Festung"]] =         function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Gundrak"]] =             function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Azjol-Nerub"]] =         function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Ahn'kahet: Das Alte Königreich"]] =           function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Der Nexus"]] =               function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Burg Utgarde"]] =        function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Feste Drak'Tharon"]] =         function() return self:WotlkInstanceFaction(0); end
	self.ZoneList[self.L["Der heulende Fjord"]] =	function() if(ZRstatus["faction"] == "Horde") then return self.L["Expedition der Horde"]; else return self.L["blah"]; end end
	self.ZoneList[self.L["Boreanische Tundra"]] =	function() if(ZRstatus["faction"] == "Horde") then return self.L["Expedition der Horde"]; else return self.L["blah"]; end end
	self.ZoneList[self.L["Grizzlyhügel"]] =	function() if(ZRstatus["faction"] == "Horde") then return self.L["Expedition der Horde"]; else return self.L["blah"]; end end
	self.ZoneList[self.L["Eiskrone"]] =		function() if(ZRstatus["faction"] == "Horde") then return self.L["Expedition der Horde"]; else return self.L["blah"]; end end
	self.ZoneList[self.L["Kristallsang"]] =		function() if(ZRstatus["faction"] == "Horde") then return self.L["Expedition der Horde"]; else return self.L["blah"]; end end
	self.ZoneList[self.L["Drachenöde"]] =	function() return self.L["Der Wyrmruhpakt"]; end
	self.ZoneList[self.L["Die Sturmgipfel"]] =		function() return self.L["Die Söhne Hodirs"]; end
	self.ZoneList[self.L["Sholazarbecken"]] =		function() if(ZRstatus["oracle"] == 1) then return self.L["Die Orakel"]; else return self.L["Stamm der Wildherzen"]; end end
	self.ZoneList[self.L["Zul'Drak"]] =		function() return self.L["Argentumkreuzzug"]; end
	self.ZoneList[self.L["Dalaran"]] =		function() return self.L["Kirin Tor"]; end
	self.ZoneList[self.L["Prüfung des Champions"]] =  function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Die Seelenschmiede"]] =  function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Grube von Saron"]] =  function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Die Hallen der Reflexion"]] =  function() return self:WotlkInstanceFaction(80); end
	self.ZoneList[self.L["Eiskronenzitadelle"]] =		function() return self.L["Das Äscherne Verdikt"]; end
	
	self.SubZoneList[self.L["Beryllspitze"]] = function() return self.L["Kirin Tor"]; end;
	self.SubZoneList[self.L["Zuflucht der Funkenbesprühten"]] = function() return self.L["Die Orakel"]; end;
	self.SubZoneList[self.L["Sonnenhäschers Zuflucht"]] = function() return self.L["Die Sonnenhäscher"]; end;
	self.SubZoneList[self.L["Die Schwarze Wacht"]] = function() return self.L["Ritter der Schwarzen Klinge"]; end;
	self.SubZoneList[self.L["Kaltarra"]] = function() return self.L["Kirin Tor"]; end;
	self.SubZoneList[self.L["Gallgrimm"]] = function() return self.L["Die Hand der Rache"]; end;
	self.SubZoneList[self.L["Obsidiandrachenschrein"]] = function() return self.L["Der Wyrmruhpakt"]; end;
	self.SubZoneList[self.L["Kaskala"]] = function() return self.L["Die Kalu'ak"]; end;
	self.SubZoneList[self.L["Unu'pe"]] = function() return self.L["Die Kalu'ak"]; end;
	self.SubZoneList[self.L["Kamagua"]] = function() return self.L["Die Kalu'ak"]; end;
	self.SubZoneList[self.L["Kriegshymnenfeste"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Bronzedrachenschrein"]] = function() return self.L["Der Wyrmruhpakt"]; end;
	self.SubZoneList[self.L["Die Lichtwarte"]] = function() return self.L["Argentumkreuzzug"]; end;
	self.SubZoneList[self.L["Transitusschild"]] = function() return self.L["Kirin Tor"]; end;
	self.SubZoneList[self.L["Rubindrachenschrein"]] = function() return self.L["Der Wyrmruhpakt"]; end;
	self.SubZoneList[self.L["Taunka'le"]] = function() return self.L["Die Taunka"]; end;
	self.SubZoneList[self.L["Posten des Waldrands"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Der Nexus"]] = function() return self.L["Kirin Tor"]; end;
	self.SubZoneList[self.L["Wyrmruhtempel"]] = function() return self.L["Der Wyrmruhpakt"]; end;
	self.SubZoneList[self.L["Die Lichtbresche"]] = function() return self.L["Argentumkreuzzug"]; end;
	self.SubZoneList[self.L["Stahlkiefers Karawane"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Neltharions Schlund"]] = function() return self.L["Der Wyrmruhpakt"]; end;
	self.SubZoneList[self.L["Acherus: Die Schwarze Festung"]] = function() return self.L["Ritter der Schwarzen Klinge"]; end;
	self.SubZoneList[self.L["Absturzstelle Grom'ash"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Camp Oneqwah"]] = function() return self.L["Die Taunka"]; end;
	self.SubZoneList[self.L["Burg Siegeswall"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Vorposten der Kor'kron"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Die Argentumvorhut"]] = function() return self.L["Argentumkreuzzug"]; end;
	self.SubZoneList[self.L["Lager der Kreuzfahrer"]] = function() return self.L["Argentumkreuzzug"]; end;
	self.SubZoneList[self.L["Agmars Hammer"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Lager der Winterhufe"]] = function() return self.L["Die Taunka"]; end;
	self.SubZoneList[self.L["Indu'le"]] = function() return self.L["Die Kalu'ak"]; end;
	self.SubZoneList[self.L["Flüchtlingslager von Westwind"]] = function() return self.L["Die Taunka"]; end;
	self.SubZoneList[self.L["Torps Bauernhof"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Landebrücke des Kriegshymnenklans"]] = function() return self.L["Die Kalu'ak"]; end;
	self.SubZoneList[self.L["Smaragddrachenschrein"]] = function() return self.L["Der Wyrmruhpakt"]; end;
	self.SubZoneList[self.L["Hafen Moa'ki"]] = function() return self.L["Die Kalu'ak"]; end;
	self.SubZoneList[self.L["Außenposten Bor'gorok"]] = function() return self.L["Kriegshymnenoffensive"]; end;
	self.SubZoneList[self.L["Garroshs Landeplatz"]] = function() return self.L["Die Kalu'ak"]; end;
	self.SubZoneList[self.L["Camp Tunka'lo"]] = function() return self.L["Die Taunka"]; end;
	self.SubZoneList[self.L["Das Schattengewölbe"]] = function() return self.L["Ritter der Schwarzen Klinge"]; end;
	self.SubZoneList[self.L["Todesanhöhe"]] = function() return self.L["Ritter der Schwarzen Klinge"]; end;
	self.SubZoneList[self.L["Sonnenhäscherpavillon"]] = function() return self.L["Die Sonnenhäscher"]; end;
end
