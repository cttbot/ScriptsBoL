if myHero.charName ~= "Malphite" then return end

assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("QDGEFJKGJKD") 

--A basic BoL template for the Eclipse Lua Development Kit module's execution environment written by Nader Sl.
player = GetMyHero()

-- called once when the script is loaded
function OnLoad()

require "SxOrbwalk" 
require "VPrediction"
print("<b><font color=\"#FF001E\"> Malphiterino </font></b><font color=\"#FF980F\"> dont feederino </font><font color=\"#FF001E\"></font><b><font color=\"#FF001E\"> loaded </font></b><font color=\"#FF980F\"> loaded </font><font color=\"#FF001E\"></font><b><font color=\"#FF001E\"> GL&HF </font></b><font color=\"#FF980F\">")
TargetSelector = TargetSelector(TARGET_MOST_AD, 1400, DAMAGE_MAGICAL, false, true)
Variables()
Menu()

end

-- handles script logic, a pure high speed loop
function OnTick()
IgniteCheck()
Checks()
TargetSelector:update()
Target = GetCustomTarget()
SxOrb:ForceTarget(Target)
CastAutoR()
KSQ()
KSR()

  if Target ~= nil then
  if Settings.combo.comboKey then
      Combo(Target)
    end
  end
  
  if Target ~= nil then
  if Settings.harass.harass then
    Harass(Target)
    end
    end
end

--handles overlay drawing (processing is not recommended here,use onTick() for that)
function OnDraw()
  if not myHero.dead then 
    if ValidTarget(Target) then 
      DrawText3D("Current Target",Target.x-100, Target.y-50, Target.z, 20, 0xFFFFFF00)
      DrawCircle(Target.x, Target.y, Target.z, 150, ARGB(200,100 ,100,0 ))
    end
    
    if SkillQ.ready and Settings.Draw.DrawQ then 
      DrawCircle(myHero.x, myHero.y, myHero.z, 625, ARGB(200,50 ,100,0 ))
    end
    if SkillW.ready and Settings.Draw.DrawW then 
      DrawCircle(myHero.x, myHero.y, myHero.z, 225, ARGB(200,50 ,100,0 ))
    end
    if SkillE.ready and Settings.Draw.DrawE then 
      DrawCircle(myHero.x, myHero.y, myHero.z, 370, ARGB(200,50 ,100,0 ))
    end
    if SkillR.ready and Settings.Draw.DrawR then 
      DrawCircle(myHero.x, myHero.y, myHero.z, 1000, ARGB(200,50 ,100,0 ))
    end
  end
end

--handles input
function OnWndMsg(msg,key)

end

-- listens to chat input
function OnSendChat(txt)

end

-- listens to spell
function OnProcessSpell(owner,spell)

end

-- Check
function Checks()
  SkillQ.ready = (myHero:CanUseSpell(_Q) == READY)
  SkillW.ready = (myHero:CanUseSpell(_W) == READY)
  SkillE.ready = (myHero:CanUseSpell(_E) == READY)
  SkillR.ready = (myHero:CanUseSpell(_R) == READY)
  _G.DrawCircle = _G.oldDrawCircle
  IREADY = (ignite ~= nil and myHero:CanUseSpell(ignite) == READY)
end

-- custom target
function GetCustomTarget()
  if SelectedTarget ~= nil and ValidTarget(SelectedTarget, 1500) and (Ignore == nil or (Ignore.networkID ~= SelectedTarget.networkID)) then
    return SelectedTarget
  end
  TargetSelector:update() 
  if TargetSelector.target and not TargetSelector.target.dead and TargetSelector.target.type == myHero.type then
    return TargetSelector.target
  else
    return nil
  end
end

-- Menu
function Menu()
Settings = scriptConfig("Malphiterino", "malphite")    
 
Settings:addSubMenu("["..myHero.charName.."] - Combo", "combo")
Settings.combo:addParam("comboKey", "Combo Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("32"))
Settings.combo:addParam("UseR", "Use (R)", SCRIPT_PARAM_ONKEYTOGGLE, true, GetKey("N"))
Settings.combo:addParam("UseRP", "Use R if Target HP < x%", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
Settings.combo:addParam("UseQ", "Use (Q)", SCRIPT_PARAM_ONOFF, true)
Settings.combo:addParam("UseW", "Use (W)", SCRIPT_PARAM_ONOFF, true)
Settings.combo:addParam("UseE", "Use (E)", SCRIPT_PARAM_ONOFF, true)

Settings:addSubMenu("["..myHero.charName.."] - Harass", "harass")
Settings.harass:addParam("harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
Settings.harass:addParam("HarassR", "Use (R)", SCRIPT_PARAM_ONOFF, false)
Settings.harass:addParam("HarassQ", "Use (Q)", SCRIPT_PARAM_ONOFF, true)
Settings.harass:addParam("HarassW", "Use (W)", SCRIPT_PARAM_ONOFF, true)
Settings.harass:addParam("HarassE", "Use (E)", SCRIPT_PARAM_ONOFF, true)
Settings.harass:addParam("manah", "Min. Mana To Harass", SCRIPT_PARAM_SLICE, 100, 0, 600, 0)

Settings:addSubMenu("["..myHero.charName.."] - Auto Ult ", "AutoUlt")
Settings.AutoUlt:addParam("UseAutoR", "Auto R if X enemie", SCRIPT_PARAM_ONKEYTOGGLE, true, GetKey("C"))
Settings.AutoUlt:addParam("ARX", "X = ", SCRIPT_PARAM_SLICE, 5, 1, 5, 0)  

Settings:addSubMenu("["..myHero.charName.."] - Draw", "Draw")
Settings.Draw:addParam("DrawQ", "Draw (Q)", SCRIPT_PARAM_ONOFF, true)
Settings.Draw:addParam("DrawW", "Draw (W)", SCRIPT_PARAM_ONOFF, false)
Settings.Draw:addParam("DrawE", "Draw (E)", SCRIPT_PARAM_ONOFF, true)
Settings.Draw:addParam("DrawR", "Draw (R)", SCRIPT_PARAM_ONOFF, true)

Settings:addSubMenu("["..myHero.charName.."] - Misc", "Misc")
Settings.Misc:addParam("Whenignite","Use Ignite: ", SCRIPT_PARAM_LIST, 2, {"Never", "combo"})
Settings.Misc:addParam("KSQ", "Auto KS with Q", SCRIPT_PARAM_ONOFF, true)
Settings.Misc:addParam("KSR", "Auto KS with R", SCRIPT_PARAM_ONOFF, true)


Settings.combo:permaShow("comboKey")
Settings.harass:permaShow("harass")
Settings.combo:permaShow("UseR")
Settings.AutoUlt:permaShow("UseAutoR")
Settings.AutoUlt:permaShow("ARX")
      
Settings:addSubMenu("["..myHero.charName.."] - Orbwalking Settings", "Orbwalking")
    SxOrb:LoadToMenu(Settings.Orbwalking) 
    TargetSelector.name = "Malphite"
  Settings:addTS(TargetSelector)    
end

-- combo
function Combo(unit)
local TargetHealthPercent = (Target.health/Target.maxHealth)*100
if Settings.combo.UseR and Settings.combo.UseRP >= TargetHealthPercent then
  if unit ~= nil and GetDistance(unit) <= 1000 and SkillR.ready then
    CastPosition,  HitChance,  Position = VP:GetCircularCastPosition(unit, SkillR.delay, SkillR.width, SkillR.range, SkillR.speed, myHero, false) 
    if HitChance >= 2 then
      Packet("S_CAST", {spellId = _R, fromX = CastPosition.x, fromY = CastPosition.z, toX = CastPosition.x, toY = CastPosition.z}):send()
    end
  end
end
if unit ~= nil and GetDistance(unit) < 600 and Settings.Misc.Whenignite == 2 then
if IREADY then  CastSpell(ignite, unit)
  end
end
if Settings.combo.UseQ then
 if unit ~= nil and GetDistance(unit) <= 625 and SkillQ.ready then
  Packet("S_CAST", {spellId = _Q, targetNetworkId = unit.networkID}):send()
    end
  end
if Settings.combo.UseE then
 if unit ~= nil and GetDistance(unit) < 370 and SkillE.ready then
  Packet("S_CAST", {spellId = _E}):send()
    end
  end
if Settings.combo.UseW then
 if unit ~= nil and GetDistance(unit) < 225 and SkillW.ready then
  Packet("S_CAST", {spellId = _W}):send()
    end
  end
end

-- harass
function Harass(unit)
if Settings.harass.HarassR then
  if unit ~= nil and GetDistance(unit) <= 1000 and SkillR.ready then
    CastPosition,  HitChance,  Position = VP:GetCircularCastPosition(unit, SkillR.delay, SkillR.width, SkillR.range, SkillR.speed, myHero, false) 
    if HitChance >= 2 then
      Packet("S_CAST", {spellId = _R, fromX = CastPosition.x, fromY = CastPosition.z, toX = CastPosition.x, toY = CastPosition.z}):send()
    end
  end
end
if Settings.harass.HarassQ and myHero.mana >= Settings.harass.manah then
 if unit ~= nil and GetDistance(unit) <= 625 and SkillQ.ready then
  Packet("S_CAST", {spellId = _Q, targetNetworkId = unit.networkID}):send()
    end
  end
if Settings.harass.HarassE and myHero.mana >= Settings.harass.manah then
 if unit ~= nil and GetDistance(unit) < 370 and SkillE.ready then
  Packet("S_CAST", {spellId = _E}):send()
    end
  end

if Settings.harass.HarassW and myHero.mana >= Settings.harass.manah then
 if unit ~= nil and GetDistance(unit) < 225 and SkillW.ready then
  Packet("S_CAST", {spellId = _W}):send()
    end
  end
end


--variables
function Variables()
SkillQ = { Range = 625, width = 0, speed = 1200, delay = .5, spellType = "enemyCast", riskLevel = "extreme", cc = true, hitLineCheck = false}
SkillW = { Range = 225, width = 0, speed = math.huge, delay = .5, spellType = "selfCast", riskLevel = "noDmg", cc = false, hitLineCheck = false}
SkillE = { Range = 385, width = 400, speed = math.huge, delay = .5, spellType = "selfCast", riskLevel = "kill", cc = false, hitLineCheck = false}
SkillR = { Range = 1000, width = 270, speed = 700, delay = 0, spellType = "skillShot", riskLevel = "extreme", cc = true, hitLineCheck = false, timer = 0}
  
VP = VPrediction()
_G.oldDrawCircle = rawget(_G, 'DrawCircle')
_G.DrawCircle = DrawCircle2

  
end

-- selector
function OnWndMsg(Msg, Key) 
  
  if Msg == WM_LBUTTONDOWN then
    local minD = 0
    local Target = nil
    for i, unit in ipairs(GetEnemyHeroes()) do
      if ValidTarget(unit) then
        if GetDistance(unit, mousePos) <= minD or Target == nil then
          minD = GetDistance(unit, mousePos)
          Target = unit
        end
      end
    end

    if Target and minD < 115 then
      if SelectedTarget and Target.charName == SelectedTarget.charName then
        SelectedTarget = nil
      else
        SelectedTarget = Target
      end
    end
  end
end

-- Cercle selector
function DrawCircle2(x, y, z, radius, color)
  local vPos1 = Vector(x, y, z)
  local vPos2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
  local tPos = vPos1 - (vPos1 - vPos2):normalized() * radius
  local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
end

--auto R
function CastAutoR()
if SkillR.ready then
if Settings.AutoUlt.UseAutoR then
  for _, unit in pairs(GetEnemyHeroes()) do
      local rPos, HitChance, maxHit, Positions = VP:GetCircularAOECastPosition(unit, SkillR.delay, SkillR.width, SkillR.range, SkillR.speed, myHero)
      if ValidTarget(unit, SkillR.range) and rPos ~= nil and maxHit >= Settings.AutoUlt.ARX then
       if HitChance >= 3 then
          Packet("S_CAST", {spellId = _R, fromX = rPos.x, fromY = rPos.z, toX = rPos.x, toY = rPos.z}):send()
      end
    end
  end
end
end
end

--ignite
function IgniteCheck()
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then
    ignite = SUMMONER_1
  elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then
    ignite = SUMMONER_2 
  end
 end
 
 -- KS
 function KSQ()
  for _, unit in pairs(GetEnemyHeroes()) do
  if GetDistance(unit) <= 625 then
    if not unit.dead and Settings.Misc.KSQ then
          if unit.health <= getDmg("Q", unit, myHero) + (myHero.ap/2)then
          Packet("S_CAST", {spellId = _Q, targetNetworkId = unit.networkID}):send()
        end   
      end     
    end
 end
 end
 
 function KSR()
  for _, unit in pairs(GetEnemyHeroes()) do
  if GetDistance(unit) <= 1000 then
    if not unit.dead and Settings.Misc.KSR then
          if unit.health <= getDmg("R", unit, myHero) + (myHero.ap) then
            CastPosition,  HitChance,  Position = VP:GetCircularAOECastPosition(unit, SkillR.delay, SkillR.width, SkillR.range, SkillR.speed, myHero, false) 
       if HitChance >= 2 then
      Packet("S_CAST", {spellId = _R, fromX = CastPosition.x, fromY = CastPosition.z, toX = CastPosition.x, toY = CastPosition.z}):send()
        end   
      end     
    end
   end
  end
end