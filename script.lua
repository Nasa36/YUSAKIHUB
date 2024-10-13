-- Import required modules  
local Players = game:GetService("Players")  
local RunService = game:GetService("RunService")  
local UserInputService = game:GetService("UserInputService")  
local TweenService = game:GetService("TweenService")  

-- Create the UI  
local UI = Instance.new("ScreenGui")  
UI.Name = "YUSAKIHUB"  
UI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")  -- Alterado para Parent para PlayerGui  

-- Create the main frame  
local Frame = Instance.new("Frame")  
Frame.Name = "Main Frame"  
Frame.Size = UDim2.new(0, 300, 0, 200)  
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)  
Frame.AnchorPoint = Vector2.new(0.5, 0.5)  
Frame.BackgroundTransparency = 0.5  -- Altere a transparência para torná-lo visível  
Frame.BackgroundColor3 = Color3.new(0, 0, 0)  -- Cor de fundo do frame  
Frame.Parent = UI  

-- Create the title label  
local TitleLabel = Instance.new("TextLabel")  
TitleLabel.Name = "Title Label"  
TitleLabel.Size = UDim2.new(0, 200, 0, 20)  
TitleLabel.Position = UDim2.new(0.5, -100, 0, 0)  
TitleLabel.Text = "YUSAKIHUB"  
TitleLabel.Font = Enum.Font.SourceSansBold  
TitleLabel.FontSize = Enum.FontSize.Size24  
TitleLabel.TextColor3 = Color3.new(1, 1, 1)  
TitleLabel.BackgroundTransparency = 1  
TitleLabel.Parent = Frame  

-- Create the fly button  
local FlyButton = Instance.new("TextButton")  
FlyButton.Name = "Fly Button"  
FlyButton.Size = UDim2.new(0, 100, 0, 30)  
FlyButton.Position = UDim2.new(0.5, -50, 0, 30)  
FlyButton.Text = "Fly"  
FlyButton.Font = Enum.Font.SourceSans  
FlyButton.FontSize = Enum.FontSize.Size18  
FlyButton.TextColor3 = Color3.new(1, 1, 1)  
FlyButton.BackgroundTransparency = 0.5  -- Altere a transparência para torná-lo visível  
FlyButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)  -- Cor de fundo do botão  
FlyButton.Parent = Frame  

-- Create the mobile button  
local MobileButton = Instance.new("TextButton")  
MobileButton.Name = "Mobile Button"  
MobileButton.Size = UDim2.new(0, 100, 0, 30)  
MobileButton.Position = UDim2.new(0.5, -50, 0, 70)  
MobileButton.Text = "Mobile"  
MobileButton.Font = Enum.Font.SourceSans  
MobileButton.FontSize = Enum.FontSize.Size18  
MobileButton.TextColor3 = Color3.new(1, 1, 1)  
MobileButton.BackgroundTransparency = 0.5  
MobileButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)  
MobileButton.Parent = Frame  

-- Create the walkspeed slider  
local WalkspeedSlider = Instance.new("Slider")  
WalkspeedSlider.Name = "Walkspeed Slider"  
WalkspeedSlider.Size = UDim2.new(0, 200, 0, 20)  
WalkspeedSlider.Position = UDim2.new(0.5, -100, 0, 110)  
WalkspeedSlider.Minimum = 1  
WalkspeedSlider.Maximum = 100  
WalkspeedSlider.Value = 10  
WalkspeedSlider.Parent = Frame  

-- Create the walkspeed modify button  
local WalkspeedModifyButton = Instance.new("TextButton")  
WalkspeedModifyButton.Name = "Walkspeed Modify Button"  
WalkspeedModifyButton.Size = UDim2.new(0, 100, 0, 30)  
WalkspeedModifyButton.Position = UDim2.new(0.5, -50, 0, 140)  
WalkspeedModifyButton.Text = "Modify Walkspeed"  
WalkspeedModifyButton.Font = Enum.Font.SourceSans  
WalkspeedModifyButton.FontSize = Enum.FontSize.Size18  
WalkspeedModifyButton.TextColor3 = Color3.new(1, 1, 1)  
WalkspeedModifyButton.BackgroundTransparency = 0.5  
WalkspeedModifyButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)  
WalkspeedModifyButton.Parent = Frame  

-- Create the bring players button  
local BringPlayersButton = Instance.new("TextButton")  
BringPlayersButton.Name = "Bring Players Button"  
BringPlayersButton.Size = UDim2.new(0, 100, 0, 30)  
BringPlayersButton.Position = UDim2.new(0.5, -50, 0, 180)  
BringPlayersButton.Text = "Bring Players"  
BringPlayersButton.Font = Enum.Font.SourceSans  
BringPlayersButton.FontSize = Enum.FontSize.Size18  
BringPlayersButton.TextColor3 = Color3.new(1, 1, 1)  
BringPlayersButton.BackgroundTransparency = 0.5  
BringPlayersButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)  
BringPlayersButton.Parent = Frame  

-- Add event listeners  
FlyButton.MouseButton1Click:Connect(function()  
    -- Fly script goes here  
end)  

MobileButton.MouseButton1Click:Connect(function()  
    -- Mobile script goes here  
end)  

WalkspeedSlider.ValueChanged:Connect(function(value)  
    -- Walkspeed script goes here  
end)  

WalkspeedModifyButton.MouseButton1Click:Connect(function()  
    -- Walkspeed modify script goes here  
end)  

BringPlayersButton.MouseButton1Click:Connect(function()  
    -- Bring players script goes here  
end)  

-- Show the UI  
UI.Enabled = true  
