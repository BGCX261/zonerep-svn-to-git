if (GetLocale() == "deDE") then
	GA_GUILD_PATTERN = "^|Hchannel:Guild";
	
	GA_MAIN = "Main";
	GA_ALT = "Twink";
	GA_NOTE = "öffentliche Notiz";
	GA_OFFICER_NOTE = "Offiziersnotiz";
	GA_ADD = "Hinzufügen";
	
	GA_MAIN_TOOLTIP = {
		["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Name des Main-Charakters"..FONT_COLOR_CODE_CLOSE,
		["left2"] = "* für die automatische Suche",
	};
	GA_ALT_TOOLTIP = {
		["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Name des Twinks"..FONT_COLOR_CODE_CLOSE,
		["left2"] = "Bei der automatischen Suche leer lassen oder ein Suchmuster eingeben.",
		["left3"] = "Bsp.: MA ?= ?(%a+)",
	};
	GA_NOTE_TOOLTIP = {
		["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."öffentliche Notiz durchsuchen"..FONT_COLOR_CODE_CLOSE,
		["left2"] = "Durchsucht die öffentliche Notiz,\nwenn die automatische Suche genutzt wird.",
	};
	GA_OFFICER_NOTE_TOOLTIP = {
		["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Offiziersnotiz durchsuchen"..FONT_COLOR_CODE_CLOSE,
		["left2"] = "Durchsucht die Offiziersnotiz,\nwenn die automatische Suche genutzt wird.",
	};
	
	GA_CLASSNAMES = {
		["Druide"] = "DRUID",
		["Druidin"] = "DRUID",
		["J\195\164ger"] = "HUNTER",
		["J\195\164gerin"] = "HUNTER",
		["Schurke"] = "ROGUE",
		["Schurkin"] = "ROGUE",
		["Magier"] = "MAGE",
		["Magierin"] = "MAGE",
		["Paladin"] = "PALADIN",
		["Priester"] = "PRIEST",
		["Priesterin"] = "PRIEST",
		["Schamane"] = "SHAMAN",
		["Schamanin"] = "SHAMAN",
		["Hexenmeister"] = "WARLOCK",
		["Hexenmeisterin"] = "WARLOCK",
		["Krieger"] = "WARRIOR",
		["Kriegerin"] = "WARRIOR",
	};
end
