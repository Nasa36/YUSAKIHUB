-- Import required modules  
local Players = game:GetService("Players")  
local RunService = game:GetService("RunService")  
local UserInputService = game:GetService("UserInputService")  
local TweenService = game:GetService("TweenService")  
  
-- Create the UI  
local UI = Instance.new("ScreenGui")  
UI.Name = "YUSAKIHUB"  
UI.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")  -- Ajuste aqui
  
-- Create the main frame  
local Frame = Instance.new("Frame")  
Frame.Name = "Main Frame"  
Frame.Size = UDim2.new(0, 300, 0, 200)  
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)  
Frame.AnchorPoint = Vector2.new(0.5, 0.5)  
Frame.BackgroundTransparency = 1  
Frame.Parent = UI  
  
-- Create the title label  
local TitleLabel = Instance.new("TextLabel")  
TitleLabel.Name = "Title Label"  
TitleLabel.Size = UDim2.new(0, 200, 0, 20)  
TitleLabel.Position = UDim2.new(0, 0, 0, 0)  
TitleLabel.Text = "YUSAKIHUB"  
TitleLabel.Font = Enum.Font.SourceSans  
TitleLabel.TextSize = 24  -- Ajuste aqui
TitleLabel.TextColor3 = Color3.new(1, 1, 1)  
TitleLabel.BackgroundTransparency = 1  
TitleLabel.Parent = Frame  
  
-- Create the fly button  
local FlyButton = Instance.new("TextButton")  
FlyButton.Name = "Fly Button"  
FlyButton.Size = UDim2.new(0, 100, 0, 20)  
FlyButton.Position = UDim2.new(0, 0, 0, 30)  
FlyButton.Text = "Fly"  
FlyButton.Font = Enum.Font.SourceSans  
FlyButton.TextSize = 18  -- Ajuste aqui
FlyButton.TextColor3 = Color3.new(1, 1, 1)  
FlyButton.BackgroundTransparency = 1  
FlyButton.Parent = Frame  
  
-- Create the mobile button  
local MobileButton = Instance.new("TextButton")  
MobileButton.Name = "Mobile Button"  
MobileButton.Size = UDim2.new(0, 100, 0, 20)  
MobileButton.Position = UDim2.new(0, 0, 0, 60)  
MobileButton.Text = "Mobile"  
MobileButton.Font = Enum.Font.SourceSans  
MobileButton.TextSize = 18  
MobileButton.TextColor3 = Color3.new(1, 1, 1)  
MobileButton.BackgroundTransparency = 1  
MobileButton.Parent = Frame  
  
-- Create the walkspeed modify button  
local WalkspeedModifyButton = Instance.new("TextButton")  
WalkspeedModifyButton.Name = "Walkspeed Modify Button"  
WalkspeedModifyButton.Size = UDim2.new(0, 100, 0, 20)  
WalkspeedModifyButton.Position = UDim2.new(0, 0, 0, 120)  
WalkspeedModifyButton.Text = "Modify Walkspeed"  
WalkspeedModifyButton.Font = Enum.Font.SourceSans  
WalkspeedModifyButton.TextSize = 18  
WalkspeedModifyButton.TextColor3 = Color3.new(1, 1, 1)  
WalkspeedModifyButton.BackgroundTransparency = 1  
WalkspeedModifyButton.Parent = Frame  
  
-- Create the bring players button  
local BringPlayersButton = Instance.new("TextButton")  
BringPlayersButton.Name = "Bring Players Button"  
BringPlayersButton.Size = UDim2.new(0, 100, 0, 20)  
BringPlayersButton.Position = UDim2.new(0, 0, 0, 150)  
BringPlayersButton.Text = "Bring Players"  
BringPlayersButton.Font = Enum.Font.SourceSans  
BringPlayersButton.TextSize = 18  
BringPlayersButton.TextColor3 = Color3.new(1, 1, 1)  
BringPlayersButton.BackgroundTransparency = 1  
BringPlayersButton.Parent = Frame  
  
-- Add event listeners  
FlyButton.MouseButton1Click:Connect(function()  
   print("Fly script goes here")  
end)  
  
MobileButton.MouseButton1Click:Connect(function()  
   print("Mobile script goes here")  
end)  
  
WalkspeedModifyButton.MouseButton1Click:Connect(function()  
   print("Walkspeed modify script goes here")  
end)  
  
BringPlayersButton.MouseButton1Click:Connect(function()  
   print("Bring players script goes here")  
end)  
  
-- Show the UI  
UI.Enabled = true
