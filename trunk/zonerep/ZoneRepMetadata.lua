ZRstatus = {};
ZRdevel = {};

ZoneRep = {};

ZoneRep.Tooltip = {};
ZoneRep.L = {};
ZoneRep._L = {};

local mt = {};
mt.__index = function(t, i) local v = ZoneRep._L[i]; if type(v) == "boolean" and v == true then return i else return v end end
mt.__newindex = function(t ,i, v) ZoneRep._L[i] = v end

setmetatable(ZoneRep.L, mt);
