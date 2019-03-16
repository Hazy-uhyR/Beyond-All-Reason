local versionNumber = "v1.0"

function widget:GetInfo()
  return {
    name      = "Share Tracker",
    desc      = versionNumber .. " Marks received units.",
    author    = "Evil4Zerggin/TheFatController",
    date      = "17 August 2009",
    license   = "GNU LGPL, v2.1 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local fontfile = LUAUI_DIRNAME .. "fonts/" .. Spring.GetConfigString("ui_font", "FreeSansBold.otf")
local vsx,vsy = Spring.GetViewGeometry()
local fontfileScale = (0.5 + (vsx*vsy / 5700000))
local fontfileSize = 25
local fontfileOutlineSize = 7
local fontfileOutlineStrength = 1.5
local font = gl.LoadFont(fontfile, fontfileSize*fontfileScale, fontfileOutlineSize*fontfileScale, fontfileOutlineStrength)

----------------------------------------------------------------
--config
----------------------------------------------------------------
--negative to disable blinking
local blinkPeriod = -1
local ttl = 10
local highlightSize = 16
local highlightLineMin = 10
local highlightLineMax = 20
local edgeMarkerSize = 8
local lineWidth = 1
local maxAlpha = 1
local fontSize = 16
local unitCount = 0
local msgTimer = 0
local blink = false
local blinkTime = 0

local minimapHighlightSize = 3
local minimapHighlightLineMin = 4
local minimapHighlightLineMax = 8

----------------------------------------------------------------
--speedups
----------------------------------------------------------------
local ArePlayersAllied = Spring.ArePlayersAllied
local GetPlayerInfo = Spring.GetPlayerInfo
local GetTeamColor = Spring.GetTeamColor
local GetSpectatingState = Spring.GetSpectatingState
local WorldToScreenCoords = Spring.WorldToScreenCoords
local GetUnitPosition = Spring.GetUnitPosition
local GetMyTeamID = Spring.GetMyTeamID
local PlaySoundFile = Spring.PlaySoundFile
local glColor = gl.Color
local glRect = gl.Rect
local glLineWidth = gl.LineWidth
local glShape = gl.Shape
local glPolygonMode = gl.PolygonMode
local glText = gl.Text
local max = math.max
local abs = math.abs
local strSub = string.sub
local GL_LINES = GL.LINES
local GL_TRIANGLES = GL.TRIANGLES
local GL_LINE = GL.LINE
local GL_FRONT_AND_BACK = GL.FRONT_AND_BACK
local GL_FILL = GL.FILL

----------------------------------------------------------------
--vars
----------------------------------------------------------------
--table; i = {r, g, b, a, px, pz, label, expiration}
local mapPoints = {}
local lastPoint = 1
local myPlayerID
local timeNow, timePart
local on = false
local mapX = Game.mapX * 512
local mapY = Game.mapY * 512

local vsx, vsy, sMidX, sMidY

----------------------------------------------------------------
--local functions
----------------------------------------------------------------
local function GetPlayerColor(playerID)
	local _, _, _, teamID = GetPlayerInfo(playerID)
	if (not teamID) then return nil end
	return GetTeamColor(teamID)
end

local function StartTime()
	local viewSizeX, viewSizeY = widgetHandler:GetViewSizes()
	widget:ViewResize(viewSizeX, viewSizeY)
	timeNow = 0
	timePart = 0
	on = true
end

----------------------------------------------------------------
--callins
----------------------------------------------------------------

function widget:Initialize()
	timeNow = false
	timePart = false
	myPlayerID = Spring.GetMyPlayerID()
end

function widget:DrawScreen()
	if (not on) or (next(mapPoints) == nil) then return end
		
	glLineWidth(lineWidth)
	
	for unitID,defs in pairs(mapPoints) do
		local curr = mapPoints[i]
		local alpha = maxAlpha * (defs.time - timeNow) / ttl
		if (alpha <= 0) then
			mapPoints[unitID] = nil
		else
		    defs.x, defs.y, defs.z  = Spring.GetUnitPosition(unitID)
		    if defs.x then 
				local sx, sy, sz = WorldToScreenCoords(defs.x, defs.y, defs.z)
				if blink then
					glColor(defs.r, defs.g, defs.b, alpha * 0.5)
				else
					glColor(defs.r, defs.g, defs.b, alpha)
				end
				if (sx >= 0 and sy >= 0
						and sx <= vsx and sy <= vsy) then
					--in screen
					local vertices = {
						{v = {sx, sy - highlightLineMin, 0}},
						{v = {sx, sy - highlightLineMax, 0}},
						{v = {sx, sy + highlightLineMin, 0}},
						{v = {sx, sy + highlightLineMax, 0}},
						{v = {sx - highlightLineMin, sy, 0}},
						{v = {sx - highlightLineMax, sy, 0}},
						{v = {sx + highlightLineMin, sy, 0}},
						{v = {sx + highlightLineMax, sy, 0}},
					}
					glPolygonMode(GL_FRONT_AND_BACK, GL_LINE)
					glRect(sx - defs.highlightSize, sy - defs.highlightSize, sx + defs.highlightSize, sy + defs.highlightSize)
					glShape(GL_LINES, vertices)
				else
					if blink then
						glColor(defs.r, defs.g, defs.b, alpha)
					end
					--out of screen
					glPolygonMode(GL_FRONT_AND_BACK, GL_FILL)
					--flip if behind screen
					if (sz > 1) then
						sx = sMidX - sx
						sy = sMidY - sy
					end
					local xRatio = sMidX / abs(sx - sMidX)
					local yRatio = sMidY / abs(sy - sMidY)
					local edgeDist, vertices, textX, textY, textOptions
					if (xRatio < yRatio) then
						edgeDist = (sy - sMidY) * xRatio + sMidY
						if (sx > 0) then
							vertices = {
								{v = {vsx, edgeDist, 0}},
								{v = {vsx - edgeMarkerSize, edgeDist + edgeMarkerSize, 0}},
								{v = {vsx - edgeMarkerSize, edgeDist - edgeMarkerSize, 0}},
							}
							textX = vsx - edgeMarkerSize
							textY = edgeDist - fontSize * 0.5
							textOptions = "rn"
						else
							vertices = {
								{v = {0, edgeDist, 0}},
								{v = {edgeMarkerSize, edgeDist - edgeMarkerSize, 0}},
								{v = {edgeMarkerSize, edgeDist + edgeMarkerSize, 0}},
							}
							textX = edgeMarkerSize
							textY = edgeDist - fontSize * 0.5
							textOptions = "n"
						end
					else
						edgeDist = (sx - sMidX) * yRatio + sMidX
						if (sy > 0) then
							vertices = {
								{v = {edgeDist, vsy, 0}},
								{v = {edgeDist - edgeMarkerSize, vsy - edgeMarkerSize, 0}},
								{v = {edgeDist + edgeMarkerSize, vsy - edgeMarkerSize, 0}},
							}
							textX = edgeDist
							textY = vsy - edgeMarkerSize - fontSize
							textOptions = "cn"
						else
							vertices = {
								{v = {edgeDist, 0, 0}},
								{v = {edgeDist + edgeMarkerSize, edgeMarkerSize, 0}},
								{v = {edgeDist - edgeMarkerSize, edgeMarkerSize, 0}},
							}
							textX = edgeDist
							textY = edgeMarkerSize
							textOptions = "cn"
						end
					end
					glShape(GL_TRIANGLES, vertices)

					font:Begin()
					font:SetTextColor(1, 1, 1, alpha)
					font:Print(defs.unitName, textX, textY, fontSize, textOptions)
					font:End()
				end
			end
		end
	end
	glColor(1, 1, 1)
	glLineWidth(1)
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL)
end

function widget:ViewResize(n_vsx,n_vsy)
	vsx,vsy = Spring.GetViewGeometry()
	widgetScale = (0.5 + (vsx*vsy / 5700000))
  local newFontfileScale = (0.5 + (vsx*vsy / 5700000))
  if (fontfileScale ~= newFontfileScale) then
    fontfileScale = newFontfileScale
    gl.DeleteFont(font)
    font = gl.LoadFont(fontfile, fontfileSize*fontfileScale, fontfileOutlineSize*fontfileScale, fontfileOutlineStrength)
  end

  sMidX = vsx * 0.5
  sMidY = vsy * 0.5
end

function widget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)
  if newTeam == GetMyTeamID() then
    if (not timeNow) then
		StartTime()
	end
	local x,y,z = GetUnitPosition(unitID)
	local r,g,b = Spring.GetTeamColor(oldTeam)
	if x and r then
      mapPoints[unitID] = {r=r,g=g,b=b,x=x,y=y,z=z,unitName = "*"..UnitDefs[unitDefID].humanName, time = (timeNow + ttl), highlightSize=UnitDefs[unitDefID].radius*0.6}
      unitCount = unitCount + 1
    end
  end
end

function widget:Update(dt)
	if (not timeNow) then
		StartTime()
	else
		timeNow = timeNow + dt
		timePart = timePart + dt
	end
	if blinkTime > 0.03 then
	  blink = not blink
	  blinkTime = 0
	else
	  blinkTime = blinkTime + dt
	end
	if unitCount > 0 then
	  msgTimer = msgTimer + dt
	  if (msgTimer > 0.1) then
	    Spring.Echo("You received " .. unitCount .. " new unit(s)*")
	    Spring.PlaySoundFile("beep4", 1, 'ui')
	    unitCount = 0
	    msgTimer = 0
	  end
	end
end

function widget:DrawInMiniMap(sx, sy)
	if (not on) then return end
	glLineWidth(lineWidth)
	
	local ratioX = sx / mapX
	local ratioY = sy / mapY
	
	for unitID,defs in pairs(mapPoints) do
		if defs.x then
			local x = defs.x * ratioX
			local y = sy - defs.z * ratioY
			local alpha = maxAlpha * (defs.time - timeNow) / ttl
			if (alpha <= 0) then
				mapPoints[unitID] = nil
			else
				glColor(defs.r, defs.g, defs.b, alpha)
				local vertices = {
						{v = {x, y - minimapHighlightLineMin, 0}},
						{v = {x, y - minimapHighlightLineMax, 0}},
						{v = {x, y + minimapHighlightLineMin, 0}},
						{v = {x, y + minimapHighlightLineMax, 0}},
						{v = {x - minimapHighlightLineMin, y, 0}},
						{v = {x - minimapHighlightLineMax, y, 0}},
						{v = {x + minimapHighlightLineMin, y, 0}},
						{v = {x + minimapHighlightLineMax, y, 0}},
					}
					glPolygonMode(GL_FRONT_AND_BACK, GL_LINE)
					glRect(x - minimapHighlightSize, y - minimapHighlightSize, x + minimapHighlightSize, y + minimapHighlightSize)
					glShape(GL_LINES, vertices)
			end
		end
	end
	
	glColor(1, 1, 1)
	glLineWidth(1)
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL)
end
