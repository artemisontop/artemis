
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Highlight = Instance.new("Highlight")
Highlight.Name = "Highlight"
function ApplyToCurrentPlayers()
    for i,player in pairs(Players:GetChildren()) do 
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local HighlightClone = Highlight:Clone()
            HighlightClone.Adornee = player.Character
            HighlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            HighlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            HighlightClone.Name = "Highlight"
            HighlightClone.FillColor = Color3.new(0.078431, 0.4, 0.772549)
            HighlightClone.OutlineColor = Color3.new(255,255,255)
        end
    end
end    
RunService.Heartbeat:Connect(function()
    ApplyToCurrentPlayers()
end)