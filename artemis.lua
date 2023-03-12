if game.PlaceId == 8750997647 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "artemis | Tapping Legends X", HidePremium = false, IntroEnabled = true, IntroText = "artemis hub", SaveConfig = true, ConfigFolder = "TLX"})
    --values
    _G.AutoFarm = false
    _G.AutoRebirth = false
    _G.RebirthAmt = "1"
    _G.AutoHatch = false
    _G.selectedEgg = "Basic Egg"
    --functions
    function autoFarm()
        while _G.AutoFarm == true do
    game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
    wait(0.0001)
    
    end
    end
    function autoRebirth()
        while _G.AutoRebirth == true do
    local args = {
        [1] = _G.RebirthAmt
    }
    game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(unpack(args))
    wait(0.0001)
    
    end
    end
    function autoHatch()
        while _G.AutoHatch == true do
    local args = {
        [1] = _G.selectedEgg,
        [2] = 1
    }
    game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(unpack(args))
    wait(0.0001)
        end
    end
    --tabs
    local AutoTab = Window:MakeTab({
        Name = "Auto",
        Icon = "rbxassetid://4384401939",
        PremiumOnly = false
    })
    local EggTab = Window:MakeTab({
        Name = "Eggs",
        Icon = "rbxassetid://4384401939",
        PremiumOnly = false
    })
    local TPTab = Window:MakeTab({
        Name = "TPs",
        Icon = "rbxassetid://4384401939",
        PremiumOnly = false
    })
    local OtherTab = Window:MakeTab({
        Name = "Random",
        Icon = "rbxassetid://4384401939",
        PremiumOnly = false
    })
    OrionLib:MakeNotification({
        Name = "artemis loaded",
        Content = "artemis on top | V0.1",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    --buttons
    
    AutoTab:AddToggle({
        Name = "Auto Click",
        Default = false,
        Callback = function(Value)
            _G.AutoFarm = Value
            autoFarm()
        end    
    })
    AutoTab:AddToggle({
        Name = "Auto Rebirth",
        Default = false,
        Callback = function(Value)
            _G.AutoRebirth = Value
            autoRebirth()
        end    
    })
    EggTab:AddDropdown({
        Name = "Rebirth Amount",
        Default = "1",
        Options = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16",},
        Callback = function(Value)
            _G.RebirthAmt = Value
            print(_G.RebirthAmt)
        end    
    })
    EggTab:AddLabel("Must be near egg to work!")
    EggTab:AddToggle({
        Name = "Auto Hatch",
        Default = false,
        Callback = function(Value)
            _G.AutoHatch = Value
            autoHatch()
        end    
    })
    EggTab:AddDropdown({
        Name = "Select Egg",
        Default = "Basic Egg",
        Options = {"Basic Egg", "Rare Egg", "Forest Egg", "Desert Egg", "Winter Egg", "Lava Egg", "Aqua Egg"},
        Callback = function(Value)
            _G.selectedEgg = Value
            print(_G.selectedEgg)
        end    
    })
    OtherTab:AddSlider({
        Name = "WalkSpeed",
        Min = 16,
        Max = 250,
        Default = 16,
        Color = Color3.fromRGB(196, 59, 59),
        Increment = 1,
        ValueName = "WalkSpeed",
        Callback = function(speed)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end    
    })
    OtherTab:AddButton({
        Name = "Anti-AFK",
        Callback = function(Value)
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
                v:Disable()
                end
        end
    })
    else
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        --universal script
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "artemis | universal", HidePremium = false, IntroEnabled = true, IntroText = "artemis hub", SaveConfig = true, ConfigFolder = "artemis"})
    local MainTab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4384401939",
        PremiumOnly = false
    })
    getgenv().ESP = false
    function ESP() 
        while getgenv.ESP == true do
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/artemisontop/artemis/main/LICENSE')))())
        end
    end
    MainTab:AddSlider({
        Name = "WalkSpeed",
        Min = 16,
        Max = 250,
        Default = 16,
        Color = Color3.fromRGB(196, 59, 59),
        Increment = 1,
        ValueName = "WalkSpeed",
        Callback = function(speed)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end    
    })
    MainTab:AddSlider({
        Name = "JumpPower",
        Min = 50,
        Max = 5000,
        Default = 50,
        Color = Color3.fromRGB(196, 59, 59),
        Increment = 5,
        ValueName = "JumpPower",
        Callback = function(jump)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
        end    
    })
    MainTab:AddButton({
        Name = "Fly",
        Callback = function(Value)
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/artemisontop/artemis/main/LICENSE')))()
           end    
    })
    MainTab:AddButton({
        Name = "Anti-AFK",
        Callback = function(Value)
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
                v:Disable()
                end
        end
    })
    MainTab:AddToggle({
        Name = "ESP",
        Default = false,
        Callback = function(Value)
            getgenv().ESP = Value
    
        end
    })
    OrionLib:Init()
    end
    
    