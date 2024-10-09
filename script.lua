-- Variáveis Globais
local player = game.Players.LocalPlayer
local userInterface = Instance.new("ScreenGui")
userInterface.Parent = player:WaitForChild("PlayerGui")

-- Função para Controlar o Voo
local flying = false
local speed = 50
local bodyVelocity

function Fly()
    if flying then
        flying = false
        if bodyVelocity then
            bodyVelocity:Destroy()
        end
        player.Character.Humanoid.PlatformStand = false
    else
        flying = true
        player.Character.Humanoid.PlatformStand = true
        bodyVelocity = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Velocity = Vector3.new(0, speed, 0)

        -- Atualiza Velocidade Enquanto Voando
        game:GetService("RunService").Heartbeat:Connect(function()
            if flying then
                bodyVelocity.Velocity = player.Character.HumanoidRootPart.CFrame.LookVector * speed + Vector3.new(0, speed, 0)
            else
                bodyVelocity:Destroy()
            end
        end)
    end
end

-- Função para trazer jogadores para você
local function BringPlayer(targetPlayer)
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        targetPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame -- Mover o jogador selecionado para a posição do jogador local
    end
end

-- UI Frame
local frame = Instance.new("Frame", userInterface)
frame.Size = UDim2.new(0.3, 0, 0.5, 0)
frame.Position = UDim2.new(0.35, 0, 0.25, 0)
frame.Visible = false -- Inicialmente invisível
frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Cor de fundo
frame.BackgroundTransparency = 0.5 -- Transparência da UI (0 é totalmente opaco, 1 é totalmente transparente)

-- Botão de Voo
local buttonFly = Instance.new("TextButton", frame)
buttonFly.Text = "Fly"
buttonFly.Size = UDim2.new(0.8, 0, 0.2, 0)
buttonFly.Position = UDim2.new(0.1, 0, 0.05, 0)
buttonFly.MouseButton1Click:Connect(Fly)

-- Botão para Aumentar Velocidade
local buttonSpeed = Instance.new("TextButton", frame)
buttonSpeed.Text = "Speed +10"
buttonSpeed.Size = UDim2.new(0.8, 0, 0.2, 0)
buttonSpeed.Position = UDim2.new(0.1, 0, 0.25, 0)
buttonSpeed.MouseButton1Click:Connect(function()
    speed = speed + 10
end)

-- Botão de Fechar a UI
local buttonClose = Instance.new("TextButton", frame)
buttonClose.Text = "Close"
buttonClose.Size = UDim2.new(0.8, 0, 0.2, 0)
buttonClose.Position = UDim2.new(0.1, 0, 0.45, 0)
buttonClose.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Botão para Abrir a UI
local buttonOpen = Instance.new("TextButton", userInterface)
buttonOpen.Text = "Open UI"
buttonOpen.Size = UDim2.new(0.1, 0, 0.1, 0)
buttonOpen.Position = UDim2.new(0.9, 0, 0.9, 0)
buttonOpen.MouseButton1Click:Connect(function()
    frame.Visible = true
end)

-- Campo de Texto para Nome do Jogador
local playerNameInput = Instance.new("TextBox", frame)
playerNameInput.Size = UDim2.new(0.8, 0, 0.2, 0)
playerNameInput.Position = UDim2.new(0.1, 0, 0.65, 0)
playerNameInput.PlaceholderText = "Nome do Jogador"
playerNameInput.Text = ""

-- Botão para Trazer Jogador
local buttonBring = Instance.new("TextButton", frame)
buttonBring.Text = "Bring Player"
buttonBring.Size = UDim2.new(0.8, 0, 0.2, 0)
buttonBring.Position = UDim2.new(0.1, 0, 0.85, 0)
buttonBring.MouseButton1Click:Connect(function()
    local targetPlayerName = playerNameInput.Text
    local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
    if targetPlayer then
        BringPlayer(targetPlayer)
    else
        warn("Jogador não encontrado!")
    end
end)

-- Evento ao Adicionar o Personagem
player.CharacterAdded:Connect(function(char)
    -- Certifique-se de que o HumanoidRootPart está disponível
    local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
    buttonFly.MouseButton1Click:Connect(Fly)
end)

-- A primeira execução da função Fly deve ser feita após a UI estar aberta
buttonOpen.MouseButton1Click:Connect(function()
    frame.Visible = true
end)
