--setclipboard('https://link-target.net/635944/artemis-key')
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "artemis",
    LoadingTitle = "artemis",
    LoadingSubtitle = "bubble gum simulator",
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
 local MiscTab = Window:CreateTab("misc", 4483362458)
 --> VALUES <--
 getgenv().autoFarm = false
 getgenv().autoCollect = false
 getgenv().autoNextWrld = false
 getgenv().area = "Town"
 local Client = require(game.ReplicatedStorage.Library.Client)
 local Library = require(game.ReplicatedStorage.Library)
 local Orbs = getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.Game.Orbs)
 --> FUNCTIONS <--
 debug.setupvalue(Client.Network.Invoke, 1, function() return true end)
debug.setupvalue(Client.Network.Fire, 1, function() return true end)
function GetCoins(Area)
    local Coins = {}
    for i,v in next, Client.Network.Invoke('Get Coins') do 
        if v.a == Area then 
            Coins[i] = v
        end 
    end 
    return Coins
end 
function GetPets()
    return Client.PetCmds.GetEquipped() 
end 
while true do
    if getgenv().autoCollect then
        for i,v in pairs(workspace.__THINGS.Orbs:GetChildren()) do 
            Orbs.Collect(v)
        end 
        workspace.__THINGS.Orbs.ChildAdded:Connect(function(v)
            Orbs.Collect(v)
        end)
        task.wait(0.001)
    end
    task.wait(0.001)
end
function autoFarm()
    
end
--> MENU <--
local autoclick = MainTab:CreateToggle({
    Name = "auto farm",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().autoClick = Value
        autoFarm()
    end,
 })
 local autoSnowflake = MainTab:CreateToggle({
    Name = "auto collect",
    CurrentValue = false,
    Callback = function(state)
        getgenv().autoCollect=state
    end,
 })
 local Label = MainTab:CreateLabel("this feature is in beta. so far this will only take you to one house.")

 local ShopButton = TPsTab:CreateButton({
    Name = "Shop TP",
    Callback = function()
local args = {
[1] = "Teleport",
[2] = "Buy"
} game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(unpack(args))
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
        Suffix = "",
        CurrentValue = 50,
        Flag = "Slider1", 
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