local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
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

-- Botão para abrir/fechar a UI
Window:MakeButton({
    Name = "Toggle UI",
    Callback = function()
        Window.Visible = not Window.Visible
    end,
})

-- Adicione outros botões ou funcionalidades aqui
-- Exemplo de um botão de trazer jogador
Window:MakeButton({
    Name = "Bring Player",
    Callback = function()
        -- Lógica para trazer jogador
    end,
})

-- Exemplo de toggle
Window:AddToggle({
    Name = "Ativar Voo",
    Default = false,
    Callback = function(value)
        -- Lógica para ativar/desativar voo
    end,
})

-- Finaliza a UI
OrionLib:Init()
