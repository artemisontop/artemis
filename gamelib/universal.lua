       --universal script
       local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
       local Window = Rayfield:CreateWindow({
           Name = "artemis",
           LoadingTitle = "artemis",
           LoadingSubtitle = "universal",
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
              Note = "artemis on top btw (key link copied btw)",
              FileName = "SiriusKey",
              SaveKey = true,
              GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
              Key = "https://pastebin.com/raw/2EFtX1V9"
           }
        })
       local MainTab = Window:CreateTab("Main", 4483362458)
       getgenv().ESP = false
       getgenv().Tracers = false
       getgenv().silentaim = false
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
       
           local HealthBarOutline = Drawing.new("Square")
           HealthBarOutline.Thickness = 3
           HealthBarOutline.Filled = false
           HealthBarOutline.Color = Color3.new(0,0,0)
           HealthBarOutline.Transparency = 1
           HealthBarOutline.Visible = false
       
           local HealthBar = Drawing.new("Square")
           HealthBar.Thickness = 1
           HealthBar.Filled = false
           HealthBar.Transparency = 1
           HealthBar.Visible = false
       
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
       
                           HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                           HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                           HealthBarOutline.Visible = true
       
                           HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                           HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                           HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)
                           HealthBar.Visible = true
       
                           if v.TeamColor == lplr.TeamColor then
                               --- Our Team
                               BoxOutline.Visible = false
                               Box.Visible = false
                               HealthBarOutline.Visible = false
                               HealthBar.Visible = false
                           else
                               ---Enemy Team
                               BoxOutline.Visible = true
                               Box.Visible = true
                               HealthBarOutline.Visible = true
                               HealthBar.Visible = true
                           end
       
                       else
                           BoxOutline.Visible = false
                           Box.Visible = false
                           HealthBarOutline.Visible = false
                           HealthBar.Visible = false
                       end
                   else
                       BoxOutline.Visible = false
                       Box.Visible = false
                       HealthBarOutline.Visible = false
                       HealthBar.Visible = false
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
                               --- Our Team
                               BoxOutline.Visible = false
                               Box.Visible = false
                           else
                               ---Enemy Team
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
       
   MainTab:CreateSlider({
       Name = "Walk Speed",
       Range = {16, 300},
       Increment = 2,
       Suffix = "WalkSpeed",
       CurrentValue = 10,
            Callback = function(speed)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
            end    
        })
       MainTab:CreateSlider({
           Name = "Jump Power",
           Range = {50, 5000},
           Increment = 25,
           Suffix = "JumpPower",
           CurrentValue = 10,
           Callback = function(jump)
               game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
           end    
       })
       MainTab:CreateButton({
           Name = "Fly",
           Callback = function(Value)
               loadstring(game:HttpGet(('https://raw.githubusercontent.com/artemisontop/artemis/main/util/fly.lua')))()
              end    
       })
       MainTab:CreateButton({
           Name = "Anti-AFK",
           Callback = function(Value)
               for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
                   v:Disable()
                   end
           end
       })
   
       MainTab:CreateToggle({
           Name = "Tracers",
           Default = false,
           Callback = function(Value)
               tracerState = Value
           end
       })
       MainTab:CreateToggle({
           Name = "ESP",
           Default = false,
           Callback = function(Value)
               
           end
       })