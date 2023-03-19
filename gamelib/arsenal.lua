	--setclipboard('https://link-target.net/635944/artemis-key')
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
    local Window = Rayfield:CreateWindow({
        Name = "artemis",
        LoadingTitle = "artemis",
        LoadingSubtitle = "arsenal (beta)",
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
     local VisualTab = Window:CreateTab("visual", 4483362458)
     local MiscTab = Window:CreateTab("misc", 4483362458)
     --> VALUES <--
     getgenv().silentAim = false
     getgenv().boxESP = true
     local player = game:GetService("Players").LocalPlayer
    --> FUNCTIONS <--
local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0,3,0)

for i,v in pairs(game.Players:GetChildren()) do
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    if v.TeamColor == lplr.TeamColor then
                        BoxOutline.Visible = false
                        Box.Visible = false
                    else
                        BoxOutline.Visible = true
                        Box.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    if v.TeamColor == lplr.TeamColor then
                        BoxOutline.Visible = false
                        Box.Visible = false
                    else
                        BoxOutline.Visible = true
                        Box.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end)
    local tracerState = false
    local Players = game:GetService("Players"):GetChildren()
    local localPlayer = game.Players.LocalPlayer
    local camera = game:GetService("Workspace").CurrentCamera
    local CurrentCamera = workspace.CurrentCamera
    for i,v in pairs(game.Players:GetChildren()) do
        local Tracer = Drawing.new("Line")
        Tracer.Visible = false
        Tracer.Color = Color3.new(0.352941, 0.643137, 0.811764)
        Tracer.Thickness = 1
        Tracer.Transparency = 1
    
        local function lineesp()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= localPlayer and v.Character.Humanoid.Health > 0 then
                    local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    if OnScreen then
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                        Tracer.To = Vector2.new(Vector.X, Vector.Y)
                        Tracer.Visible = tracerState
                    else
                        Tracer.Visible = false
                    end
                else
                    Tracer.Visible = false
                end
            end)
        end
        coroutine.wrap(lineesp)()
    end
    
    game.Players.PlayerAdded:Connect(function(v)
            local Tracer = Drawing.new("Line")
        Tracer.Visible = false
        Tracer.Color = Color3.new(0.352941, 0.643137, 0.811764)
        Tracer.Thickness = 1
        Tracer.Transparency = 1
    
        local function lineesp()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= localPlayer and v.Character.Humanoid.Health > 0 then
                    local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    if OnScreen then
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                        Tracer.To = Vector2.new(Vector.X, Vector.Y)
                        
                        Tracer.Visible = tracerState
                    else
                        Tracer.Visible = false
                    end
                else
                    Tracer.Visible = false
                end
            end)
        end
        coroutine.wrap(lineesp)()
    end)
    local dwCamera = workspace.CurrentCamera
    local dwRunService = game:GetService("RunService")
    local dwUIS = game:GetService("UserInputService")
    local dwEntities = game:GetService("Players")
    local dwLocalPlayer = dwEntities.LocalPlayer
    local dwMouse = dwLocalPlayer:GetMouse()
    
    local settings = {
        Aimbot = false,
        Aiming = false,
        Aimbot_AimPart = "Head",
        Aimbot_TeamCheck = true,
        Aimbot_Draw_FOV = true,
        Aimbot_FOV_Radius = 200,
        Aimbot_FOV_Color = Color3.fromRGB(255,255,255)
    }
    
    local fovcircle = Drawing.new("Circle")
    fovcircle.Visible = settings.Aimbot_Draw_FOV
    fovcircle.Radius = settings.Aimbot_FOV_Radius
    fovcircle.Color = settings.Aimbot_FOV_Color
    fovcircle.Thickness = 1
    fovcircle.Filled = false
    fovcircle.Transparency = 1
    
    fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)
    
    dwUIS.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton2 then
            settings.Aiming = true
        end
    end)
    
    dwUIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton2 then
            settings.Aiming = false
        end
    end)
    dwRunService.RenderStepped:Connect(function()
        
        local dist = math.huge
        local closest_char = nil
    if settings.Aimbot then
        if settings.Aiming then
    
            for i,v in next, dwEntities:GetChildren() do 
    
                if v ~= dwLocalPlayer and
                v.Character and
                v.Character:FindFirstChild("HumanoidRootPart") and
                v.Character:FindFirstChild("Humanoid") and
                v.Character:FindFirstChild("Humanoid").Health > 0 then
    
                    if settings.Aimbot_TeamCheck == true and
                    v.Team ~= dwLocalPlayer.Team or
                    settings.Aimbot_TeamCheck == false then
    
                        local char = v.Character
                        local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[settings.Aimbot_AimPart].Position)
    
                        if is_onscreen then
    
                            local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude
    
                            if mag < dist and mag < settings.Aimbot_FOV_Radius then
    
                                dist = mag
                                closest_char = char
    
                            end
                        end
                    end
                end
            end
        end
    
            if closest_char ~= nil and
            closest_char:FindFirstChild("HumanoidRootPart") and
            closest_char:FindFirstChild("Humanoid") and
            closest_char:FindFirstChild("Humanoid").Health > 0 then
    
                dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[settings.Aimbot_AimPart].Position)
            end
        end
        while true do
            fovcircle.Visible = settings.Aimbot_Draw_FOV
            task.wait(0.001)
    end
    end)
    --> MENU <--
    local Aimbot=MainTab:CreateToggle({
        Name='Aimbot (BLATANT)',
        CurrentValue=false,
        Flag='arsenal_aimbot',
        Callback=function(state)
            settings.Aimbot=state
            settings.Aimbot_Draw_FOV=state
            print(settings.Aimbot, settings.Aimbot_Draw_FOV)
        end,
    })

     local ESP = VisualTab:CreateToggle({
        Name = "ESP",
        CurrentValue = false,
        Callback = function(Value)
                getgenv().boxESP = Value
        end,
     })
     local Tracer = VisualTab:CreateToggle({
        Name = "tracers",
        CurrentValue = false,
        Callback = function(Value)
            tracerState = Value
            
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
