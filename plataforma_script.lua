local TweenService = game:GetService("TweenService")

local platform = script.Parent
local pointA = workspace:WaitForChild("PointA")
local pointB = workspace:WaitForChild("PointB")

local tweenInfo = TweenInfo.new(
	10, -- tempo (segundos)
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	-1, -- loop infinito
	true -- reverte (vai e volta)
)

local tweenAtoB = TweenService:Create(platform, tweenInfo, {Position = pointB.Position})
tweenAtoB:Play()