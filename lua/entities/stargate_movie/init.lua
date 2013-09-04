/*
	Stargate SENT for GarrysMod10
	Copyright (C) 2007  aVoN

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

	Movie Stargate for Garry's Mod
	File modified By AlexALX
	(c) 2010 by http://alex-php.net/
*/

--################# HEADER #################
if (StarGate==nil or StarGate.CheckModule==nil or not StarGate.CheckModule("extra")) then return end
--################# Include
AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");
include("modules/dialling.lua");
include("modules/wire_dial.lua");
--################# Defines
-- Models
ENT.Models = {
	Base="models/Madman07/Stargate/base_movie.mdl",
	Ring="models/Madman07/Stargate/ring_sg1.mdl",
	Chevron="models/Madman07/Stargate/chevron.mdl",
	ChevronMovie="models/Madman07/Stargate/chevron_movie.mdl",
}
-- Sounds
ENT.SoundsBak = {
	Open=Sound("AlexALX/stargate/movie/open.mp3"),
	Travel=Sound("stargate/gate_travel.mp3"),
	Close=Sound("AlexALX/stargate/movie/close.mp3"),
	ChevronDHD=Sound("stargate/chevron_dhd.mp3"),
	Inbound=Sound("stargate/chevron_incoming.mp3");
	Chevron={Sound("AlexALX/stargate/movie/locked.mp3"),Sound("AlexALX/stargate/movie/unlocked.mp3")},
	Lock=Sound("AlexALX/stargate/movie/lock.mp3"),
	LockDHD=Sound("stargate/chevron_lock_dhd.mp3"),
	Fail=Sound("stargate/dial_fail.mp3"),
	Slow=Sound("AlexALX/stargate/gate_roll_long.wav"),
	Chev9Dial=Sound("stargate/universe/fail3.wav"),
	OnButtonLock=Sound("stargate/stargate/dhd/dhd_usual_dial.wav"),
}

ENT.SoundsClassic = {
	Open=Sound("stargate/gate_open.mp3"),
	Travel=Sound("stargate/gate_travel.mp3"),
	Close=Sound("stargate/gate_close.mp3"),
	ChevronDHD=Sound("stargate/chevron_dhd.mp3"),
	Inbound=Sound("stargate/chevron_incoming.mp3");
	Lock=Sound("stargate/chevron_lock.mp3"),
	LockDHD=Sound("stargate/chevron_lock_dhd.mp3"),
	Fail=Sound("stargate/dial_fail.mp3"),
	Slow=Sound("AlexALX/stargate/gate_roll_long.wav"),
	Chev9Dial=Sound("stargate/universe/fail3.wav"),
	OnButtonLock=Sound("stargate/stargate/dhd/dhd_usual_dial.wav"),
}

ENT.Sounds = ENT.SoundsBak;

ENT.SGCLock = {
	Sound("stargate/sg1/lock.mp3"),
	Sound("stargate/sg1/lock_2.mp3"),
	Sound("stargate/sg1/lock_3.mp3"),
}

ENT.ButtChevSounds = {
	Sound("stargate/chevron/chev_usual_1.wav"),
	Sound("stargate/chevron/chev_usual_2.wav"),
	Sound("stargate/chevron/chev_usual_3.wav"),
	Sound("stargate/chevron/chev_usual_4.wav"),
	Sound("stargate/chevron/chev_usual_5.wav"),
	Sound("stargate/chevron/chev_usual_6.wav"),
	Sound("stargate/chevron/chev_usual_7.wav")
}

--################# Added by AlexALX

ENT.SymbolsLockGroup = {
	["?"] = 0,		[0] = 9,
	J = 18,			K = 27,
	N = 36,  		T = 45,
	R = 54,			[3] = 63,
	M = 72,			B = 81,
	Z = 90,			X = 99,
	["*"] = 108, -- not exists on dhd
	H = 117,  		[6] = 126,
	[9] = 135,		I = 144,
	G = 153,		P = 162,
	L = 171,		["#"] = 180,
	["@"] = 189,	Q = 198,
	F = 207,  		S = 216,
	[1] = 225,		E = 234,
	[4] = 243,		A = 252,
	U = 261,  		[8] = 270,
	[5] = 279,		O = 288,
	C = 297,    	W = 306,
	[7] = 315,		[2] = 324,
	Y = 333,    	V = 342,
	D = 351,
}

ENT.SymbolsLockConceptGroup = {
	["#"] = 0,		[0] = 9,
	J = 18,			K = 27,
	N = 36,  		T = 45,
	R = 54,			[3] = 63,
	M = 72,			B = 81,
	Z = 90,			X = 99,
	["*"] = 108, -- not exists on dhd
	H = 117,  		[6] = 126,
	[9] = 135,		I = 144,
	G = 153,		P = 162,
	L = 171,		["?"] = 180,
	["@"] = 189,	Q = 198,
	F = 207,  		S = 216,
	[1] = 225,		E = 234,
	[4] = 243,		A = 252,
	U = 261,  		[8] = 270,
	[5] = 279,		O = 288,
	C = 297,    	W = 306,
	[7] = 315,		[2] = 324,
	Y = 333,    	V = 342,
	D = 351,
}

ENT.SymbolsLockGalaxy = {
	["?"] = 0,		["!"] = 9,
	J = 18,			K = 27,
	N = 36,  		T = 45,
	R = 54,			[3] = 63,
	M = 72,			B = 81,
	Z = 90,			X = 99,
	["*"] = 108, -- not exists on dhd
	H = 117,  		[6] = 126,
	[9] = 135,		I = 144,
	G = 153,		P = 162,
	L = 171,		["#"] = 180,
	["@"] = 189,	Q = 198,
	F = 207,  		S = 216,
	[1] = 225,		E = 234,
	[4] = 243,		A = 252,
	U = 261,  		[8] = 270,
	[5] = 279,		O = 288,
	C = 297,    	W = 306,
	[7] = 315,		[2] = 324,
	Y = 333,    	V = 342,
	D = 351,
}

ENT.SymbolsLockConceptGalaxy = {
	["#"] = 0,		["!"] = 9,
	J = 18,			K = 27,
	N = 36,  		T = 45,
	R = 54,			[3] = 63,
	M = 72,			B = 81,
	Z = 90,			X = 99,
	["*"] = 108, -- not exists on dhd
	H = 117,  		[6] = 126,
	[9] = 135,		I = 144,
	G = 153,		P = 162,
	L = 171,		["?"] = 180,
	["@"] = 189,	Q = 198,
	F = 207,  		S = 216,
	[1] = 225,		E = 234,
	[4] = 243,		A = 252,
	U = 261,  		[8] = 270,
	[5] = 279,		O = 288,
	C = 297,    	W = 306,
	[7] = 315,		[2] = 324,
	Y = 333,    	V = 342,
	D = 351,
}

--################# SENT CODE ###############

--################# Init @aVoN
function ENT:Initialize()
	util.PrecacheModel(self.Models.Base);
	util.PrecacheModel(self.Models.Chevron);
	util.PrecacheModel(self.Models.Ring);
	util.PrecacheModel(self.Models.ChevronMovie);
	self.Entity:SetModel(self.Models.Base);
	self.Entity:PhysicsInit(SOLID_VPHYSICS);
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS);
	self.Entity:SetSolid(SOLID_VPHYSICS);
	self.BaseClass.Initialize(self); -- BaseClass Initialize call
	self.DiallingSymbol = "";
	self.DiallingChevron = "";
	self.RingSymbol = "";
	self.RingSymbol7Chev = "";
	self.RingSpeed = 0;
	self.RingDir = 0;
	self.ClassicMode = false;
	self.LightMode = false;
	self:AddRing();
	self:AddChevron();
	self.IsConcept = false;
	self.RingInbound = false;
	self.ChevLight = false;
	self.Classic = false;
	self.SpChevLight = false;
	self.SpClassic = false;
end

--#################  Called when stargate_group_system changed
function ENT:ChangeSystemType(groupsystem,reload)
	local delay = 3.5
	if (reload) then delay = 1.5 end
	if (groupsystem) then
		if (self.GateSpawnerSpawned) then
			timer.Simple(delay, function()
				if (IsValid(self)) then
					self:GateWireInputs(groupsystem);
				end
			end)
			timer.Simple(2.25, function()
				if (IsValid(self)) then
					self:GateWireOutputs(groupsystem);
					self:SetWire("Dialing Mode",-1);
					self:SetChevrons(0,0);
				end
			end)
		else
			self:GateWireInputs(groupsystem);
			self:GateWireOutputs(groupsystem);
			self:SetWire("Dialing Mode",-1);
			self:SetChevrons(0,0);
		end
		self.SymbolsLock = self.SymbolsLockGroup;
		self.SymbolsLockConcept = self.SymbolsLockConceptGroup;
		self.WireCharters = "A-Z0-9@#";
	else
		if (self.GateSpawnerSpawned) then
			timer.Simple(delay, function()
				if (IsValid(self)) then
					self:GateWireInputs(groupsystem);
				end
			end)
			timer.Simple(2.25, function()
				if (IsValid(self)) then
					self:GateWireOutputs(groupsystem);
					self:SetWire("Dialing Mode",-1);
					self:SetChevrons(0,0);
				end
			end)
		else
			self:GateWireInputs(groupsystem);
			self:GateWireOutputs(groupsystem);
			self:SetWire("Dialing Mode",-1);
			self:SetChevrons(0,0);
		end
		self.SymbolsLock = self.SymbolsLockGalaxy;
		self.SymbolsLockConcept = self.SymbolsLockConceptGalaxy;
		self.WireCharters = "A-Z1-9@#!";
		if (self:GetGateAddress():find("[0]")) then self:SetGateAddress("");
		elseif (self:GetGateAddress()!="") then
			for _,v in pairs(ents.FindByClass("stargate_*")) do
				if (self.Entity != v.Entity and v.IsStargate and v:GetClass()!="stargate_supergate" and v:GetGateAddress()!="") then
					local address, a = self:GetGateAddress(), string.Explode("",v:GetGateAddress());
					if (address:find(a[1]) and address:find(a[2]) and address:find(a[3]) and address:find(a[4]) and address:find(a[5]) and address:find(a[6])) then self:SetGateAddress(""); end
				end
			end
		end
	end
	if (reload) then
		StarGate.ReloadSystem(groupsystem);
	end
end

function ENT:GateWireInputs(groupsystem)
	self:CreateWireInputs("Dial Address","Dial String [STRING]","Dial Mode","Start String Dial","Close","Disable Autoclose","Transmit [STRING]","Chevron Light","Classic Mode","Rotate Ring","Ring Speed Mode","Chevron Encode","Chevrons Lock","Activate chevron numbers [STRING]","SGC Type","Set Point of Origin","Disable Menu");
end

function ENT:GateWireOutputs(groupsystem)
	self:CreateWireOutputs("Active","Open","Inbound","Chevron","Chevron Locked","Chevrons [STRING]","Ring Symbol [STRING]","Ring Rotation","Ring Chev7 Symbol [STRING]","Earth Point of Origin","Dialing Address [STRING]","Dialing Mode","Dialing Symbol [STRING]","Dialed Symbol [STRING]","Received [STRING]");
end

function ENT:WireOrigin()
	if (not self.Outbound and IsValid(self.Target)) then
		self:SetWire("Earth Point of Origin",self.Target:IsConceptDHD());
	else
		self:SetWire("Earth Point of Origin",self:IsConceptDHD());
	end
end

--################# Either allow the player to spawn this or not
function ENT:SpawnFunction(p,t)
	if (not t.Hit) then return end
	local e = ents.Create("stargate_movie");
	e:SetPos(t.HitPos+Vector(0,0,90));
	e:Spawn();
	e:Activate();
	--################# Set correct angle for the spawned prop
	local ang = p:GetAimVector():Angle(); ang.p = 0; ang.r = 0; ang.y = (ang.y+180) % 360
	e:SetAngles(ang);
	e:SetGateGroup("M@");
	e:SetLocale(true);
	e:CartersRamps(t); -- put gate on carters ramps @Llapp
	e:SetWire("Dialing Mode",-1);
	return e;
end

--################# Creates the ring for the gate @aVoN
function ENT:AddRing()
	local pos = self.Entity:GetPos();
	local e = ents.Create("func_rotating");
	e:SetKeyValue("spawnflags",4 + 16); -- rotate around x-axis
	e:SetKeyValue("rendermode",10); -- dont draw,or the game crashes on touch
	e:SetKeyValue("maxspeed",30);
	e:SetKeyValue("friction",100);
	e:SetModel(self.Models.Ring);  -- Dummy model, or the game crashes if you touch the func_rotating
	e:SetParent(self.Entity);
	e:SetPos(pos);
	e:Spawn();
	e:Activate();
	self.Ring = e;
	self.Ring.Entity = e;
	--Spawn the "real" ring (model)
	local e = ents.Create("prop_dynamic_override");
	e:SetModel(self.Models.Ring);
	e:SetKeyValue("solid",0);
	e:SetPos(pos);
	e:SetParent(self.Ring);
	e:SetDerive(self.Entity); -- Derive Material/Color from "Parent"
	e:DrawShadow(false);
	e:Spawn();
	e:Activate();
end

function ENT:ActivateRingSound(pitch)
 	util.PrecacheSound(self.Sounds.Slow);
	self.RingSound = CreateSound(self.Entity, self.Sounds.Slow);
	self.RingSound:ChangePitch(pitch,0);
   	self.RingSound:SetSoundLevel(94);
	self.RingSound:PlayEx(1,pitch);
end

--################# Makes it rotate or stop @aVoN
function ENT:ActivateRing(b,classic,loop,fast)
	if(not IsValid(self.Ring)) then return end;
	if(b) then
		if (not fast) then
			self.IsConcept = self:IsConceptDHD();
			self:SetWire("Earth Point of Origin",self.IsConcept);
		end
		local pitch = 97;
		if (not loop) then
			self.Ring.Entity:SetKeyValue("maxspeed",30);
			self.Ring.Entity:SetKeyValue("spawnflags",4 + 16);
			--self.Ring.Moving = true;
		else
			self.Ring.Entity:SetKeyValue("spawnflags",4);
			if (self.RingSpeed == 1) then
				self.Ring.Entity:SetKeyValue("maxspeed",30);
			elseif (self.RingSpeed == 2) then
				self.Ring.Entity:SetKeyValue("maxspeed",45);
				pitch = 102;
			elseif (self.RingSpeed == 3) then
				self.Ring.Entity:SetKeyValue("maxspeed",60);
				pitch = 106;
			elseif (self.RingSpeed == -1) then
				self.Ring.Entity:SetKeyValue("maxspeed",7.5);
				pitch = 93;
			else
				self.Ring.Entity:SetKeyValue("maxspeed",15);
				pitch = 95;
			end
		end
	    if (self.RingDir==1) then self.RingDir = -1; else self.RingDir = 1 end
		self:ActivateRingSound(pitch);
		self.Ring:Fire("Reverse","",0); -- Reverse direction first
		self.Ring:Fire("start","",0);
		self.Entity:SetWire("Ring Rotation",self.RingDir);
		if (loop or loop==nil) then
			self.Ring.WireMoving = true;
		end
	else
		if (self.RingSound and not loop) then
			self.RingSound:Stop();
			self.Entity:SetWire("Ring Rotation",0);
		end
		self.Ring:Fire("stop","",0);
		self.Ring.Moving = false;
		self.Ring.WireMoving = false;
	end
end

function ENT:SetRingMoving()
	if (IsValid(self.Ring)) then
		self.Ring.Moving = true;
	end
end

function ENT:StopRingSound()
	if (self.RingSound) then
		self.RingSound:Stop();
		self.Entity:SetWire("Ring Rotation",0);
	end
end

-- Damn, I spent the whole day and night for calculating this formula.
function ENT:StopFormula(y,x,n,n2)
	if (y==nil or x==nil) then return end
	local stop = false;
	local b,c;
	if (self.RingDir==-1) then
		if (x<n) then
			b = 360-(n-x);
			if (x<n2) then
				c = 360-(n2-x);
				if (y >= b and y <= c) then stop = true; end
			else
				c = x-n2;
				if (y >= b and c <= y) then stop = true; end
			end
		else
			b = x-n;
			c = x-n2;
			if (y >= b and y <= c) then stop = true; end
		end
	elseif(self.RingDir==1) then
		local b
		if (x>=(360-n)) then
			b = (x+n)-360;
			if (x>=(360-n2)) then
				c = (x+n2)-360;
				if (y <= b and y >= c) then stop = true; end
			else
				c = x+n2;
				if (y <= b and c >= y) then stop = true; end
			end
		else
			b = x+n;
			c = x+n2;
			if (y <= b and y >= c) then stop = true; end
		end
	end
	return stop;
end

--################# Think function added by AlexALX
function RingTickMovie()
	for _,self in pairs(ents.FindByClass("stargate_movie")) do
		if (IsValid(self.Ring)) then
			if (self.Outbound and self.Ring.Moving and self.DiallingSymbol != "" and self.DiallingChevron != "") then
				local angle = tonumber(math.NormalizeAngle(self.Ring.Entity:GetLocalAngles().r))--+3;
				local isconcept = self.IsConcept;
				if (angle<0) then angle = angle+360; end
				local angle2 = angle;
				local symbols = self.SymbolsLock;
				if (isconcept) then symbols = self.SymbolsLockConcept; end
				local need = tonumber(symbols[tonumber(self.DiallingSymbol) or self.DiallingSymbol]);
				if (!need) then self:AbortDialling(); self.Ring.Moving = false; else
					--need = need+3;
					local chevron = tonumber(self.DiallingChevron);
					if (chevron <= 3) then
						need = need - (40*chevron);
					elseif (chevron >= 4 and chevron < 7) then
						need = need - (40*(chevron+2));
					elseif (chevron == 8) then
						need = need - (40*4);
					elseif (chevron == 9) then
						need = need - (40*5);
					end
					if (need<0) then need = need+360; end
					local stop = self:StopFormula(angle,need,17.4,16.6); --(angle >= need-0.3 and angle <= need+0.3);
					if (stop) then
						self.Entity:ActivateRing(false,false,true);
						self.Entity:DHDSetAllBusy();
						self.Ring.Moving = false;
						self.Entity:PauseActions(true);
					end
					if (chevron <= 3) then
						angle2 = angle2 + (40*chevron);
					elseif (chevron >= 4 and chevron < 7) then
						angle2 = angle2 + (40*(chevron+2));
					elseif (chevron == 8) then
						angle2 = angle2 + (40*4);
					elseif (chevron == 9) then
						angle2 = angle2 + (40*5);
					end
					if (angle2>=360) then angle2 = angle2-360; end
					local reset = true;
					local reset2 = true;
					for k, v in pairs(symbols) do
						--v = v+3;
						local symbol = self:StopFormula(angle2,v,18.9,14.9);
						if (symbol) then
							self.Entity:SetWire("Ring Symbol",tostring(k)); -- Wire
							self.RingSymbol = tostring(k);
							reset = false;
						end
						local symbol2 = self:StopFormula(angle,v,18.9,14.9);
						if (symbol2) then
							self.Entity:SetWire("Ring Chev7 Symbol",tostring(k)); -- Wire
							self.RingSymbol7Chev = tostring(k);
							reset2 = false;
						end
					end
					if (reset and self.RingSymbol != "") then
						self.Entity:SetWire("Ring Symbol",""); -- Wire
						self.RingSymbol = "";
					end
					if (reset2 and self.RingSymbol7Chev != "") then
						self.Entity:SetWire("Ring Chev7 Symbol",""); -- Wire
						self.RingSymbol7Chev = "";
					end
				end
			end
			if (self.Ring.WireMoving) then
				local angle = tonumber(math.NormalizeAngle(self.Ring.Entity:GetLocalAngles().r))+3;
				local isconcept = self.IsConcept;
				if (angle<0) then angle = angle+360; end
				local angle2 = angle;
				local chevron = 1;
				if (self.DiallingChevron!="") then
					if (self.Outbound and self.Ring.Moving) then
						chevron = tonumber(self.DiallingChevron);
					else
						chevron = tonumber(self.DiallingChevron)+1;
					end
				end;
				if (chevron==7) then chevron = 8 end;
				if (chevron <= 3) then
					angle2 = angle2 + (40*chevron);
				elseif (chevron >= 4 and chevron < 7) then
					angle2 = angle2 + (40*(chevron+2));
				elseif (chevron == 8) then
					angle2 = angle2 + (40*4);
				elseif (chevron == 9) then
					angle2 = angle2 + (40*5);
				end
				if (angle2>=360) then angle2 = angle2-360; end
				local reset = true;
				local reset2 = true;
				local symbols = self.SymbolsLock;
				if (isconcept) then symbols = self.SymbolsLockConcept; end
				for k, v in pairs(symbols) do
					v = v+3;
					local symbol = (angle >= v-2 and angle <= v+2);
					if (symbol) then
						self.Entity:SetWire("Ring Chev7 Symbol",tostring(k)); -- Wire
						self.RingSymbol7Chev = tostring(k);
						reset = false;
					end
					local symbol2 = (angle2 >= v-2 and angle2 <= v+2);
					if (symbol2) then
						self.Entity:SetWire("Ring Symbol",tostring(k)); -- Wire
						self.RingSymbol = tostring(k);
						reset2 = false;
					end
				end
				if (reset and self.RingSymbol7Chev != "") then
					self.Entity:SetWire("Ring Chev7 Symbol",""); -- Wire
					self.RingSymbol7Chev = "";
				end
				if (reset2 and self.RingSymbol != "") then
					self.Entity:SetWire("Ring Symbol",""); -- Wire
					self.RingSymbol = "";
				end
			end
		end
	end
end
hook.Add("Tick", "RingTick Movie", RingTickMovie);

function ENT:SetDiallingSymbol(symbol,chev)
	if (symbol and chev) then
		self.DiallingSymbol = tostring(symbol);
		self.DiallingChevron = tonumber(chev);
	end
end

--################# Adds all chevrons @aVoN
function ENT:AddChevron()
	self.Chevron={};
	local pos = self.Entity:GetPos();
	local angForw = self.Entity:GetAngles():Up();
	local ang = self.Entity:GetAngles();
	for i=1,9 do
		local e = ents.Create("prop_dynamic_override");
		if (i==9) then e:SetModel(self.Models.ChevronMovie);
		else e:SetModel(self.Models.Chevron); end
		e:SetParent(self.Entity);
		e:SetDerive(self.Entity); -- Derive Material/Color from "Parent"
		e:DrawShadow(false);
		e:SetPos(pos);
		local a = angForw*i*40;
		e:SetAngles(ang-Angle(a[1],a[2],a[3]));
		e:Spawn();
		e:Activate();
		if (i >= 6) then self.Chevron[i-2] = e;
		elseif (i <= 3) then self.Chevron[i] = e;
		elseif (i == 4) or (i == 5) then self.Chevron[i+4] = e;
		end
		e:SetDerive(self.Entity); -- Derive Material/Color from "Parent"
		if (i==9) then
			e:Fire("skin",2);
		else
			e:Fire("skin",6);
		end
	end
end

--################# Wire input @aVoN / AlexALX
function ENT:TriggerInput(k,v,mobile,mdhd)
	self:TriggerInputDefault(k,v,mobile,mdhd);
	if(k == "Rotate Ring" and not self.Active and (not self.NewActive or self.WireManualDial) and not self.WireBlock) then
		if (v >= 1) then
			if (self:CheckEnergy(true,true) or self.WireManualDial) then
				self:ActivateRing(true,false,true);
				self.Entity:SetNWBool("ActRotRingL",true);
			end
		else
			self:ActivateRing(false,false,true);
			self.Entity:SetNWBool("ActRotRingL",false);
		end
	elseif(k == "Chevron Encode" and not self.Active and (not self.NewActive or self.WireManualDial) and not self.WireBlock) then
		if (self:GetWire("Chevron Encode",0) >= 1) then
			self:EncodeChevron();
		end
	elseif(k == "Chevrons Lock" and not self.Active and (not self.NewActive or self.WireManualDial) and not self.WireBlock) then
		if (self:GetWire("Chevrons Lock",0) >= 1) then
			self.RingSymbol = self.RingSymbol7Chev;
			self:Chevron7Lock();
		end
	elseif(k == "Ring Speed Mode" and not self.Active and (not self.NewActive or self.WireManualDial)) then
		if (self:GetWire("Ring Speed Mode",0) == 1) then
			self.RingSpeed = 1;
			if (not self.NewActive or self.WireManualDial) then
				self.Ring.Entity:SetKeyValue("maxspeed",30);
				if (self.Ring.WireMoving) then self.Ring:Fire("start","",0); end
				if (self.RingSound) then self.RingSound:ChangePitch(97,0); end
			end
		elseif (self:GetWire("Ring Speed Mode",0) == 2) then
			self.RingSpeed = 2;
			if (not self.NewActive or self.WireManualDial) then
				self.Ring.Entity:SetKeyValue("maxspeed",45);
				if (self.Ring.WireMoving) then self.Ring:Fire("start","",0); end
				if (self.RingSound) then self.RingSound:ChangePitch(102,0); end
			end
		elseif (self:GetWire("Ring Speed Mode",0) >= 3) then
			self.RingSpeed = 3;
			if (not self.NewActive or self.WireManualDial) then
				self.Ring.Entity:SetKeyValue("maxspeed",60);
				if (self.Ring.WireMoving) then self.Ring:Fire("start","",0); end
				if (self.RingSound) then self.RingSound:ChangePitch(106); end
			end
		elseif (self:GetWire("Ring Speed Mode",0) <= -1) then
			self.RingSpeed = -1;
			if (not self.NewActive or self.WireManualDial) then
				self.Ring.Entity:SetKeyValue("maxspeed",7.5);
				if (self.Ring.WireMoving) then self.Ring:Fire("start","",0); end
				if (self.RingSound) then self.RingSound:ChangePitch(93,0); end
			end
		else
			self.RingSpeed = 0;
			if (not self.NewActive or self.WireManualDial) then
				self.Ring.Entity:SetKeyValue("maxspeed",15);
				if (self.Ring.WireMoving) then self.Ring:Fire("start","",0); end
				if (self.RingSound) then self.RingSound:ChangePitch(95,0); end
			end
		end
	elseif(k == "Activate chevron numbers" and not self.NewActive and not self.WireManualDial) then
		if (v != "" and self:CheckEnergy(true,true)) then
			local chevs = v:gsub("[^0-9]",""):TrimExplode("");
			local sound = true;
			local act = false;
			local action = self.Sequence:New();
			for i=1,9 do
				if (chevs[i] and tonumber(chevs[i]) >= 1) then
					if (tonumber(chevs[i]) >= 2) then sound = false; end
					if (self.SpClassic or self.Classic or self.SpChevLight or self.ChevLight) then
						self:ActivateChevronLight(i,true);
					end if (not self.SpClassic and not self.Classic) then
						self:ActivateChevron(i,true);
						sound = false;
					end
					action:Add({f=self.SetChevrons,v={self,i,1},d=0.01}); -- Wire;
					act = true;
				else
					self:ActivateChevron(i,false);
					action:Add({f=self.SetChevrons,v={self,i,0},d=0.01}); -- Wire;
				end
			end
			self:RunActions(action);
			if (v!="000000000") then
				self.Entity:SetNWBool("ActChevronsL",true);
			else
				self.Entity:SetNWBool("ActChevronsL",false);
			end
			if (sound and act) then self:ChevronSound(7,true,true,false,true,true); end
		else
			for i=1,9 do
				self:ActivateChevron(i);
				self:SetChevrons(0,0);
			end
			self.Entity:SetNWBool("ActChevronsL",false);
		end
	elseif(k == "SGC Type") then
		if (v >= 1) then
			self.RingInbound = true;
			self.Entity:SetNWBool("ActSGCT",true);
		else
			self.RingInbound = false;
			self.Entity:SetNWBool("ActSGCT",false);
		end
	elseif(k == "Chevron Light") then
		if (v >= 1)	then
			self.ChevLight = true;
			self.Entity:SetNWBool("ActMChevL",true);
		else
			self.ChevLight = false;
			self.SpChevLight = false;
			self.Entity:SetNWBool("ActMChevL",false);
		end
	elseif(k == "Classic Mode") then
		if (v >= 1) then
			self.Classic = true;
			self.Entity:SetNWBool("ActMCl",true);
		else
			self.Classic = false;
			self.SpClassic = false;
			self.Entity:SetNWBool("ActMCl",false);
		end
	end
end

--#################  When getting removed..
function ENT:OnRemove()
	StarGate.StopUpdateGateTemperatures(self);
	if timer.Exists("LowPriorityThink"..self:EntIndex()) then timer.Remove("LowPriorityThink"..self:EntIndex()) end
	if timer.Exists("ConvarsThink"..self:EntIndex()) then timer.Remove("ConvarsThink"..self:EntIndex()) end
	self:Close(); -- Close the horizon
	self:StopActions(); -- Stop all actions and sounds
	self:DHDDisable(0); -- Shutdown near DHD's
	if (self.RingSound) then
		self.RingSound:Stop();
	end
	if(IsValid(self.Target)) then
		if(self.IsOpen) then
			self.Target:DeactivateStargate(true);
		elseif(self.Dialling) then
			self.Target:EmergencyShutdown(true);
		end
	end
	if (self.HasRD) then StarGate.WireRD.OnRemove(self) end;
	self:RemoveGateFromList();
end

--################# Activates or deactivates a chevron @aVoN
function ENT:ActivateChevron(chev,b,inbound,nosound)
	if(not (self and self.Chevron)) then return end;
	if(self.Chevron[chev]) then
		if(b and self.Chevron[chev]:GetNetworkedString("ChevAnim") != "chevlocked") then
			if (not IsValid(self.Chevron[chev])) then
				self.Entity:Sparks(chev);
			    timer.Simple(0.1, function()
		            self.SparkEnt:Fire("StopSpark", "", 0);
			    end);
				return
			end
			self.Chevron[chev]:Fire("SetAnimation","Lock",0);
			self.Chevron[chev]:SetNetworkedString("ChevAnim","chevlocked");
			if (not nosound) then self.Entity:ChevronSound(chev,true,inbound,false); end
		elseif (not b and self.Chevron[chev]:GetNWString("ChevAnim") == "chevlocked") then
			self.Chevron[chev]:Fire("SetAnimation","UnLock",0);
			self.Chevron[chev]:SetNWString("ChevAnim","chevunlocked");
			if (not nosound) then self.Entity:ChevronSound(chev,true,false,true); end;
		end
		if (not b) then
			self.Entity:ActivateChevronLight(chev,false);
		end
	end
end

function ENT:ActivateChevronLight(chev,b)
	if(not (self and self.Chevron)) then return end;
	if(self.Chevron[chev]) then
		if(b) then
			if (IsValid(self.Chevron[chev])) then
				self.Chevron[chev]:Fire("skin",1);
				self.Entity:SetNWBool("chevron"..chev,true); -- Dynamic light of the chevron
			else
				self.Entity:Sparks(chev);
			    timer.Simple(0.1, function()
		            self.SparkEnt:Fire("StopSpark", "", 0);
			    end);
			end
		else
			if (chev == 7) then
				self.Chevron[chev]:Fire("skin",2);
			else
 				self.Chevron[chev]:Fire("skin",6);
			end
			self.Entity:SetNWBool("chevron"..chev,false); -- Dynamic light of the chevron
		end
	end
end

--################# Makes chevrons go up and down @aVoN
function ENT:ChevronAnimation(chev,classic)
	if (not IsValid(self.Chevron[chev])) then
		self.Entity:Sparks(chev);
	    timer.Simple(0.1, function()
            self.SparkEnt:Fire("StopSpark", "", 0);
	    end);
	    --self:AbortDialling();
		return
	end
	if (classic) then
		if (chev==7 and self.RingInbound) then
			self.Chevron[chev]:Fire("SetAnimation","LockUnlock",0.4);
		else
			self.Chevron[chev]:Fire("SetAnimation","LockUnlockLong",0);
		end
	else
		self.Chevron[chev]:Fire("SetAnimation","LockUnlockMovie",0);
	end
end

--################# Chevron locking sound? @aVoN
function ENT:ChevronSound(chev,fast,inbound,b,classic,wire)
	if (not IsValid(self.Chevron[chev])) then return end
	local snd = self.SoundsBak.Chevron[1]; -- Fast dial with DHD
	if (classic) then
		snd = self.SoundsClassic.ChevronDHD;
	end
	-- Manual slowdial
	if(not fast) then
		if (classic) then
			snd = self.SoundsClassic.Lock;
		else
			snd = self.SoundsBak.Lock;
		end
	end
	-- Inbound dial
	if(inbound and classic) then
		snd = self.SoundsClassic.Inbound;
	end
	if (b == true and not classic) then
		snd = self.SoundsBak.Chevron[2];
	end
	if(chev == 7 and not inbound and classic) then
		snd = self.SoundsClassic.Lock;
	end
	if(classic and self.RingInbound) then
		if (chev == 7 and not wire) then
			snd = self.SGCLock[math.random(1,3)]
		elseif(inbound) then
			snd = self.ButtChevSounds[math.random(1,7)]
		end
	end
	self.Entity:EmitSound(snd,90,math.random(97,104));
end

function ENT:Shutdown() -- It is called at the end of ENT:Close or ENT.Sequence:DialFail
	self.DiallingSymbol = "";
	self.DiallingChevron = "";
	self.RingSymbol = "";
	self.RingSymbol7Chev = "";
	self.WireDialledAddress = {};
	self.WireManualDial = false;
	self.WireBlock = false;
	if (IsValid(self.Entity)) then
		self.Entity:SetNWBool("ActChevronsL",false);
		self.Entity:SetNWBool("ActRotRingL",false);
		self:SetWire("Ring Symbol",""); -- Wire
		self:SetWire("Ring Chev7 Symbol",""); -- Wire
	end
end