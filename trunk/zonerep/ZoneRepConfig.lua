function ZoneRep:SetConfigComponentText(comp, text)
	comp:SetText(text);
	local width = comp:GetStringWidth();
	comp:SetWidth(width + 10);
end

function ZoneRep:ConfigInit()
	
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent0Text"), self.L["Aktivieren"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent1Text"), self.L["Balken anzeigen"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent2Text"), self.L["Sperren"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent3Text"), self.L["Ruf"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent4Text"), self.L["Erfahrung"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent5Text"), self.L["Blutsegelbukaniere"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent6Text"), self.L["Die Aldor"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent7Text"), self.L["Die Seher"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent8Text"), self.L["Die Orakel"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigComponent9Text"), self.L["Stamm der Wildherzen"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigLabel1Label"), self.L["Besondere Fraktionen"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigHorizontalSlider1SliderTitle"), self.L["Breite"]);
	self:SetConfigComponentText(getglobal("ZoneRepConfigHorizontalSlider2SliderTitle"), self.L["Höhe"]);

	local sliderMin, sliderMax = getglobal("ZoneRepConfigHorizontalSlider1Slider"):GetMinMaxValues();
	getglobal("ZoneRepConfigHorizontalSlider1SliderLow"):SetText(sliderMin);
	getglobal("ZoneRepConfigHorizontalSlider1SliderHigh"):SetText(sliderMax);
	getglobal("ZoneRepConfigHorizontalSlider1EditBox"):SetNumeric(true);
	getglobal("ZoneRepConfigHorizontalSlider1EditBox"):SetMaxLetters(3);

	sliderMin, sliderMax = getglobal("ZoneRepConfigHorizontalSlider2Slider"):GetMinMaxValues();
	getglobal("ZoneRepConfigHorizontalSlider2SliderLow"):SetText(sliderMin);
	getglobal("ZoneRepConfigHorizontalSlider2SliderHigh"):SetText(sliderMax);
	getglobal("ZoneRepConfigHorizontalSlider2EditBox"):SetNumeric(true);
	getglobal("ZoneRepConfigHorizontalSlider2EditBox"):SetMaxLetters(3);
	
	self:ConfigUpdate();
	
	ZoneRepConfig.name = "ZoneRep"
	InterfaceOptions_AddCategory(ZoneRepConfig); 
end

function ZoneRep:ConfigUpdate()
	if (ZRstatus["active"] == 1) then
		getglobal("ZoneRepConfigComponent0"):SetChecked(1);
	else
		getglobal("ZoneRepConfigComponent0"):SetChecked(nil);
	end

	if (ZRstatus["pirate"] == 0) then
		getglobal("ZoneRepConfigComponent5"):SetChecked(nil);
	else
		getglobal("ZoneRepConfigComponent5"):SetChecked(1);
	end

	if (ZRstatus["bar"] == 0) then
		getglobal("ZoneRepConfigComponent1"):SetChecked(nil);
		getglobal("ZoneRepConfigComponent2"):Disable();
		getglobal("ZoneRepConfigComponent2Text"):SetTextColor(0.4375, 0.4375, 0.4375);
		getglobal("ZoneRepConfigComponent3"):Disable();
		getglobal("ZoneRepConfigComponent3Text"):SetTextColor(0.4375, 0.4375, 0.4375);
		getglobal("ZoneRepConfigComponent4"):Disable();
		getglobal("ZoneRepConfigComponent4Text"):SetTextColor(0.4375, 0.4375, 0.4375);
		getglobal("ZoneRepConfigHorizontalSlider1Slider"):Disable();
		getglobal("ZoneRepConfigHorizontalSlider1SliderTitle"):SetTextColor(0.4375, 0.4375, 0.4375);
		getglobal("ZoneRepConfigHorizontalSlider1EditBox"):EnableKeyboard(false);
		getglobal("ZoneRepConfigHorizontalSlider1EditBox"):EnableMouse(false);
		getglobal("ZoneRepConfigHorizontalSlider1EditBox"):SetTextColor(0.4375, 0.4375, 0.4375);
		getglobal("ZoneRepConfigHorizontalSlider2Slider"):Disable();
		getglobal("ZoneRepConfigHorizontalSlider2SliderTitle"):SetTextColor(0.4375, 0.4375, 0.4375);
		getglobal("ZoneRepConfigHorizontalSlider2EditBox"):EnableKeyboard(false);
		getglobal("ZoneRepConfigHorizontalSlider2EditBox"):EnableMouse(false);
		getglobal("ZoneRepConfigHorizontalSlider2EditBox"):SetTextColor(0.4375, 0.4375, 0.4375);
	else
		getglobal("ZoneRepConfigComponent1"):SetChecked(1);
		getglobal("ZoneRepConfigComponent2"):Enable();
		getglobal("ZoneRepConfigComponent2Text"):SetTextColor(1, 0.8196079, 0);
		getglobal("ZoneRepConfigComponent3"):Enable();
		getglobal("ZoneRepConfigComponent3Text"):SetTextColor(1, 0.8196079, 0);
		getglobal("ZoneRepConfigComponent4"):Enable();
		getglobal("ZoneRepConfigComponent4Text"):SetTextColor(1, 0.8196079, 0);
		getglobal("ZoneRepConfigHorizontalSlider1Slider"):Enable();
		getglobal("ZoneRepConfigHorizontalSlider1SliderTitle"):SetTextColor(1, 0.8196079, 0);
		getglobal("ZoneRepConfigHorizontalSlider1EditBox"):EnableKeyboard(true);
		getglobal("ZoneRepConfigHorizontalSlider1EditBox"):EnableMouse(true);
		getglobal("ZoneRepConfigHorizontalSlider1EditBox"):SetTextColor(1, 1, 1);
		getglobal("ZoneRepConfigHorizontalSlider2Slider"):Enable();
		getglobal("ZoneRepConfigHorizontalSlider2SliderTitle"):SetTextColor(1, 0.8196079, 0);
		getglobal("ZoneRepConfigHorizontalSlider2EditBox"):EnableKeyboard(true);
		getglobal("ZoneRepConfigHorizontalSlider2EditBox"):EnableMouse(true);
		getglobal("ZoneRepConfigHorizontalSlider2EditBox"):SetTextColor(1, 1, 1);
	end

	if (ZRstatus["lock"] == 0) then
		getglobal("ZoneRepConfigComponent2"):SetChecked(nil);
	else
		getglobal("ZoneRepConfigComponent2"):SetChecked(1);
	end

	if (ZRstatus["bar_mode"] == "xp") then
		getglobal("ZoneRepConfigComponent3"):SetChecked(nil);
		getglobal("ZoneRepConfigComponent4"):SetChecked(1);
	else
		getglobal("ZoneRepConfigComponent3"):SetChecked(1);
		getglobal("ZoneRepConfigComponent4"):SetChecked(nil);
	end

	if (ZRstatus["ald_scr"] == "scryer") then
		getglobal("ZoneRepConfigComponent6"):SetChecked(nil);
		getglobal("ZoneRepConfigComponent7"):SetChecked(1);
	else
		getglobal("ZoneRepConfigComponent6"):SetChecked(1);
		getglobal("ZoneRepConfigComponent7"):SetChecked(nil);
	end

	if (ZRstatus["oracle"] == 1) then
		getglobal("ZoneRepConfigComponent8"):SetChecked(1);
		getglobal("ZoneRepConfigComponent9"):SetChecked(nil);
	else
		getglobal("ZoneRepConfigComponent8"):SetChecked(nil);
		getglobal("ZoneRepConfigComponent9"):SetChecked(1);
	end

	local h, w = self:GetBarDim();
	
	if (h) then
		self:Debug("ConfigUpdate (height): "..h);
		getglobal("ZoneRepConfigHorizontalSlider2Slider"):SetValue(h);
--~ 		getglobal("ZoneRepConfigSinglelineEditBox2"):SetText(h);
		getglobal("ZoneRepConfigHorizontalSlider2EditBox"):SetText(h);
	end
	
	if (w) then
		self:Debug("ConfigUpdate (height): "..w);
		getglobal("ZoneRepConfigHorizontalSlider1Slider"):SetValue(w);
--~ 		getglobal("ZoneRepConfigSinglelineEditBox1"):SetText(w);
		getglobal("ZoneRepConfigHorizontalSlider1EditBox"):SetText(w);
	end
end

function ZoneRep:ConfigToggle()

	if ( InterfaceOptionsFrame:IsShown() ) then
		InterfaceOptionsFrame:Hide();
	else
		InterfaceOptionsFrame_OpenToCategory("ZoneRep");
	end
	
end

function ZoneRep:ShowConfigTooltip(component)
	GameTooltip:SetOwner(component, "ANCHOR_CURSOR");
	
	self:SetConfigTooltip(component);
    
	GameTooltip:Show();
	
	self:Debug("Tooltip:ConfigShow::"..component:GetName());
end

function ZoneRep:SetConfigTooltip(component)
	local tooltip = ZR_CONFIG_TOOLTIPS[getglobal(component:GetName().."Text"):GetText()];

	self:UpdateTooltip(tooltip);
end

function ZoneRep:UpdateBarWidthEditBox()
	local sliderMin, sliderMax = getglobal("ZoneRepConfigHorizontalSlider1Slider"):GetMinMaxValues();
--~ 	local val = getglobal("ZoneRepConfigSinglelineEditBox1"):GetNumber();
	local val = getglobal("ZoneRepConfigHorizontalSlider1EditBox"):GetNumber();
	
	if (val >= sliderMin and val <= sliderMax) then
		val = floor(val+0.5);
		self:Debug("bar width (edit box): "..val);
		getglobal("ZoneRepConfigHorizontalSlider1Slider"):SetValue(val);
		self:SetBarDim(nil, val);
	end
end

function ZoneRep:UpdateBarWidthSlider()
	local val = getglobal("ZoneRepConfigHorizontalSlider1Slider"):GetValue();
	
	if (val) then
		val = floor(val+0.5);
		self:Debug("bar width (slider): "..val);
--~ 		getglobal("ZoneRepConfigSinglelineEditBox1"):SetText(val);
		local box = getglobal("ZoneRepConfigHorizontalSlider1EditBox");
		
		if (box) then
			box:SetText(val);
		end
		
		self:SetBarDim(nil, val);
	end
end

function ZoneRep:UpdateBarHeightEditBox()
	local sliderMin, sliderMax = getglobal("ZoneRepConfigHorizontalSlider2Slider"):GetMinMaxValues();
--~ 	local val = getglobal("ZoneRepConfigSinglelineEditBox2"):GetNumber();
	local val = getglobal("ZoneRepConfigHorizontalSlider2EditBox"):GetNumber();
	
	if (val >= sliderMin and val <= sliderMax) then
		val = floor(val+0.5);
		self:Debug("bar height (edit box): "..val);
		getglobal("ZoneRepConfigHorizontalSlider2Slider"):SetValue(val);
		self:SetBarDim(val, nil);
	end
end

function ZoneRep:UpdateBarHeightSlider()
	local val = getglobal("ZoneRepConfigHorizontalSlider2Slider"):GetValue();
	
	if (val) then
		val = floor(val+0.5);
		self:Debug("bar height (slider): "..val);
		
--~ 		local box = getglobal("ZoneRepConfigSinglelineEditBox2");
		local box = getglobal("ZoneRepConfigHorizontalSlider2EditBox");
		
		if (box) then
			box:SetText(val);
		end
		
		self:SetBarDim(val, nil);
	end
end
