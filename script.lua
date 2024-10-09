local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "YUSAKI HUB",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "YusakiHubConfig",
    IntroEnabled = true,
    IntroText = "Bem-vindo ao YUSAKI HUB!",
    IntroIcon = "https://i.imgur.com/xP4Jux2.png", -- Link da imagem para IntroIcon
    Icon = "https://i.imgur.com/y4Z3yqV.png", -- Link da imagem para Icon
})

-- Variáveis de Voo
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local flying = false
local flightSpeed = 50
local rainbowEnabled = false
local originalColors = {} -- Tabela para armazenar as cores originais
local rainbowSpeed = 0.1

-- Função para armazenar as cores originais das partes
local function storeOriginalColors()
    for _, part in ipairs(Character:GetChildren()) do
        if part:IsA("BasePart") then
            originalColors[part] = part.Color -- Armazena a cor original
        end
    end
end

-- Função para ativar o voo
local function fly()
    if flying then
        return
    end

    flying = true
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Parent = Character.PrimaryPart

    local function onFly()
        local camera = workspace.CurrentCamera
        local direction = (camera.CFrame.LookVector * flightSpeed)

        bodyVelocity.Velocity = Vector3.new(direction.X, bodyVelocity.Velocity.Y, direction.Z)
    end

    -- Ativa o voo
    game:GetService("RunService").Heartbeat:Connect(onFly)

    -- Desativar voo quando o jogador não estiver mais voando
    local function stopFly()
        flying = false
        bodyVelocity:Destroy()
    end

    -- Remover o voo se o jogador for derrubado ou se a função de voo for desativada
    Humanoid.Died:Connect(stopFly)
end

-- Função para parar o voo
local function stopFlying()
    if flying then
        flying = false
        -- Remover a força do corpo
        Character.PrimaryPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
    end
end

-- Função para trazer o jogador
local function bringPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local targetCharacter = targetPlayer.Character
        targetCharacter:MoveTo(Player.Character.HumanoidRootPart.Position)
    end
end

-- Função para ativar o modo arco-íris
local function startRainbowMode()
    rainbowEnabled = true
    storeOriginalColors() -- Armazena as cores originais
    while rainbowEnabled do
        local hue = tick() % 5 / 5 -- Muda a cor ao longo do tempo
        for _, part in ipairs(Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = Color3.fromHSV(hue, 1, 1)
            end
        end
        wait(rainbowSpeed)
    end
end

-- Função para parar o modo arco-íris
local function stopRainbowMode()
    rainbowEnabled = false
    -- Restaurar as cores originais
    for part, color in pairs(originalColors) do
        if part:IsA("BasePart") then
            part.Color = color -- Restaura a cor original
        end
    end
end

-- Função para abrir e fechar a UI
local function toggleUI()
    Window.Visible = not Window.Visible
end

-- Botão para abrir/fechar a UI
Window:MakeButton({
    Name = "Toggle UI",
    Callback = toggleUI,
})

-- Botão para trazer um jogador
Window:MakeButton({
    Name = "Bring Player",
    Callback = function()
        local players = game.Players:GetPlayers()
        for _, player in ipairs(players) do
            if player ~= Player then
                bringPlayer(player) -- Puxa o jogador para o jogador local
            end
        end
    end,
})

-- Toggle para ativar/desativar o voo
Window:AddToggle({
    Name = "Ativar Voo",
    Default = false,
    Callback = function(value)
        if value then
            fly()
        else
            stopFlying()
        end
    end,
})

-- Slider para ajustar a velocidade do voo
Window:AddSlider({
    Name = "Velocidade do Voo",
    Min = 0,
    Max = 200,
    Default = 100,
    Color = Color3.fromRGB(255, 0, 0),
    Increment = 5,
    Callback = function(value)
        flightSpeed = value -- Ajusta a velocidade do voo
    end,
})

-- Toggle para ativar/desativar o modo arco-íris
Window:AddToggle({
    Name = "Ativar Modo Arco-Íris",
    Default = false,
    Callback = function(value)
        if value then
            startRainbowMode()
        else
            stopRainbowMode()
        end
    end,
})

-- Finaliza a UI
OrionLib:Init()
