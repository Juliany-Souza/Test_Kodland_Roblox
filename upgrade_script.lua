local buyButton = script.Parent 
local clickDetector = buyButton.ClickDetector 
local upgradeCost = 3


local function giveUpgrade(player)
	local humanoid = player.Character:findFirstChild("Humanoid") 

    -- verificamos se 'leaderstats' existe antes de acessar 'Coins'
	local playerStats = player:FindFirstChild("leaderstats") 
	local playerGold = playerStats and playerStats:FindFirstChild("Coins")  
	
    -- adicionamos verificacao completa para evitar erros se algum objeto estiver faltando
	if  humanoid and playerGold and playerGold.Value >= upgradeCost then
        -- Subtrai o custo do saldo do jogador (antes isso nao era feito!)
		playerGold.Value = playerGold.Value - upgradeCost
		humanoid.UseJumpPower = true
		humanoid.JumpPower = 150
	end
end

clickDetector.MouseClick:Connect(giveUpgrade)