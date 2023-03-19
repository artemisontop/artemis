			--setclipboard('https://link-target.net/635944/artemis-key')
			local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
			local Window = Rayfield:CreateWindow({
				Name = "artemis",
				LoadingTitle = "artemis",
				LoadingSubtitle = "super power training simulator",
				ConfigurationSaving = {
				   Enabled = true,
				   FolderName = "ArtemisHub", -- Create a custom folder for your hub/game
				   FileName = "ArtemisSPTS"
				},
				Discord = {
				   Enabled = false,
				   Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
				   RememberJoins = true -- Set this to false to make them join the discord every time they load it up
				},
				KeySystem = false, -- Set this to true to use our key system
				KeySettings = {
				   Title = "artemis",
				   Subtitle = "key system",
				   Note = "artemis on top (key link copied btw)",
				   FileName = "artemisKey",
				   SaveKey = true,
				   GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
				   Key = "https://pastebin.com/raw/2EFtX1V9"
				}
			 }) 
			 local MainTab = Window:CreateTab("main", 4483362458)
			 local TPsTab = Window:CreateTab("TPs", 4483362458)
			 local MiscTab = Window:CreateTab("misc", 4483362458)
			 --> VALUES <--
			 getgenv().autoFS = false
			 getgenv().autoBT = false
			 getgenv().autoPP = false
			 getgenv().autoJF = false
			 getgenv().autoMS = false
			 --> FUNCTIONS <--
				function autoFS()
					while  getgenv().autoFS == true do
local args = {
    [1] = {
        [1] = "Add_FS_Request"
    }
}
game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
wait(0.0000000001)
				end
			end
			function autoBT()
				while  getgenv().autoBT == true do
local args = {
    [1] = {
        [1] = "+BT1"
    }
}
game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

wait(0.0000000001)
end 
end
function autoJF()
	while getgenv().autoJF == true do
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"Add_JF_Request"})
		task.wait(0.0000000001)
	end
end
function autoMS()
	while getgenv().autoMS == true do
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"Add_MS_Request"})
		task.wait(0.0000000001)
	end
end
function autoPP()
	while getgenv().autoPP == true do
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"+PP1"})
		task.wait(0.0000000001)
	end
end
			--> MENU <--
			local autoFS = MainTab:CreateToggle({
				Name = "auto fist strength",
				CurrentValue = false,
				Flag = "autoFS",
				Callback = function(Value)
					getgenv().autoFS = Value
					autoFS()
				end,
			 })
			 local autoBT = MainTab:CreateToggle({
				Name = "auto body toughness",
				CurrentValue = false,
				Flag = "autoBT",
				Callback = function(Value)
					getgenv().autoBT = Value
					autoBT()
				end,
			 })
			 local autoPP = MainTab:CreateToggle({
				Name = "auto psychic power",
				CurrentValue = false,
				Flag = "autoBT",
				Callback = function(Value)
					getgenv().autoPP = Value
					autoPP()
				end,
			 })
			 local autoJF = MainTab:CreateToggle({
				Name = "auto jump force",
				CurrentValue = false,
				Flag = "autoJF",
				Callback = function(Value)
					getgenv().autoJF = Value
					autoJF()
				end,
			 })
			 local autoMS = MainTab:CreateToggle({
				Name = "auto movement speed",
				CurrentValue = false,
				Flag = "autoMS",
				Callback = function(Value)
					getgenv().autoMS = Value
					autoMS()
				end,
			 })
			 local FOV = MiscTab:CreateSlider({
				Name = "FOV",
				Range = {0, 180},
				Increment = 60,
				Suffix = "",
				CurrentValue = 70,
				Flag = "Slider1",
				Callback = function(Value)
					game:GetService'Workspace'.Camera.FieldOfView = Value
			
				end})
				local WalkSpeed = MiscTab:CreateSlider({
					Name = "Walk Speed",
					Range = {16, 350},
					Increment = 2,
					Suffix = "Speed",
					CurrentValue = 50,
					Flag = "Slider2", 
					Callback = function(Value)
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
			
					end,
				})
			 local Button = MiscTab:CreateButton({
				Name = "Anti-AFK",
				Callback = function()
					for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
						v:Disable()
						end
				end,
			 })