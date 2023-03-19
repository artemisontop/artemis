--setclipboard('https://link-target.net/635944/artemis-key')
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "artemis",
    LoadingTitle = "artemis",
    LoadingSubtitle = "bubble gum simulator",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "ArtemisHub", -- Create a custom folder for your hub/game
       FileName = "ArtemisBGS"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
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
 getgenv().autoClick = false
 getgenv().autoSnowflake = false
 getgenv().autoNextWrld = false
 --> FUNCTIONS <--
    function autoClick()
        while  getgenv().autoClick == true do
local args = {
[1] = "BlowBubble"
}
game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(unpack(args))

wait(0.01)
    end
end
local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(1.5,Enum.EasingStyle.Linear)

local lp = game.Players.LocalPlayer

function autoTP(v)
v = game.Workspace.ChristmasMap.Houses.House.Activation.Root.position
    if lp.Character and 
    lp.Character:FindFirstChild('HumanoidRootPart') then
        local cf = CFrame.new(v)
        local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
        a:Play()
         a.Completed:Wait()
         print('Teleporting Done!')
    end
end
--> MENU <--
local autoclick = MainTab:CreateToggle({
    Name = "auto farm",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().autoClick = Value
        autoClick()
    end,
 })
 local autoSnowflake = MainTab:CreateButton({
    Name = "auto snowflake",
    Callback = function()
        autoTP(game.Workspace.ChristmasMap.Houses.House.Activation.Root.position)
    end,
 })
 local Label = MainTab:CreateLabel("this feature is in beta. so far this will only take you to one house.")
 local autoNextWrld = MainTab:CreateToggle({
    Name = "auto next world",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().autoNextWrld = Value
        autoNextWrld()
    end,
 })
 local SellButton = TPsTab:CreateButton({
    Name = "Sell TP",
    Callback = function()
local args = {
[1] = "Teleport",
[2] = "Sell"
} game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(unpack(args))
    end,
 })
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
        Increment = 4,
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
