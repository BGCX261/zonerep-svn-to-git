function ZoneRep:ShowBar()
	ZoneRepBar:Show();
end

function ZoneRep:HideBar()
	ZoneRepBar:Hide();
end

function ZoneRep:LockBar()
	ZoneRepBar:SetMovable(false);
end

function ZoneRep:UnlockBar()
	ZoneRepBar:SetMovable(true);
end

function ZoneRep:UpdateTooltip(tooltip)
	if (tooltip == nil) then
		return;
	end

	GameTooltip:ClearLines();

	for i=1, 5 do
		if (i == 1 and tooltip["left"..i]) then
			GameTooltip:SetText(tooltip["left"..i]);
		elseif (tooltip["right"..i]) then
			GameTooltip:AddDoubleLine(tooltip["left"..i], tooltip["right"..i]);
			self:Debug(tooltip["left"..i].."\t"..tooltip["right"..i]);
		elseif (tooltip["left"..i]) then
			GameTooltip:AddLine(tooltip["left"..i]);
			self:Debug(tooltip["left"..i]);
		end
	end
end

function ZoneRep:ShowTooltip()

	GameTooltip:SetOwner(ZoneRepBar, "ANCHOR_CURSOR");
	
	self:UpdateTooltip(self.Tooltip);
	
	GameTooltip:Show();
	
	self:Debug("Tooltip:Show");
end

function ZoneRep:HideTooltip()
	GameTooltip:Hide();
	
	self:Debug("Tooltip:Hide");
end

function ZoneRep:OnClick(button)
	self:Debug("self:OnClick");
	
	if (button == "LeftButton" and IsShiftKeyDown()) then
		self:Debug("Shift+L");
		for i=1, 8 do
			if (getglobal("ChatFrame"..i.."EditBox"):IsVisible()) then
				self:Debug("Insert into ChatFrame"..i);
				getglobal("ChatFrame"..i.."EditBox"):Insert(self.Tooltip["message"]);
				break;
			end
		end
	elseif (button == "LeftButton") then
		self:Debug("L");
		-- ToggleCharacter("ReputationFrame");
	elseif (button == "RightButton") then
		self:Debug("R");
		self:ConfigToggle();
	else
		self:Debug(button or "nil");
	end
end

function ZoneRep:BarEvent()
	if (event == "UPDATE_FACTION") then
		self:UpdateBar();
	elseif (event == "PLAYER_XP_UPDATE" or event == "PLAYER_UPDATE_RESTING") then
		self:UpdateBar();
	end
end

function ZoneRep:UpdateBar()
	if (ZRstatus["bar_mode"] == "rep") then
		self:UpdateRepBar();
	else
		self:UpdateXPBar();
	end
end

function ZoneRep:GetBarDim()
	return ZRstatus["bar_height"], ZRstatus["bar_width"];
end

function ZoneRep:SetBarDim(height, width)
	if (width) then
		ZRstatus["bar_width"] = width;
		ZoneRepBar:SetWidth(width);
		ZoneRepBar_Text:SetWidth(width);
	end
	
	if (height) then
		ZRstatus["bar_height"] = height;
		ZoneRepBar:SetHeight(height);
		ZoneRepBar_Text:SetHeight(height);
	end
end

function ZoneRep:SetBarPos(x, y, relPoint)
	ZoneRepBar:SetClampedToScreen(1);
	if (x ~= nil and y ~= nil) then
		local move = ZoneRepBar:IsMovable();
		ZoneRepBar:SetMovable(1);
		ZoneRepBar:SetUserPlaced(1);
		ZoneRepBar:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y);
		ZoneRepBar:SetMovable(move);
	end
end

function ZoneRep:UpdateXPBar()
	if ZoneRepBar:IsShown() then
		local xp = UnitXP("player");
		local max_xp = UnitXPMax("player");
		local rested = GetXPExhaustion() or 0;
		local color = {};
		local maxlvl = GetAccountExpansionLevel();
		
		if (maxlvl == 0) then
			maxlvl = 60;
		elseif (maxlvl == 1) then
			maxlvl = 70;
		elseif (maxlvl == 2) then
			maxlvl = 80;
		elseif (maxlvl == 3) then
			maxlvl = 85;
		else
			maxlvl = -1;
		end
		
		if (IsResting() or (rested > 0)) then
			color.r = 0.3;
			color.g = 0.3;
			color.b = 1;
		else
			color.r = 0;
			color.g = 1;
			color.b = 0;
		end
		
		ZoneRepBar_progress_BG:SetTexture(0, 0, 0, 0.5);
		
		ZoneRepBar_progress:SetStatusBarColor(color.r+0.3, color.g+0.3, color.b, 0.75);
		ZoneRepBar_progress:SetMinMaxValues(0, max_xp);
		ZoneRepBar_progress:SetValue(min(xp+rested, max_xp));
		
		ZoneRepBar_progressoverlay:SetStatusBarColor(color.r, color.g, color.b);
		ZoneRepBar_progressoverlay:SetMinMaxValues(0, max_xp);
		ZoneRepBar_progressoverlay:SetValue(xp);
		
		local level = UnitLevel("player");
		
		self.Tooltip = {};
		
		self.Tooltip["message"] = string.format("Stufe %d: %d/%d", level, xp, max_xp);
		
		self.Tooltip["left1"] = HIGHLIGHT_FONT_COLOR_CODE.."Stufe "..level..FONT_COLOR_CODE_CLOSE;
		
		if (level < maxlvl) then
			self.Tooltip["left2"] = string.format("%d/%d", xp, max_xp);
			self.Tooltip["right2"] = string.format("%3.1f%%", xp*100./max_xp);
			
			if (rested == 0) then
 				ZoneRepBar_Text:SetFormattedText("Exp: %d/%d (%3.1f%%)", xp, max_xp, xp*100./max_xp);
				ZoneRepBar_Text:Show();
				self.Tooltip["left3"] = nil;
			else
 				ZoneRepBar_Text:SetFormattedText("Exp: %d/%d (%3.1f%%), %d Ausgeruht", xp, max_xp, xp*100./max_xp, rested);
				ZoneRepBar_Text:Show();
				self.Tooltip["left3"] = string.format("%d Ausgeruht", rested);
			end
			
			self.Tooltip["left4"] = string.format("%d bis zu Stufe %d", max_xp - xp, level+1);
		else
			ZoneRepBar_Text:SetText(""..level);
			ZoneRepBar_Text:Show();
		end
	end
end

function ZoneRep:UpdateRepBar()
	if ZoneRepBar:IsShown() then
		local name, reaction, min, max, value = GetWatchedFactionInfo();
		if (name) then
			max = max - min;
			value = value - min;
			
			local color = FACTION_BAR_COLORS[reaction];
			
			ZoneRepBar_progress_BG:SetTexture(color.r * 0.25, color.g * 0.25, color.b * 0.25, 0.5);
			
			ZoneRepBar_progress:SetStatusBarColor(color.r, color.g, color.b, 0);
			ZoneRepBar_progress:SetMinMaxValues(0, max);
			ZoneRepBar_progress:SetValue(value);
			
			ZoneRepBar_progressoverlay:SetStatusBarColor(color.r, color.g, color.b);
			ZoneRepBar_progressoverlay:SetMinMaxValues(0, max);
			ZoneRepBar_progressoverlay:SetValue(value);
			
			ZoneRepBar_Text:SetFormattedText("%s: %d/%d (%3.1f%%)", name, value, max, value*100./max);
			ZoneRepBar_Text:Show();
			
			local nextlvl = reaction+1;
			
			self.Tooltip = {};
			
			self.Tooltip["message"] = string.format("%s: %s (%d/%d)", name, getglobal("FACTION_STANDING_LABEL"..reaction), value, max);
			
			self.Tooltip["left1"] = HIGHLIGHT_FONT_COLOR_CODE..name..FONT_COLOR_CODE_CLOSE;
			self.Tooltip["left2"] = self:GetColoredRepLevel(reaction);
			
			if (nextlvl <= 8) then
				self.Tooltip["left3"] = string.format("%d/%d", value, max);
				self.Tooltip["right3"] = string.format("%3.1f%%", value*100./max);
				self.Tooltip["left4"] = string.format("%d bis %s", max - value, self:GetColoredRepLevel(nextlvl));
			end
		end
	end
end

function ZoneRep:GetColoredRepLevel(reaction)
	if (not reaction) then
		return "";
	end

	local color = FACTION_BAR_COLORS[reaction];

	return string.format("|cff%02x%02x%02x%s%s",
	       color.r * 255, color.g * 255, color.b * 255,
	       getglobal("FACTION_STANDING_LABEL"..reaction),
	       FONT_COLOR_CODE_CLOSE);
end
