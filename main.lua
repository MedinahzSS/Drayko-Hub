-- DRAYKO UNIVERSAL - interface inicial para seu próprio jogo no Roblox Studio
-- Coloque este código em um LocalScript dentro de StarterPlayerScripts.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local COLORS = {
    background = Color3.fromRGB(18, 20, 29),
    panel = Color3.fromRGB(28, 32, 45),
    accent = Color3.fromRGB(55, 130, 255),
    text = Color3.fromRGB(245, 247, 255),
    muted = Color3.fromRGB(165, 174, 195),
    danger = Color3.fromRGB(230, 75, 90),
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DraykoUniversalUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Tela de carregamento
local loading = Instance.new("Frame")
loading.Name = "Loading"
loading.AnchorPoint = Vector2.new(0.5, 0.5)
loading.Position = UDim2.fromScale(0.5, 0.5)
loading.Size = UDim2.fromOffset(300, 120)
loading.BackgroundColor3 = COLORS.background
loading.Parent = screenGui
Instance.new("UICorner", loading).CornerRadius = UDim.new(0, 12)

local loadingTitle = Instance.new("TextLabel")
loadingTitle.BackgroundTransparency = 1
loadingTitle.Position = UDim2.fromOffset(12, 14)
loadingTitle.Size = UDim2.new(1, -24, 0, 28)
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.Text = "DRAYKO UNIVERSAL"
loadingTitle.TextColor3 = COLORS.text
loadingTitle.TextSize = 18
loadingTitle.Parent = loading

local loadingText = Instance.new("TextLabel")
loadingText.BackgroundTransparency = 1
loadingText.Position = UDim2.fromOffset(12, 45)
loadingText.Size = UDim2.new(1, -24, 0, 20)
loadingText.Font = Enum.Font.Gotham
loadingText.Text = "Loading..."
loadingText.TextColor3 = COLORS.muted
loadingText.TextSize = 13
loadingText.Parent = loading

local barBack = Instance.new("Frame")
barBack.Position = UDim2.fromOffset(16, 82)
barBack.Size = UDim2.new(1, -32, 0, 7)
barBack.BackgroundColor3 = Color3.fromRGB(48, 54, 72)
barBack.Parent = loading
Instance.new("UICorner", barBack).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.fromScale(0, 1)
barFill.BackgroundColor3 = COLORS.accent
barFill.Parent = barBack
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

TweenService:Create(barFill, TweenInfo.new(1.1, Enum.EasingStyle.Quad), {
    Size = UDim2.fromScale(1, 1)
}):Play()

task.wait(1.2)
loading:Destroy()

-- Painel principal
local panel = Instance.new("Frame")
panel.Name = "MainPanel"
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.Position = UDim2.fromScale(0.5, 0.5)
panel.Size = UDim2.fromOffset(390, 300)
panel.BackgroundColor3 = COLORS.background
panel.Parent = screenGui
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(60, 72, 100)
stroke.Thickness = 1
stroke.Parent = panel

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundColor3 = COLORS.panel
header.Parent = panel
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 14)

local headerCover = Instance.new("Frame")
headerCover.Position = UDim2.new(0, 0, 1, -12)
headerCover.Size = UDim2.new(1, 0, 0, 12)
headerCover.BackgroundColor3 = COLORS.panel
headerCover.BorderSizePixel = 0
headerCover.Parent = header

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(14, 0)
title.Size = UDim2.new(1, -110, 1, 0)
title.Font = Enum.Font.GothamBold
title.Text = "DRAYKO UNIVERSAL"
title.TextColor3 = COLORS.text
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local function makeHeaderButton(label, x, color)
    local button = Instance.new("TextButton")
    button.Size = UDim2.fromOffset(30, 28)
    button.Position = UDim2.new(1, x, 0, 10)
    button.AnchorPoint = Vector2.new(1, 0)
    button.BackgroundColor3 = color
    button.Text = label
    button.TextColor3 = COLORS.text
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.AutoButtonColor = true
    button.Parent = header
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 7)
    return button
end

local minimizeButton = makeHeaderButton("—", -48, Color3.fromRGB(70, 80, 103))
local closeButton = makeHeaderButton("×", -12, COLORS.danger)

local body = Instance.new("Frame")
body.BackgroundTransparency = 1
body.Position = UDim2.fromOffset(14, 60)
body.Size = UDim2.new(1, -28, 1, -74)
body.Parent = panel

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Size = UDim2.new(1, 0, 0, 25)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "Interface de exemplo para seu próprio jogo"
subtitle.TextColor3 = COLORS.muted
subtitle.TextSize = 12
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = body

local function makeTabButton(label, y)
    local button = Instance.new("TextButton")
    button.Position = UDim2.fromOffset(0, y)
    button.Size = UDim2.new(1, 0, 0, 38)
    button.BackgroundColor3 = COLORS.panel
    button.Text = label
    button.TextColor3 = COLORS.text
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 13
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.AutoButtonColor = true
    button.Parent = body
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 12)
    padding.Parent = button
    return button
end

local homeButton = makeTabButton("Início  •  Interface carregada", 34)
local settingsButton = makeTabButton("Configurações  •  Atalho K", 80)
local helpButton = makeTabButton("Ajuda  •  Projeto de exemplo", 126)

local status = Instance.new("TextLabel")
status.BackgroundTransparency = 1
status.Position = UDim2.new(0, 0, 1, -25)
status.Size = UDim2.new(1, 0, 0, 20)
status.Font = Enum.Font.Gotham
status.Text = "Pronto"
status.TextColor3 = COLORS.accent
status.TextSize = 12
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = body

homeButton.MouseButton1Click:Connect(function()
    status.Text = "A interface está funcionando."
end)

settingsButton.MouseButton1Click:Connect(function()
    status.Text = "Atalho: K mostra ou esconde o painel."
end)

helpButton.MouseButton1Click:Connect(function()
    status.Text = "Adicione aqui recursos do seu próprio jogo."
end)

-- Orbe flutuante para reabrir o painel
local orb = Instance.new("TextButton")
orb.Name = "FloatingButton"
orb.AnchorPoint = Vector2.new(0.5, 0.5)
orb.Position = UDim2.new(0.85, 0, 0.5, 0)
orb.Size = UDim2.fromOffset(54, 54)
orb.BackgroundColor3 = COLORS.accent
orb.Text = "D"
orb.TextColor3 = COLORS.text
orb.Font = Enum.Font.GothamBold
orb.TextSize = 22
orb.Visible = false
orb.Parent = screenGui
Instance.new("UICorner", orb).CornerRadius = UDim.new(1, 0)

local function makeDraggable(guiObject, dragHandle)
    local dragging = false
    local dragStart
    local startPosition
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(
                startPosition.X.Scale, startPosition.X.Offset + delta.X,
                startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(panel, header)
makeDraggable(orb, orb)

minimizeButton.MouseButton1Click:Connect(function()
    panel.Visible = false
    orb.Visible = true
end)

orb.MouseButton1Click:Connect(function()
    panel.Visible = true
    orb.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.K then
        if screenGui.Parent then
            if panel.Visible then
                panel.Visible = false
                orb.Visible = true
            else
                panel.Visible = true
                orb.Visible = false
            end
        end
    end
end)
