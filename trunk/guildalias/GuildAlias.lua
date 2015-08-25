GA_ALIASES = {} -- [guild] = {[twink] = main, ...}
GA_CACHE = {} -- [guild] = { [char] = {[note] = "", [onote] = "", [cname] = ""} }
GA_CLEARCACHE = 2.4

GA_PUPLIC = 1;
GA_OFFICER = 2;

GA_GUILD = nil;

local GuildAlias_AddMessage1_Original = nil;
local GuildAlias_AddMessage2_Original = nil;
local GuildAlias_AddMessage3_Original = nil;
local GuildAlias_AddMessage4_Original = nil;
local GuildAlias_AddMessage5_Original = nil;
local GuildAlias_AddMessage6_Original = nil;
local GuildAlias_AddMessage7_Original = nil;

function GuildAlias_OnLoad()
	SLASH_gaslash1 = "/guildalias";
	SLASH_gaslash2 = "/ga";
	SlashCmdList["gaslash"] = GuildAlias_SlashHandler;
	
	GuildAlias_RegisterEvents();
	GuildAlias_HookChat();
	GuildAlias_Init();
end

function GuildAlias_SlashHandler(msg)
	if (msg == nil or msg == "" or msg == "config") then
		GuildAliasConfig:Show();
	elseif (msg == "status") then
		if (GA_ALIASES[GA_GUILD]) then
			for twink, main in pairs(GA_ALIASES[GA_GUILD]) do
				GuildAlias_Error(string.format("%s = %s", twink, main));
			end
		end
	end
end

function GuildAlias_UpdateTooltip(tooltip)
	if (tooltip == nil) then
		return;
	end

	GameTooltip:ClearLines();

	for i=1, 5 do
		if (i == 1 and tooltip["left"..i]) then
			GameTooltip:SetText(tooltip["left"..i]);
		elseif (tooltip["right"..i]) then
			GameTooltip:AddDoubleLine(tooltip["left"..i], tooltip["right"..i]);
		elseif (tooltip["left"..i]) then
			GameTooltip:AddLine(tooltip["left"..i]);
		end
	end
end

function GuildAlias_ShowTooltip(anchor, tooltip)
	GameTooltip:SetOwner(anchor, "ANCHOR_CURSOR");
	
	GuildAlias_UpdateTooltip(tooltip);
	
	GameTooltip:Show();
end

function GuildAlias_HideTooltip()
	GameTooltip:Hide();
end

function GuildAlias_Init()
	GuildAliasConfigMainLabelLabel:SetText(GA_MAIN);
	GuildAliasConfigTwinkLabelLabel:SetText(GA_ALT);
	GuildAliasConfigOfficerButtonText:SetText(GA_OFFICER_NOTE);
	GuildAliasConfigPublicButtonText:SetText(GA_NOTE);
	GuildAliasConfigAddButton:SetText(GA_ADD);
end

function GuildAlias_RegisterEvents()
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("PLAYER_GUILD_UPDATE");
end

function GuildAlias_RegisterGuildEvents()
	this:RegisterEvent("GUILD_ROSTER_UPDATE");
end

function GuildAlias_UnregisterGuildEvents()
	this:UnregisterEvent("GUILD_ROSTER_UPDATE");
end

function GuildAlias_OnEvent()
	if (event == "GUILD_ROSTER_UPDATE") then
	elseif (event == "PLAYER_GUILD_UPDATE") then
		if (IsInGuild()) then
			GuildAlias_RegisterGuildEvents();
			local guild, _, _ = GetGuildInfo("player");
			GA_GUILD = guild;
		else
			GuildAlias_UnregisterGuildEvents();
			GA_GUILD = nil;
		end
	elseif (event == "ADDON_LOADED") then
		if (not GA_CLEARCACHE or GA_CLEARCACHE < 2.4) then
			GA_CACHE = {};
			GA_CLEARCACHE = 2.4;
		end
	
		if (IsInGuild()) then
			GuildAlias_RegisterGuildEvents();
			local guild, _, _ = GetGuildInfo("player");
			GA_GUILD = guild;
		end
	end
end

function GuildAlias_HookChat()
	if (DEFAULT_CHAT_FRAME.AddMessage ~= GuildAlias_AddMessage1) then
		GuildAlias_AddMessage1_Original = DEFAULT_CHAT_FRAME.AddMessage
		DEFAULT_CHAT_FRAME.AddMessage = GuildAlias_AddMessage1
	end
	
	if (ChatFrame2 and ChatFrame2.AddMessage ~= GuildAlias_AddMessage2) then
		GuildAlias_AddMessage2_Original = ChatFrame2.AddMessage
		ChatFrame2.AddMessage = GuildAlias_AddMessage2
	end
	
	if (ChatFrame3 and ChatFrame3.AddMessage ~= GuildAlias_AddMessage3) then
		GuildAlias_AddMessage3_Original = ChatFrame3.AddMessage
		ChatFrame3.AddMessage = GuildAlias_AddMessage3
	end
	
	if (ChatFrame4 and ChatFrame4.AddMessage ~= GuildAlias_AddMessage4) then
		GuildAlias_AddMessage4_Original = ChatFrame4.AddMessage
		ChatFrame4.AddMessage = GuildAlias_AddMessage4
	end
	
	if (ChatFrame5 and ChatFrame5.AddMessage ~= GuildAlias_AddMessage5) then
		GuildAlias_AddMessage5_Original = ChatFrame5.AddMessage
		ChatFrame5.AddMessage = GuildAlias_AddMessage5
	end
	
	if (ChatFrame6 and ChatFrame6.AddMessage ~= GuildAlias_AddMessage6) then
		GuildAlias_AddMessage6_Original = ChatFrame6.AddMessage
		ChatFrame6.AddMessage = GuildAlias_AddMessage6
	end
	
	if (ChatFrame7 and ChatFrame7.AddMessage ~= GuildAliask_AddMessage7) then
		GuildAlias_AddMessage7_Original = ChatFrame7.AddMessage
		ChatFrame7.AddMessage = GuildAlias_AddMessage7
	end
end

function GuildAlias_InsertMain(str)
	GA_CACHE["debug"] = {};
	GA_CACHE["debug"]["str"] = str;

	if (not GA_ALIASES[GA_GUILD]) then
		return str;
	end
	
	if (str and string.find(str, GA_GUILD_PATTERN)) then
		local _, _, player = string.find(str, "|Hplayer:([^:]+):");
		local main = GA_ALIASES[GA_GUILD][player];
		
		GA_CACHE["debug"]["player"] = player;
		GA_CACHE["debug"]["main"] = main;
		
		if (main) then
			str = string.gsub(str, "("..player.."]|h)(:)", "%1 ("..main..")%2");
		end
	end
	
	return str;
end

function GuildAlias_AddMessage1(t, s, ...)
	s = GuildAlias_InsertMain(s);
	GuildAlias_AddMessage1_Original (t, s, select (1, ...));
end

function GuildAlias_AddMessage2(t, s, ...)
	s = GuildAlias_InsertMain(s);
	GuildAlias_AddMessage2_Original (t, s, select (1, ...));
end

function GuildAlias_AddMessage3(t, s, ...)
	s = GuildAlias_InsertMain(s);
	GuildAlias_AddMessage3_Original (t, s, select (1, ...));
end

function GuildAlias_AddMessage4(t, s, ...)
	s = GuildAlias_InsertMain(s);
	GuildAlias_AddMessage4_Original (t, s, select (1, ...));
end

function GuildAlias_AddMessage5(t, s, ...)
	s = GuildAlias_InsertMain(s);
	GuildAlias_AddMessage5_Original (t, s, select (1, ...));
end

function GuildAlias_AddMessage6(t, s, ...)
	s = GuildAlias_InsertMain(s);
	GuildAlias_AddMessage6_Original (t, s, select (1, ...));
end

function GuildAlias_AddMessage7(t, s, ...)
	s = GuildAlias_InsertMain(s);
	GuildAlias_AddMessage7_Original (t, s, select (1, ...));
end

function GuildAlias_AddAlias(main, twink, note, onote)
	
	if (main == "*") then
		if (twink == nil or twink == "") then
			twink = "^(%a+)$";
		end
		
		if (note == 1) then
			local aliases = GuildAlias_ScanNote(twink, GA_PUPLIC);
			GuildAlias_AddAliasList(aliases);
		end
		
		if (onote == 1) then
			local aliases = GuildAlias_ScanNote(twink, GA_OFFICER);
			GuildAlias_AddAliasList(aliases);
		end
	else
		GuilAlias_AddSingleAlias(main, twink);
	end
end

function GuilAlias_AddSingleAlias(main, twink)
	if (not GA_GUILD) then
		return;
	end
	
	local info = GuildAlias_GetPlayer(main);
	
	if (info == nil
	or GuildAlias_GetPlayer(twink) == nil) then
		GuildAlias_Error(string.format("%s or %s not found", main, twink));
	else
		if (GA_ALIASES[GA_GUILD] == nil) then
			GA_ALIASES[GA_GUILD] = {};
		end
		
		if (main ~= twink) then
			GuildAlias_Error(twink.." = "..info["cname"]);
			GA_ALIASES[GA_GUILD][twink] = info["cname"];
		else
			GuildAlias_Error(twink.." removed");
			GA_ALIASES[GA_GUILD][twink] = nil;
		end
	end
end

function GuildAlias_AddAliasList(list)
	if (not GA_GUILD) then
		return;
	end
	
	if (GA_ALIASES[GA_GUILD] == nil) then
		GA_ALIASES[GA_GUILD] = {};
	end
	
	for twink, main in pairs(list) do
		GuildAlias_Error(twink.." = "..main);
		GA_ALIASES[GA_GUILD][twink] = main;
	end
end

function GuildAlias_ScanNote(pattern, notetype)
	local list = {}; -- { [twink] = main, ... }
	
	local chars = GuildAlias_GetGuild(GA_GUILD);
	
	for name, attr in pairs(chars) do
		local main = nil;
		
		if (notetype == GA_PUPLIC) then
		--	GuildAlias_Error((name or "nil").."="..(chars[name]["note"] or "nil"));
			_, _, main = string.find(attr["note"], pattern);
		elseif (notetype == GA_OFFICER) then
		--	GuildAlias_Error((name or "nil").."="..(chars[name]["onote"] or "nil"));
			_, _, main = string.find(attr["onote"], pattern);
		end
		
		if (name and main) then
			local i = GuildAlias_GetPlayer(main);
			
			if (i and i["cname"]) then
				-- GuildAlias_Error("AddAliasList: "..name.." = "..i["cname"]);
				list[name] = i["cname"];
			end
		end
	end
	
	return list;
end

function GuildAlias_GetGuild(name)
	if (GA_CACHE[name] == nil) then
		GuildAlias_UpdateCache();
	end
	
	return GA_CACHE[name];
end

function GuildAlias_GetPlayer(name)
	if (GA_GUILD == NIL) then
		return;
	end

	if (GA_CACHE[GA_GUILD] == nil or GA_CACHE[GA_GUILD][name] == nil) then
		GuildAlias_UpdateCache();
	end
	
	local info = GA_CACHE[GA_GUILD][name];
	
	return info;
end

function GuildAlias_UpdateCache()
	if (not GA_GUILD) then
		return;
	end

	if (GA_CACHE[GA_GUILD] == nil) then
		GA_CACHE[GA_GUILD] = {};
	end
	
	for i = 1, GetNumGuildMembers(true) do
		local n, _, _, _, class, _, note, officernote, _, _ = GetGuildRosterInfo(i);
		local temp = {
			["note"] = note,
			["onote"] = officernote,
			["cname"] = GuildAlias_GetColoredName(n, class)
		};
		
		GA_CACHE[GA_GUILD][n] = temp;
	end
end

function GuildAlias_GetColoredName(name, class)
	return GuildAlias_RGBtoInlineColor(RAID_CLASS_COLORS[GA_CLASSNAMES[class]])..
	name..FONT_COLOR_CODE_CLOSE;
end

function GuildAlias_RGBtoInlineColor(color)
	if (color) then
		return string.format("|cff%02x%02x%02x",
		color.r * 255, color.g * 255, color.b * 255);
	end
	
	return "|cffffffff";
end

function GuildAlias_Error(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg);
end
