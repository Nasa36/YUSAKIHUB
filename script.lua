local UserInputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Definindo o UI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

ScreenGui.Name = "Cheat UI"
ScreenGui.Parent = Player.PlayerGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.Position = UDim2.new(0.5, -200, 0.5, -75)
Frame.Size = UDim2.new(0, 400, 0, 150)
Frame.Visible = true

TextLabel.Parent = Frame
TextLabel.BackgroundTransparency = 1
TextLabel.FontSize = Enum.FontSize.Size18
TextLabel.FontFace = Font.new("SourceSansSemibold", Enum.FontWeight.Semibold, Enum.FontStyle.Normal)
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 18
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
TextLabel.TextWrapped = true
TextLabel.TextTransparency = 0.65

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.Size = UDim2.new(0, 100, 0, 50)
TextButton.Position = UDim2.new(0.925, -60, 0.925, -60)
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.TextSize = 18
TextButton.TextStrokeColor3 = Color3.new(1, 1, 1)
TextButton.TextStrokeTransparency = 0.65
TextButton.Text = "MINIMIZE"

-- Declarando variáveis para cheats
local Noclip, Walkspeed, FlyMode, ESPEnabled = false, 16, false

-- Função para alternar noclip
function ToggleNoclip()
    Noclip = not Noclip
    -- Lógica para habilitar/desabilitar noclip
    if Noclip then
        -- Exemplo de implementação de noclip
        Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    else
        -- Reverter para o estado normal
        Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
    TextLabel.Text = "Noclip: " .. tostring(Noclip)
end

-- Função para alternar o modo de voo
function ToggleFlyMode()
    FlyMode = not FlyMode
    if FlyMode then
        -- Habilitar voo
        Humanoid.PlatformStand = true
    else
        -- Desabilitar voo
        Humanoid.PlatformStand = false
    end
    TextLabel.Text = "Fly Mode: " .. tostring(FlyMode)
end

-- Função para habilitar/desabilitar ESP
function ToggleESP()
    ESPEnabled = not ESPEnabled
    -- Atualizar ESP
    TextLabel.Text = "ESP: " .. tostring(ESPEnabled)
end

-- Função para minimizar o UI
function MinimizeUI()
    Frame.Visible = not Frame.Visible
end

-- Adicionando keybinds para alternar cheats e minimizar o UI
UserInputService.InputBegan:Connect(function(inputObject)
    if inputObject.KeyCode == Enum.KeyCode.E then
        ToggleNoclip()
    elseif inputObject.KeyCode == Enum.KeyCode.R then
        ToggleFlyMode()
    elseif inputObject.KeyCode == Enum.KeyCode.T then
        ToggleESP()
    elseif inputObject.KeyCode == Enum.KeyCode.F then
        MinimizeUI()
    end
end)
