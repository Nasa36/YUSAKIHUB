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

        -- Atualiza Velocidade Enquanto Voando
        game:GetService("RunService").Heartbeat:Connect(function()
            if flying then
                local camera = game.Workspace.CurrentCamera
                bodyVelocity.Velocity = (camera.CFrame.LookVector * speed) + Vector3.new(0, speed, 0)
            else
                bodyVelocity:Destroy()
            end
        end)
    end
end

-- Função para trazer todos os jogadores para você
local function BringAllPlayers()
    for _, targetPlayer in pairs(game.Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            targetPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame -- Mover o jogador selecionado para a posição do jogador local
        end
    end
end

-- UI Frame
local frame = Instance.new("Frame", userInterface)
frame.Size = UDim2.new(0.3, 0, 0.5, 0)
frame.Position = UDim2.new(0.35, 0, 0.25, 0)
frame.Visible = false -- Inicialmente invisível
frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Cor de fundo
frame.BackgroundTransparency = 0.5 -- Transparência da UI

-- Botão de Voo
local buttonFly = Instance.new("TextButton", frame)
buttonFly.Text = "Fly"
buttonFly.Size = UDim2.new(0.8, 0, 0.2, 0)
buttonFly.Position = UDim2.new(0.1, 0, 0.05, 0)
buttonFly.MouseButton1Click:Connect(Fly)

-- Botão para Trazer Todos os Jogadores
local buttonBringAll = Instance.new("TextButton", frame)
buttonBringAll.Text = "Bring All Players"
buttonBringAll.Size = UDim2.new(0.8, 0, 0.2, 0)
buttonBringAll.Position = UDim2.new(0.1, 0, 0.25, 0)
buttonBringAll.MouseButton1Click:Connect(BringAllPlayers)

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

-- Evento ao Adicionar o Personagem
player.CharacterAdded:Connect(function(char)
    buttonFly.MouseButton1Click:Connect(Fly)
end)
