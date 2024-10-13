-- Import required modules  
local Players = game:GetService("Players")  
local RunService = game:GetService("RunService")  
local UserInputService = game:GetService("UserInputService")  
local TweenService = game:GetService("TweenService")  
  
-- Create the UI  
local UI = Instance.new("ScreenGui")  
UI.Name = "YUSAKIHUB"  
UI.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")  -- Mudei para PlayerGui
  
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
TitleLabel.FontSize = Enum.FontSize.Size24  
TitleLabel.TextColor3 = Color3.new(1, 1, 1)  
TitleLabel.BackgroundTransparency = 1  
TitleLabel.Parent = Frame  
  
-- Add your other UI elements here...

-- Show the UI  
UI.Enabled = true
