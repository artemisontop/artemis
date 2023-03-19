
if game.PlaceId == 3652625463 then
	--setclipboard('https://link-target.net/635944/artemis-key')
	local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
	local Window = Rayfield:CreateWindow({
		Name = "artemis",
		LoadingTitle = "artemis",
		LoadingSubtitle = "lifting simulator",
		ConfigurationSaving = {
		   Enabled = false,
		   FolderName = nil, -- Create a custom folder for your hub/game
		   FileName = "ArtemisHub"
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

	 --> VALUES <--
	 getgenv().autoStrength = false
	 getgenv().autoSell = false
	 --> FUNCTIONS <--
	 function autoStrength()
		while getgenv().autoStrength == true do
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"GainMuscle"})
		wait(0.01)
		end
	 end
	 function autoSell()
		while getgenv().autoSell == true do
			game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"SellMuscle"})
			wait(0.01)
		end
	 end

	 --> UI <--
	 local autoStrength = MainTab:CreateToggle({
		Name = "auto farm",
		CurrentValue = false,
		Callback = function(Value)
			getgenv().autoStrength = Value
			autoStrength()
		end,
	 })
	 local sellTP = MainTab:CreateToggle({
		Name = "auto sell",
		CurrentValue = false,
		Callback = function(Value)
			getgenv().autoSell = Value
			autoSell()
		end
	 })
			
			
			
			
			


 
    Rayfield:Init()
    end
    
    