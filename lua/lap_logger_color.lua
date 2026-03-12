-- EdgeTX Telemetry Script (Color): Lap Logger (Simple)
-- 功能：同一个开关“按一下开始，再按一下停止并保存一条记录”。循环往复。
-- 说明：把 TRIGGER_SWITCH 改成你的触发开关（建议用逻辑开关脉冲，例如 L32）。

local TRIGGER_SWITCH = "L32"   -- 例如: "L32" / "SH" / "SF"
local MAX_LAPS = 20

local running = false
local startCs = 0
local laps = {}
local pressLast = false

local function nowCs()
  return getTime() -- 1/100 秒
end

local function fmt(cs)
  local sec = math.floor(cs / 100)
  local c = cs % 100
  local m = math.floor(sec / 60)
  local s = sec % 60
  return string.format("%02d:%02d.%02d", m, s, c)
end

local function isPressed(name)
  local v = getValue(name)
  return (type(v) == "number") and (v > 0)
end

local function onTrigger()
  local t = nowCs()
  if not running then
    running = true
    startCs = t
  else
    running = false
    local dt = t - startCs
    if dt < 0 then dt = 0 end
    laps[#laps + 1] = dt
    if #laps > MAX_LAPS then
      table.remove(laps, 1)
    end
  end
end

local function run(event)
  local p = isPressed(TRIGGER_SWITCH)
  if p and (not pressLast) then
    onTrigger()
  end
  pressLast = p

  lcd.clear()
  lcd.drawText(8, 8, "Lap Logger", MIDSIZE)
  lcd.drawText(8, 32, "Switch: " .. TRIGGER_SWITCH, SMLSIZE)

  if running then
    local cur = nowCs() - startCs
    lcd.drawText(8, 52, "Status: RUNNING", 0)
    lcd.drawText(8, 68, "Current: " .. fmt(cur), 0)
  else
    lcd.drawText(8, 52, "Status: STOPPED", 0)
    lcd.drawText(8, 68, "Current: --:--.--", 0)
  end

  lcd.drawText(8, 92, "Saved laps (newest first):", SMLSIZE)
  local y = 108
  local shown = 0
  for i = #laps, 1, -1 do
    lcd.drawText(8, y, string.format("%02d  %s", i, fmt(laps[i])), SMLSIZE)
    y = y + 14
    shown = shown + 1
    if shown >= 8 then break end
  end

  return 0
end

return { run = run }
