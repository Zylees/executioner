--fr fixed F1123

local module = {}

function module:executePlayer(target)
local Player = game.Players.LocalPlayer
local Target = game.Players[target]
if headSit then headSit:Disconnect() end
Player.Character:FindFirstChildOfClass('Humanoid').Sit = true
repeat 
	pcall(function()
		task.spawn(function()
			headSit = game.RunService.Heartbeat:Connect(function()
								pcall(function()
				if game.Players:FindFirstChild(Target.Name) and Target.Character ~= nil and Target.Character.HumanoidRootPart and Player.Character and Player.Character:FindFirstChildOfClass('Humanoid').Sit == true then
					Player.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(0),0)* CFrame.new(0,1.6,0.4)
				else
					headSit:Disconnect()
				end
									end)
			end)
		end)
		
		wait()
		
		local Flinger = Instance.new("BodyAngularVelocity")
		Flinger.Name = "gbafd9h134576hfad913456"
		Flinger.Parent = Player.Character.HumanoidRootPart
		Flinger.AngularVelocity = Vector3.new(0,-99999,0)
		Flinger.MaxTorque = Vector3.new(0,math.huge,0)
		Flinger.P = math.huge
		for i, v in next, Player.Character:GetChildren() do
			if v:IsA("BasePart") then
				v.CanCollide = false
				v.Massless = true
				v.Velocity = Vector3.new(0, 0, 0)
			end
		end
		wait()
	end)


until Target.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead or Target.Character.Humanoid == nil or Target == nil or Target.Character == nil or Player.Character:FindFirstChild("HumanoidRootPart") == nil or Player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead

print("Executed")
end
return module
