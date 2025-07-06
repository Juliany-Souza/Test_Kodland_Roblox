local player = game:GetService("Players")
-- referencia ao RunService para permitir animacao continua da moeda
local RunService = game:GetService("RunService")
local coin = script.Parent -- Path to coin

local used = false

-- faz a moeda girar constantemente em torno do eixo Y
RunService.Heartbeat:Connect(function()
	coin.CFrame = coin.CFrame * CFrame.Angles(0, math.rad(1), 0)
end)

function giveCoin(part)
    -- verificacao se o objeto que tocou e um personagem com Humanoid e se a moeda ja foi usada
	if part.Parent:FindFirstChild("Humanoid") == nil or used == true then
		return
	end
	used = true
	
    -- checamos se player, leaderstats e Coins realmente existem
	-- isso evita erros no console e garante que so jogadores validos ganhem moedas
	local player = player:GetPlayerFromCharacter(part.Parent)
    -- trocamos o nome Money para Coins, para adicionar uma moeda quando coletada
	if player and player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Coins") then
		player.leaderstats.Coins.Value = player.leaderstats.Coins.Value + 1
	end
	

	coin.Transparency = 1
	coin.Decal.Transparency = 1
	script.Disabled = true
	wait(math.random (20,30))
	coin.Transparency = 0
	coin.Decal.Transparency = 0
	script.Disabled = false
end

coin.Touched:Connect(giveCoin)