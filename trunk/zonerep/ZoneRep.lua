function ZoneRep:Print(line)
	DEFAULT_CHAT_FRAME:AddMessage(line);
end

function ZoneRep:OnLoad()
	SLASH_zrslash1 = "/zonerep";
	SLASH_zrslash2 = "/zr";
	SlashCmdList["zrslash"] = function(msg) self:SlashHandler(msg) end;
	
	self:Print(self.L["ZoneRep geladen"]);
	
	self:RegisterEvents();
end

function ZoneRep:RegisterEvents()
	this:RegisterEvent("ZONE_CHANGED");
	this:RegisterEvent("ZONE_CHANGED_NEW_AREA");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("ZONE_CHANGED_INDOORS");
--	this:RegisterEvent("AURA_GAIN");
end

function ZoneRep:ConvertSavedVars()
	if (ZRstatus["active"] == "on") then
		ZRstatus["active"] = 1;
	elseif (ZRstatus["active"] == "off") then
		ZRstatus["active"] = 0;
	end
	
	if (ZRstatus["pirate"] == "no") then
		ZRstatus["pirate"] = 0;
	elseif (ZRstatus["pirate"] == "yes") then
		ZRstatus["pirate"] = 1;
	end
	
	if (ZRstatus["bar"] == "no") then
		ZRstatus["bar"] = 0;
	elseif (ZRstatus["bar"] == "yes") then
		ZRstatus["bar"] = 1;
	end
	
	if (ZRstatus["lock"] == "no") then
		ZRstatus["lock"] = 0;
	elseif (ZRstatus["lock"] == "yes") then
		ZRstatus["lock"] = 1;
	end
	
	if (ZRstatus["debug"] == "no") then
		ZRstatus["debug"] = 0;
	elseif (ZRstatus["debug"] == "yes") then
		ZRstatus["debug"] = 1;
	end
end

function ZoneRep:LoadVars()
	if (ZRstatus == nil) then
		ZRstatus = {};
	end
	
	if (ZRstatus["active"] == nil) then
		ZRstatus["active"] = 1;
	end
	
	if (ZRstatus["pirate"] == nil) then
		ZRstatus["pirate"] = 0;
	end
	
	if (ZRstatus["bar"] == nil) then
		ZRstatus["bar"] = 0;
	end
	
	if (ZRstatus["lock"] == nil) then
		ZRstatus["lock"] = 0;
	end
	
	if (ZRstatus["debug"] == nil) then
		ZRstatus["debug"] = 0;
	end
	
	if (ZRstatus["bar_x"] == nil) then
		ZRstatus["bar_x"] = floor(UIParent:GetWidth()/2 + 0.5);
	end
	
	if (ZRstatus["bar_y"] == nil) then
		ZRstatus["bar_y"] = floor(UIParent:GetHeight()/2 + 0.5);
	end
	
	if (ZRstatus["bar_mode"] == nil) then
		ZRstatus["bar_mode"] = "xp";
	end
	
	if (ZRstatus["bar_point"] == nil) then
		ZRstatus["bar_point"] = "BOTTOMLEFT";
	end
	
	if (ZRstatus["bar_width"] == nil) then
		ZRstatus["bar_width"] = 300;
	end
	
	if (ZRstatus["bar_height"] == nil) then
		ZRstatus["bar_height"] = 30;
	end
	
	if (ZRstatus["ald_scr"] == nil) then
		ZRstatus["ald_scr"] = "scryer";
	end
	
	if (ZRstatus["oracle"] == nil) then
		ZRstatus["oracle"] = 1;
	end

	self:ConvertSavedVars();
	
	if (ZRstatus["bar"] == 1) then
		self:ShowBar();
	else
		self:HideBar();
	end
	
	if (ZRstatus["lock"] == 1) then
		self:LockBar();
	else
		self:UnlockBar();
	end
	
	if (ZRstatus["faction"] == nil) then
		local enFaction, locFaction = UnitFactionGroup("player");
		ZRstatus["faction"] = enFaction;
	end
	
	self:SetZoneList();
	self:ChangeStatus();
	self:SetBarDim(ZRstatus["bar_height"], ZRstatus["bar_width"]);
	self:SetBarPos(ZRstatus["bar_x"], ZRstatus["bar_y"], ZRstatus["bar_point"]);
	--self:Debug("self:SetBarPos("..ZRstatus["bar_x"]..", "..ZRstatus["bar_y"]..", "..ZRstatus["bar_point"]..");");
	self:ConfigInit();
end

function ZoneRep:ChangeStatus()
	if (ZRstatus["active"] == 1) then
		this:RegisterEvent("ZONE_CHANGED");
		this:RegisterEvent("ZONE_CHANGED_NEW_AREA");
		this:RegisterEvent("PLAYER_ENTERING_WORLD");
		this:RegisterEvent("VARIABLES_LOADED");
		this:RegisterEvent("ZONE_CHANGED_INDOORS");
--		this:RegisterEvent("AURA_GAIN");
--		this:RegisterEvent("AURA_FADE");
	else
		this:UnregisterEvent("ZONE_CHANGED");
		this:UnregisterEvent("ZONE_CHANGED_NEW_AREA");
		this:UnregisterEvent("PLAYER_ENTERING_WORLD");
		this:UnregisterEvent("VARIABLES_LOADED");
		this:UnregisterEvent("ZONE_CHANGED_INDOORS");
--		this:UnregisterEvent("AURA_GAIN");
--		this:UnregisterEvent("AURA_FADE");
	end
	
	self:UpdateBar();
end

function ZoneRep:SlashHandler(msg)
	if (msg and msg == self.L["an"]) then
		ZRstatus["active"] = 1;
		self:Print(self.L["ZoneRep aktiviert"]);
		self:ChangeStatus();
	elseif (msg and msg == self.L["aus"]) then
		ZRstatus["active"] = 0;
		self:Print(self.L["ZoneRep deaktiviert"]);
		self:ChangeStatus();
	elseif (msg and msg == self.L["pirat"]) then
		ZRstatus["pirate"] = 1;
		self:Print(self.L["Du bist nun ein Pirat. Arrrrr."]);
	elseif (msg and msg == self.L["keinpirat"]) then
		ZRstatus["pirate"] = 0;
		self:Print(self.L["Du bist kein Pirat mehr."]);
	elseif (msg and msg == self.L["status"]) then		
		if (ZRstatus == nil) then
			self:Print("ZRstatus = nil");
		else
			if (ZRstatus["active"]) then
				self:Print("ZRstatus[\"active\"] = "..ZRstatus["active"]);
			else
				self:Print("ZRstatus[\"active\"] = nil");
			end
			
			if (ZRstatus["pirate"]) then
				self:Print("ZRstatus[\"pirate\"] = "..ZRstatus["pirate"]);
			else
				self:Print("ZRstatus[\"pirate\"] = nil");
			end
			
			self:Print("ZRstatus[\"lang\"] = "..ACTIVE_LOCALE);
			self:Print("ZRstatus[\"bar\"] = "..ZRstatus["bar"]);
			self:Print("ZRstatus[\"lock\"] = "..ZRstatus["lock"]);
			self:Print("ZRstatus[\"ald_scr\"] = "..ZRstatus["ald_scr"]);
			self:Print("ZRstatus[\"bar_mode\"] = "..ZRstatus["bar_mode"]);
		end
	elseif (msg and msg == "debug" and ZRstatus["debug"] == 1) then
		ZRstatus["debug"] = 0;
	elseif (msg and msg == "debug" and ZRstatus["debug"] == 0) then
		ZRstatus["debug"] = 1;
	elseif (msg and msg == self.L["anzeigen"]) then
		ZRstatus["bar"] = 1;
		self:ShowBar();
	elseif (msg and msg == self.L["verstecken"]) then
		ZRstatus["bar"] = 0;
		self:HideBar();
	elseif (msg and msg == self.L["sperren"]) then
		ZRstatus["lock"] = 1;
		self:LockBar();
	elseif (msg and msg == self.L["freigeben"]) then
		ZRstatus["lock"] = 0;
		self:UnlockBar();
	elseif (msg and msg == "xpbar") then
		ZRstatus["bar_mode"] = "xp";
		self:ChangeStatus();
	elseif (msg and msg == "repbar") then
		ZRstatus["bar_mode"] = "rep";
		self:ChangeStatus();
	elseif (msg and msg == "config") then
		self:ConfigToggle();
	elseif (msg and msg == "add") then
		self:AddRel();
	elseif (msg and msg == "del") then
		self:DelRel();
	elseif (msg == nil or msg == "") then
		self:ConfigToggle();
	else
		self:Help();
	end
	
	self:SetRepBarSubZone();
end

function ZoneRep:AddRel()
	local name, _, _, _, _ = GetWatchedFactionInfo();
	local zone = GetSubZoneText();
	
	if (name and zone) then
		ZRdevel[zone] = name;
		self:Print("added "..zone.." = "..ZRdevel[zone]);
	end
end

function ZoneRep:DelRel()
	local zone = GetSubZoneText();
	
	if (zone) then
		ZRdevel[zone] = nil;
		self:Print("deleted "..zone);
	end
end

function ZoneRep:Help()
	for i,v in ipairs(ZR_HELP_LINES) do
		self:Print(v);
	end
end

function ZoneRep:SetRepBar()
	local zone = GetRealZoneText();
	local zone_faction = self.ZoneList[zone];
	
	self:Debug(zone..": "..((zone_faction and zone_faction()) or "nil")..", "..(arg1 or "nil"));
	
	if (not zone_faction) then
		return;
	end
	
	local index = self:GetFactionIndex(zone_faction());
	if(index) then
		SetWatchedFactionIndex(index);
		return 1;
	end

	return nil;
end

function ZoneRep:SetRepBarSubZone()
	local zone = GetSubZoneText();
	local zone_faction = self.SubZoneList[zone];
	
	self:Debug(zone.." (Sub): "..((zone_faction and zone_faction()) or "nil")..", "..(arg1 or "nil"));
	
	if (not zone_faction) then
		self:SetRepBar();
		return;
	end
	
	local index = self:GetFactionIndex(zone_faction());
	if(index) then
		SetWatchedFactionIndex(index);
		return 1;
	end

	return nil;
end

function ZoneRep:GetFactionIndex(faction)
	if (not faction) then
		return nil;
	end

	for i=1, GetNumFactions(), 1 do
		local name, _, _, _, _, _, _, _, _, _, _ = GetFactionInfo(i);

		if (IsFactionInactive(i)) then
			-- nop
		elseif (name and faction == name) then
			return i;
		end
	end

	return nil;
end

function ZoneRep:OnEvent()
	if (event == "VARIABLES_LOADED") then
		self:LoadVars();
	elseif (event == "PLAYER_ENTERING_WORLD") then
		if (ZRstatus["active"] == 1) then
			SetMapToCurrentZone();
			self:SetRepBarSubZone();
		end
		
		self:UpdateBar();
	elseif (event == "ZONE_CHANGED_NEW_AREA" and ZRstatus["active"] == 1) then
		self:SetRepBar();
	elseif ((event == "ZONE_CHANGED" or event == "ZONE_CHANGED_INDOORS") and ZRstatus["active"] == 1) then
		self:SetRepBarSubZone();
--	elseif ((event == "AURA_GAIN" or event == "AURA_FADE") and ZRstatus["active"] == 1) then
--		if (ZR_CHAMPION_FACTIONS[arg1]) then
--			self:SetRepBar();
--		end
	end
end

function ZoneRep:Debug(text)
	if (ZRstatus["debug"] == 1) then
		self:Print(text);
	end
end

-- currently not used
-- returns name and index of the faction with the higher rep
function FactionCompare(f1, f2)
	local f1_index = nil;
	local f1_std = 0;
	local f1_val = 0;
	local f2_index = nil;
	local f2_std = 0;
	local f2_val = 0;
	
	for i=1, GetNumFactions(), 1 do
		local name, _, standing, _, _, value, _, _, header, _, _ = GetFactionInfo(i);
		
		if (name and f1 == name and header == nil) then
			f1_index = i;
			f1_std = standing;
			f1_val = value;
		end
		
		if (name and f2 == name and header == nil) then
			f2_index = i;
			f2_std = standing;
			f2_val = value;
		end
	end
	
	if (f1 == f2 and f1_index ~= nil) then
		return f1, f1_index;
	elseif (f1_std > f2_std) then
		return f1, f1_index;
	elseif (f1_std == f2_std and f1_value >= f2_value) then
		return f1, f1_index;
	else
		return f2, f2_index;
	end
end
