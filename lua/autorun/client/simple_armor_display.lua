local nameFont = "TargetID"
local statsFont = "TargetIDSmall"
local color1 = Color( 0, 0, 0, 120 )
local color2 = Color( 0, 0, 0, 50 )

hook.Add( "HUDDrawTargetID", "SimpleArmorDisplay", function()
	return false
end )

hook.Add( "HUDPaint", "SimpleArmorDisplay", function()
	local visEnt = LocalPlayer():GetEyeTrace().Entity

	if not visEnt:IsValid() then return end
	if not visEnt:IsPlayer() then return end
	if not visEnt:Alive() then return end
	if visEnt:GetRenderMode() == RENDERMODE_TRANSALPHA then return end

	local nameText = visEnt:Nick()

	surface.SetFont( nameFont )
	local nameW, nameH = surface.GetTextSize( nameText )

	local mouseX, mouseY = gui.MousePos()

	if ( mouseX == 0 && mouseY == 0 ) then
		mouseX = ScrW() / 2
		mouseY = ScrH() / 2
	end

	local nameX = mouseX - nameW / 2
	local nameY = mouseY + 30

	draw.SimpleText( nameText, nameFont, nameX + 1, nameY + 1, color1 )
	draw.SimpleText( nameText, nameFont, nameX + 2, nameY + 2, color2 )
	draw.SimpleText( nameText, nameFont, nameX, nameY, team.GetColor( visEnt:Team() ) )

	local statsY = nameY + nameH + 5

	local statsText = visEnt:Health() .. "%   " .. visEnt:Armor() .. "%"

	surface.SetFont( statsFont )
	local statsW = surface.GetTextSize( statsText )
	local statsX = mouseX - statsW / 2

	draw.SimpleText( statsText, statsFont, statsX + 1, statsY + 1, color1 )
	draw.SimpleText( statsText, statsFont, statsX + 2, statsY + 2, color2 )
	draw.SimpleText( statsText, statsFont, statsX, statsY, team.GetColor( visEnt:Team() ) )
end )
